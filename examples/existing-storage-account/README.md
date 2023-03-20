# Integrate Azure with Lacework for Activity Log Analysis with an Existing Storage Account

The following example integrates an Azure tenant and the default subscription with Lacework
for Activity Log analysis using an existing Storage Account.

```hcl
provider "azurerm" {
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source  = "lacework/activity-log/azure"
  version = "~> 2.0"

  use_existing_storage_account   = true
  storage_account_name           = "storageaccountname"
  storage_account_resource_group = "storage-account-resource-group"
}
```

For detailed information on integrating Lacework with Azure, see [Azure Compliance & Activity Log Integrations - Terraform From Any Supported Host](https://docs.lacework.com/onboarding/azure-compliance-and-activity-log-integrations-terraform-from-any-supported-host).
