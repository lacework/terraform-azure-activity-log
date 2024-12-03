# Integrate All Azure Subscriptions within a Tenant

The following example integrates all Azure subscriptions within a
single Azure tenant with Lacework for Activity Log analysis.

```hcl
provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000001"
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source  = "lacework/activity-log/azure"
  version = "~> 3.0"

  all_subscriptions = true
}
```
For detailed information on integrating Lacework with Azure, see [Azure Compliance & Activity Log Integrations - Terraform From Any Supported Host](https://docs.lacework.com/onboarding/azure-compliance-and-activity-log-integrations-terraform-from-any-supported-host).
