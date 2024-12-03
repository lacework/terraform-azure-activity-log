provider "azurerm" {
  subscription_id = "00000000-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source = "../../"

  use_storage_account_network_rules = true

  # Example of allowed user Ip addresses. Should Include the Terraform caller.
  storage_account_network_rule_ip_rules = ["34.208.85.38"]
}
