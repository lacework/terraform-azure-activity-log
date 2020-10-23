provider "azuread" {}

provider "azurerm" {
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source                      = "../../"
  application_identifier_uris = ["https://account.lacework.net"]
  application_name            = "my-custom-application-name"
  tenant_id                   = "123abc12-abcd-1234-abcd-abcd12340123"
  password_length             = 16
  lacework_integration_name   = "custom name"
  prefix                      = "customprefix"
  location                    = "Central US"
  key_vault_ids = [
    "/subscriptions/1234abcd-1234-abcd-a1b3-abcd12345xyz/resourceGroups/lwresourcegroup/providers/Microsoft.KeyVault/vaults/keyvault1",
    "/subscriptions/1234abcd-1234-abcd-a1b3-abcd12345xyz/resourceGroups/lwresourcegroup/providers/Microsoft.KeyVault/vaults/keyvault2",
    "/subscriptions/1234abcd-1234-abcd-a1b3-abcd12345xyz/resourceGroups/lwresourcegroup/providers/Microsoft.KeyVault/vaults/keyvault3"
  ]
}
