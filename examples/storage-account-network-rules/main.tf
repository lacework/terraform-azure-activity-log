provider "azurerm" {
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source = "../../"

  use_storage_account_network_rule_action = true
}
