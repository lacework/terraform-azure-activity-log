provider "azuread" {}

provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000001"
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source = "../../"

  use_existing_diagnostic_settings = true
  diagnostic_settings_name = "diagnostic-settings-name"
}
