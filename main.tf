locals {
  storage_account_id   = var.use_existing_storage_account ? data.azurerm_storage_account.lacework[0].id : azurerm_storage_account.lacework[0].id
  storage_account_name = var.use_existing_storage_account ? var.storage_account_name : (
    length(var.storage_account_name) > 0 ? var.storage_account_name : substr("${var.prefix}storage${random_id.uniq.hex}", 0, 24)
  )
  storage_account_resource_group = var.use_existing_storage_account ? data.azurerm_storage_account.lacework[0].resource_group_name : azurerm_resource_group.lacework[0].name
  subscription_ids = var.all_subscriptions ? (
    // the user wants to grant access to all subscriptions
    [for s in data.azurerm_subscriptions.available.subscriptions : s.subscription_id]
    ) : (
    // or, if the user wants to grant a list of subscriptions, if none then we default to the primary subscription
    length(var.subscription_ids) > 0 ? var.subscription_ids : [data.azurerm_subscription.primary.subscription_id]
  )
  application_id       = var.use_existing_ad_application ? var.application_id : module.az_ad_application.application_id
  application_password = var.use_existing_ad_application ? var.application_password : module.az_ad_application.application_password
  service_principal_id = var.use_existing_ad_application ? var.service_principal_id : module.az_ad_application.service_principal_id
  tenant_id = var.use_existing_ad_application ? data.azurerm_subscription.primary.tenant_id : module.az_ad_application.tenant_id
}


module "az_ad_application" {
  source  = "lacework/ad-application/azure"
  version = "~> 1.0"
  create  = var.use_existing_ad_application ? false : true
  application_name  = var.application_name
}

resource "random_id" "uniq" {
  byte_length = 4
}

#this module must be called after using the "lacework/ad-application/azure" module 1.0 which has unbundled the AzureRM resources
# and supports MS Graph API to set Directory Reader AD role.

resource "azurerm_resource_group" "lacework" {
  count    = var.use_existing_storage_account ? 0 : 1
  name     = "${var.prefix}-group-${random_id.uniq.hex}"
  location = var.location
  tags     = var.tags
}

# NOTE: storage name can only consist of lowercase letters and numbers,
# and must be between 3 and 24 characters long
data "azurerm_storage_account" "lacework" {
  count               = var.use_existing_storage_account ? 1 : 0
  name                = local.storage_account_name
  resource_group_name = var.storage_account_resource_group
}

resource "azurerm_storage_account" "lacework" {
  count                     = var.use_existing_storage_account ? 0 : 1
  name                      = local.storage_account_name
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
  location                  = var.location
  resource_group_name       = azurerm_resource_group.lacework[0].name
  tags                      = azurerm_resource_group.lacework[0].tags
  #enable_blob_encryption    = true
}

resource "azurerm_storage_queue" "lacework" {
  name = "${var.prefix}-queue-${random_id.uniq.hex}"
  storage_account_name = var.use_existing_storage_account ? (
    data.azurerm_storage_account.lacework[0].name
    ) : (
    azurerm_storage_account.lacework[0].name
  )
}

resource "azurerm_eventgrid_event_subscription" "lacework" {
  name  = "${var.prefix}-subscription-${random_id.uniq.hex}"
  scope = local.storage_account_id

  storage_queue_endpoint {
    queue_name         = azurerm_storage_queue.lacework.name
    storage_account_id = local.storage_account_id
  }

  subject_filter {
    subject_begins_with = "/blobServices/default/containers/insights"
    #this works with both Log Exports (container name is insights-operational-logs) and Diagnostic Settings (insights-activity-logs)
  }

  included_event_types = [
    "Microsoft.Storage.BlobCreated"
  ]
}

# resource "azurerm_monitor_log_profile" "lacework" {
#   count              = var.use_existing_log_profile ? 0 : 1
#   name               = local.log_profile_name
#   locations          = var.log_profile_locations
#   storage_account_id = azurerm_storage_account.lacework[0].id

#   categories = [
#     "Action",
#     "Delete",
#     "Write",
#   ]

#   # TODO @afiune customize these settings
#   retention_policy {
#     enabled = true
#     days    = 7
#   }
# }


data "azurerm_subscriptions" "available" {}

#create Diag Settings on all subscriptions requested by user, centralizing logs in single storage
resource "azurerm_monitor_diagnostic_setting" "lacework" {
  name  = var.diagnostic_settings_name #TODO: don't re-use log-profile name for diag-settings name
  count = length(local.subscription_ids)
  target_resource_id = "/subscriptions/${local.subscription_ids[count.index]}"
  storage_account_id = local.storage_account_id

  log {
    category = "Administrative"
    enabled  = true
  } 
  log {
    category = "Security"
    enabled  = true
  }
  log {
    category = "Alert"
    enabled  = true
  }
  log {
    category = "Policy"
    enabled  = true
  }
  log {
    category = "ResourceHealth"
    enabled  = true
  }
  log {
    category = "Autoscale"
    enabled  = false
  }
  log {
    category = "Recommendation"
    enabled  = false
  }
  log {
    category = "ServiceHealth"
    enabled  = false
  }
}

#we take the current AZ CLI context's subscription as the placeholder for the centralized storage account
data "azurerm_subscription" "primary" {}

#centralized storage account, we only need a single role to read from a single storage account
resource "azurerm_role_definition" "lacework" {
  name        = "${var.prefix}-role-${random_id.uniq.hex}"
  description = "Used by Lacework to monitor Activity Logs"
  scope       = "${data.azurerm_subscription.primary.id}/resourceGroups/${local.storage_account_resource_group}"

  assignable_scopes = [
    "${data.azurerm_subscription.primary.id}/resourceGroups/${local.storage_account_resource_group}"
  ]

  permissions {
    actions = [
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Storage/storageAccounts/read",
      "Microsoft.Storage/storageAccounts/blobServices/containers/read",
      "Microsoft.Storage/storageAccounts/queueServices/queues/read",
      "Microsoft.EventGrid/eventSubscriptions/read",
      "Microsoft.Storage/storageAccounts/listkeys/action"
    ]

    data_actions = [
      "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read",
      "Microsoft.Storage/storageAccounts/queueServices/queues/messages/read",
      "Microsoft.Storage/storageAccounts/queueServices/queues/messages/delete"
    ]
  }
}

resource "azurerm_role_assignment" "lacework" {
  role_definition_id = azurerm_role_definition.lacework.role_definition_resource_id
  principal_id       = local.service_principal_id
  scope              = "${data.azurerm_subscription.primary.id}/resourceGroups/${local.storage_account_resource_group}"
}

# wait for X seconds for the Azure resources to be created
resource "time_sleep" "wait_time" {
  create_duration = var.wait_time
  depends_on = [
    azurerm_eventgrid_event_subscription.lacework,
    azurerm_storage_queue.lacework,
    azurerm_role_assignment.lacework
  ]
}

resource "lacework_integration_azure_al" "lacework" {
  name      = var.lacework_integration_name
  tenant_id = local.tenant_id
  queue_url = "https://${local.storage_account_name}.queue.core.windows.net/${azurerm_storage_queue.lacework.name}"
  credentials {
    client_id     = local.application_id
    client_secret = local.application_password
  }
  depends_on = [time_sleep.wait_time]
}
