# Integrate Existing Azure Activity Logs with Lacework for Activity Log Analysis

The following example integrates an Azure tenant and the default subscription with Lacework for Activity Log analysis using default values.

```hcl
provider "azuread" {}

provider "azurerm" {
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source  = "lacework/activity-log/azure"
  version = "~> 0.1"

  use_existing_storage_account   = true
  storage_account_name           = "storageaccountname"
  storage_account_resource_group = "storage-account-resource-group"

  use_existing_log_profile = true
  log_profile_name         = "log-profile-name"
}
```

For detailed information on integrating Lacework with Azure see [Azure Compliance & Activity Log Integrations - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360058966313-Azure-Compliance-Activity-Log-Integrations-Terraform-From-Any-Supported-Host)
