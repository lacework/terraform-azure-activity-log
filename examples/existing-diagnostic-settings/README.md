# Integrate Azure with Lacework for Activity Log Analysis with an Existing Diagnostic Settings

The following example integrates an Azure tenant and the default subscription with Lacework
for Activity Log analysis using an existing Diagnostic Settings.

```hcl
provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000001"
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source  = "lacework/activity-log/azure"
  version = "~> 3.0"

  use_existing_diagnostic_settings = true
  diagnostic_settings_name = "diagnostic-settings-name"
}
```

For detailed information on integrating Lacework with Azure, see [Azure Compliance & Activity Log Integrations - Terraform From Any Supported Host](https://docs.lacework.com/onboarding/azure-compliance-and-activity-log-integrations-terraform-from-any-supported-host).
