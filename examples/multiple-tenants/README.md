# Integrate Multiple Azure Tenants

The following example integrates multiple Azure tenants and all their subscriptions with Lacework for Activity Log analysis.

```hcl
provider "lacework" {}

# Tenant 1
provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000001"
  tenant_id = "00000000-0000-0000-0000-000000000001"
  alias     = "tenant_1"
  features {}
}
module "az_activity_log_tenant_1" {
  source  = "lacework/activity-log/azure"
  version = "~> 3.0"

  providers = {
    azurerm = azurerm.tenant_2
  }

  all_subscriptions = true
}

# Tenant 2
provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000002"
  tenant_id = "00000000-0000-0000-0000-000000000002"
  alias     = "tenant_2"
  features {}
}
module "az_activity_log_tenant_2" {
  source  = "lacework/activity-log/azure"
  version = "~> 3.0"

  providers = {
    azurerm = azurerm.tenant_2
  }

  all_subscriptions = true
}
```

For detailed information on integrating Lacework with Azure. see [Azure Compliance & Activity Log Integrations - Terraform From Any Supported Host](https://docs.lacework.com/onboarding/azure-compliance-and-activity-log-integrations-terraform-from-any-supported-host).
