provider "azurerm" {
  features {}

  subscription_id = "6b7097c9-ae20-4f36-8fee-3a795de5a7a9"
}

provider "lacework" {}

module "az_activity_log" {
  source = "../../"
}
