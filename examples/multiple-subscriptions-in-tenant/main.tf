provider "azurerm" {
  subscription_id = "00000000-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source = "../../"
  subscription_ids = [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000001",
    "00000000-0000-0000-0000-000000000002",
    "00000000-0000-0000-0000-000000000003"
  ]
}
