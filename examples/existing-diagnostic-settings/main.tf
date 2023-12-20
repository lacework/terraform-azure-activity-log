provider "azuread" {}

provider "azurerm" {
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source = "../../"

  use_existing_diagnostic_settings = true
  diagnostic_settings_name = "diagnostic-settings-name"
}
