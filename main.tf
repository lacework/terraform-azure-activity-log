locals {
  subscription_ids = var.all_subscriptions ? (
    // the user wants to grant access to all subscriptions
    [for s in data.azurerm_subscriptions.available.subscriptions : s.subscription_id if s.state == "Enabled" && !contains(var.subscription_exclusions, s.subscription_id)]
    ) : (
    // or, if the user wants to grant a list of subscriptions,
    // if none then we default to the primary subscription
    length(var.subscription_ids) > 0 ? var.subscription_ids : [data.azurerm_subscription.primary.subscription_id]
  )
  application_id       = var.use_existing_ad_application ? var.application_id : module.az_ad_application.application_id
  application_password = var.use_existing_ad_application ? var.application_password : module.az_ad_application.application_password
  service_principal_id = var.use_existing_ad_application ? var.service_principal_id : module.az_ad_application.service_principal_id
  storage_account_id   = var.use_existing_storage_account ? data.azurerm_storage_account.lacework[0].id : azurerm_storage_account.lacework[0].id
  storage_account_name = var.use_existing_storage_account ? var.storage_account_name : (
    length(var.storage_account_name) > 0 ? var.storage_account_name : substr("${var.prefix}storage${random_id.uniq.hex}", 0, 24)
  )
  storage_account_resource_group_name = var.use_existing_storage_account ? (
    data.azurerm_storage_account.lacework[0].resource_group_name
    ) : (
    azurerm_resource_group.lacework[0].name
  )
  storage_account_resource_group_location = var.use_existing_storage_account ? (
    data.azurerm_storage_account.lacework[0].location
    ) : (
    azurerm_resource_group.lacework[0].location
  )
  diagnostic_settings_name = var.use_existing_diagnostic_settings ? var.diagnostic_settings_name : "${var.prefix}-${var.diagnostic_settings_name}-${random_id.uniq.hex}"
  version_file             = "${abspath(path.module)}/VERSION"
  module_name              = "terraform-azure-activity-log"
  module_version           = fileexists(local.version_file) ? file(local.version_file) : ""
  existing_subnet_id       = var.use_existing_subnet ? var.existing_subnet_id : azurerm_subnet.lacework[0].id
}

module "az_ad_application" {
  source           = "lacework/ad-application/azure"
  version          = "~> 2.0"
  create           = var.use_existing_ad_application ? false : true
  application_name = var.application_name
}

resource "random_id" "uniq" {
  byte_length = 4
}

resource "azurerm_resource_group" "lacework" {
  count    = var.use_existing_storage_account ? 0 : 1
  name     = "${var.prefix}-group-${random_id.uniq.hex}"
  location = var.location
  tags     = var.tags
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

# NOTE: storage name can only consist of lowercase letters and numbers,
# and must be between 3 and 24 characters long
data "azurerm_storage_account" "lacework" {
  count               = var.use_existing_storage_account ? 1 : 0
  name                = local.storage_account_name
  resource_group_name = var.storage_account_resource_group
}

resource "azurerm_storage_account" "lacework" {
  count                             = var.use_existing_storage_account ? 0 : 1
  name                              = local.storage_account_name
  account_kind                      = "StorageV2"
  account_tier                      = "Standard"
  account_replication_type          = "LRS"
  https_traffic_only_enabled        = true
  location                          = var.location
  resource_group_name               = azurerm_resource_group.lacework[0].name
  tags                              = azurerm_resource_group.lacework[0].tags
  min_tls_version                   = "TLS1_2"
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  allow_nested_items_to_be_public   = false
  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = var.log_retention_days
    }
  }
}

resource "azurerm_storage_account_network_rules" "lacework" {
  count = var.use_storage_account_network_rules && !var.use_existing_storage_account ? 1 : 0

  storage_account_id = local.storage_account_id
  default_action     = var.storage_account_network_rule_action
  bypass             = var.storage_account_network_rule_bypass
  ip_rules = concat(var.storage_account_network_rule_ip_rules,
  var.storage_account_network_rule_lacework_ip_rules)

  virtual_network_subnet_ids = [local.existing_subnet_id]

  depends_on = [azurerm_storage_queue.lacework]
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
    # this works with both:
    #  1. Log Exports (container name is insights-operational-logs)
    #  2. Diagnostic Settings (insights-activity-logs)
  }

  included_event_types = [
    "Microsoft.Storage.BlobCreated"
  ]
}

# create Diag Settings on all subscriptions requested by user, centralizing logs in single storage
resource "azurerm_monitor_diagnostic_setting" "lacework" {
  for_each = toset(local.subscription_ids)

  name               = local.diagnostic_settings_name
  target_resource_id = "/subscriptions/${each.key}"
  storage_account_id = local.storage_account_id

  enabled_log {
    category = "Administrative"
  }
  enabled_log {
    category = "Security"
  }
  enabled_log {
    category = "Alert"
  }
  enabled_log {
    category = "Policy"
  }
  enabled_log {
    category = "ResourceHealth"
  }

  # Currently required for https://github.com/hashicorp/terraform-provider-azurerm/issues/8131
  lifecycle {
    ignore_changes = [
      log_analytics_destination_type
    ]
  }
}

# we take the current AZ CLI context subscription as the placeholder for the centralized storage account
data "azurerm_subscription" "primary" {}
data "azurerm_subscriptions" "available" {}

# centralized storage account, we only need a single role to read from a single storage account
resource "azurerm_role_definition" "lacework" {
  name        = "${var.prefix}-role-${random_id.uniq.hex}"
  description = "Used by Lacework to monitor Activity Logs"
  scope       = "${data.azurerm_subscription.primary.id}/resourceGroups/${local.storage_account_resource_group_name}"

  assignable_scopes = [
    "${data.azurerm_subscription.primary.id}/resourceGroups/${local.storage_account_resource_group_name}"
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
  scope              = "${data.azurerm_subscription.primary.id}/resourceGroups/${local.storage_account_resource_group_name}"
}

# wait for X seconds for the Azure resources to be created
resource "time_sleep" "wait_time" {
  create_duration = var.wait_time
  depends_on = [
    azurerm_eventgrid_event_subscription.lacework,
    azurerm_storage_queue.lacework,
    azurerm_monitor_diagnostic_setting.lacework,
    azurerm_role_assignment.lacework
  ]
  triggers = {
    # If App ID changes, trigger a wait between lacework_integration_azure_al destroys and re-creates, to avoid API errors
    app_id = local.application_id
    # If the Integration object changes (like during upgrade to v1.0), trigger a wait between lacework_integration_azure_al destroys and re-creates, to avoid API errors
    integration_name = var.lacework_integration_name
  }

}

resource "lacework_integration_azure_al" "lacework" {
  name      = var.lacework_integration_name
  tenant_id = data.azurerm_subscription.primary.tenant_id
  queue_url = "https://${local.storage_account_name}.queue.core.windows.net/${azurerm_storage_queue.lacework.name}"
  credentials {
    client_id     = local.application_id
    client_secret = local.application_password
  }
  depends_on = [time_sleep.wait_time]
}

data "lacework_metric_module" "lwmetrics" {
  name    = local.module_name
  version = local.module_version
}

# virtual network and subnet
resource "azurerm_virtual_network" "lacework" {
  count               = var.use_existing_subnet ? 0 : 1
  name                = "lacework-vnet"
  address_space       = var.virtual_network_address_space
  location            = local.storage_account_resource_group_location
  resource_group_name = local.storage_account_resource_group_name
}

resource "azurerm_subnet" "lacework" {
  count                = var.use_existing_subnet ? 0 : 1
  name                 = "lacework-subnet"
  resource_group_name  = local.storage_account_resource_group_name
  virtual_network_name = azurerm_virtual_network.lacework[0].name
  address_prefixes     = var.subnet_address_prefixes
  service_endpoints    = ["Microsoft.Storage"]

  private_endpoint_network_policies  = var.private_endpoint_network_policies_enabled
}

resource "azurerm_private_endpoint" "lacework" {
  name                = "lacework-private-endpoint"
  location            = local.storage_account_resource_group_location
  resource_group_name = local.storage_account_resource_group_name
  subnet_id           = local.existing_subnet_id

  private_service_connection {
    name                           = "lacework-privateserviceconnection"
    is_manual_connection           = false
    private_connection_resource_id = local.storage_account_id
    subresource_names              = ["queue"]
  }
}

output "lacework_integration_guid" {
  description = "GUID of the created Lacework integration"
  value       = lacework_integration_azure_al.lacework.intg_guid
}
