provider "azuread" {}

provider "azurerm" {
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source = "../../"

  use_existing_storage_account   = true
  storage_account_name           = "storageaccountname"
  storage_account_resource_group = "storage-account-resource-group"

  use_existing_log_profile = true
  log_profile_name         = "log-profile-name"
}
