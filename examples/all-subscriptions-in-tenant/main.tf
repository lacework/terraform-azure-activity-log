provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000001"
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source            = "../../"
  all_subscriptions = true
}
