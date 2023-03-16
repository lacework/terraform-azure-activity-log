# Integrate Multiple Azure Subscriptions within a Tenant

The following example integrates multiple Azure subscriptions within a
single Azure tenant.

```hcl
provider "azurerm" {
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source  = "lacework/activity-log/azure"
  version = "~> 2.0"

  subscription_ids = [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000001",
    "00000000-0000-0000-0000-000000000002",
    "00000000-0000-0000-0000-000000000003"
  ]
}
```

For detailed information on integrating Lacework with Azure see [Azure Compliance & Activity Log Integrations - Terraform From Any Supported Host](https://docs.lacework.com/onboarding/azure-compliance-and-activity-log-integrations-terraform-from-any-supported-host)
