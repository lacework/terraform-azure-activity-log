locals {
  application_id       = var.use_existing_ad_application ? var.application_id : module.az_al_ad_application.application_id
  application_password = var.use_existing_ad_application ? var.application_password : module.az_al_ad_application.application_password
  log_profile_name     = length(var.log_profile_name) > 0 ? var.log_profile_name : "${var.prefix}-log-profile-${random_id.uniq.hex}"
  service_principal_id = var.use_existing_ad_application ? var.service_principal_id : module.az_al_ad_application.service_principal_id
  storage_account_id   = var.use_existing_storage_account ? data.azurerm_storage_account.lacework[0].id : azurerm_storage_account.lacework[0].id
  storage_account_name = var.use_existing_storage_account ? var.storage_account_name : (
    length(var.storage_account_name) > 0 ? var.storage_account_name : substr("${var.prefix}storage${random_id.uniq.hex}", 0, 24)
  )
  storage_account_resource_group = var.use_existing_storage_account ? data.azurerm_storage_account.lacework[0].resource_group_name : azurerm_resource_group.lacework[0].name
}

resource "random_id" "uniq" {
  byte_length = 4
}

module "az_al_ad_application" {
  source                      = "lacework/ad-application/azure"
  version                     = "~> 0.1"
  create                      = var.use_existing_ad_application ? false : true
  application_name            = var.application_name
  application_identifier_uris = var.application_identifier_uris
  subscription_ids            = var.subscription_ids
  all_subscriptions           = var.all_subscriptions
  key_vault_ids               = var.key_vault_ids
  tenant_id                   = var.tenant_id
  password_length             = var.password_length
}

resource "azurerm_resource_group" "lacework" {
  count    = var.use_existing_storage_account ? 0 : 1
  name     = "${var.prefix}-group-${random_id.uniq.hex}"
  location = var.location
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
  #enable_blob_encryption    = true
}

resource "azurerm_storage_queue" "lacework" {
  name                 = "${var.prefix}-queue-${random_id.uniq.hex}"
  storage_account_name = local.storage_account_name
}

resource "azurerm_eventgrid_event_subscription" "lacework" {
  name  = "${var.prefix}-subscription-${random_id.uniq.hex}"
  scope = local.storage_account_id

  storage_queue_endpoint {
    queue_name         = azurerm_storage_queue.lacework.name
    storage_account_id = local.storage_account_id
  }

  subject_filter {
    subject_begins_with = "/blobServices/default/containers/insights-operational-logs/"
  }

  included_event_types = [
    "Microsoft.Storage.BlobCreated"
  ]
}

resource "azurerm_monitor_log_profile" "lacework" {
  count              = var.use_existing_log_profile ? 0 : 1
  name               = local.log_profile_name
  locations          = var.log_profile_locations
  storage_account_id = azurerm_storage_account.lacework[0].id

  categories = [
    "Action",
    "Delete",
    "Write",
  ]

  # TODO @afiune customize these settings
  retention_policy {
    enabled = true
    days    = 7
  }
}

data "azurerm_role_definition" "queue_processor" {
  name = "Storage Queue Data Message Processor"
}

resource "azurerm_role_assignment" "lacework" {
  role_definition_id = data.azurerm_role_definition.queue_processor.name
  principal_id       = local.service_principal_id
  scope              = local.storage_account_id
}

# wait for X seconds for the Azure resources to be created
resource "time_sleep" "wait_time" {
  create_duration = var.wait_time
  depends_on = [
    azurerm_eventgrid_event_subscription.lacework,
    azurerm_monitor_log_profile.lacework,
    azurerm_role_assignment.lacework,
    module.az_al_ad_application
  ]
}

resource "lacework_integration_azure_al" "default" {
  name      = var.lacework_integration_name
  tenant_id = module.az_al_ad_application.tenant_id
  queue_url = "https://${local.storage_account_name}.queue.core.windows.net/${azurerm_storage_queue.lacework.name}"
  credentials {
    client_id     = local.application_id
    client_secret = local.application_password
  }
  depends_on = [time_sleep.wait_time]
}
