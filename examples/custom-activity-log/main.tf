provider "azurerm" {
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source                    = "../../"
  application_name          = "my-custom-application-name"
  lacework_integration_name = "custom name"
  prefix                    = "customprefix"
  location                  = "Central US"
}
