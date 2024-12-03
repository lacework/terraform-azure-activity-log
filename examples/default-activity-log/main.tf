provider "azurerm" {
  subscription_id = "00000000-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source = "../../"
} 
