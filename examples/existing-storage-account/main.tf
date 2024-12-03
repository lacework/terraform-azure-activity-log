provider "azuread" {}

provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000001"
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source = "../../"

  use_existing_storage_account   = true
  storage_account_name           = "storageaccountname"
  storage_account_resource_group = "storage-account-resource-group"
}
