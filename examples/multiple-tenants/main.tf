provider "lacework" {}

# Tenant 1
provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000001"
  tenant_id = "00000000-0000-0000-0000-000000000001"
  alias     = "tenant_1"
  features {}
}
module "az_activity_log_tenant_1" {
  source = "../../"
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
  source = "../../"
  providers = {
    azurerm = azurerm.tenant_2
  }
  all_subscriptions = true
}
