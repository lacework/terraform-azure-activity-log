# Integrate Azure with Lacework for Activity Log Analysis Using Custom Configuration

The following example integrates an Azure tenant and the default subscription with Lacework for Activity Log analysis. This example customizes the integration using module inputs.

# Sample Code

```hcl
provider "azuread" {}

provider "azurerm" {
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source                      = "lacework/activity-log/azure"
  version                     = "~> 0.1"

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
```

For detailed information on integrating Lacework with Azure see [Azure Compliance & Activity Log Integrations - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360058966313-Azure-Compliance-Activity-Log-Integrations-Terraform-From-Any-Supported-Host)
