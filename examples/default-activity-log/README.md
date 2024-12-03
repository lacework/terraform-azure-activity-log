# Integrate Azure with Lacework for Activity Log Analysis with Default Settings

The following example integrates an Azure tenant and the default subscription with Lacework
for Activity Log analysis using default values.

## Sample Code

```hcl
provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000001"
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source  = "lacework/activity-log/azure"
  version = "~> 3.0"
}
```

For detailed information on integrating Lacework with Azure, see [Azure Compliance & Activity Log Integrations - Terraform From Any Supported Host](https://docs.lacework.com/onboarding/azure-compliance-and-activity-log-integrations-terraform-from-any-supported-host).

## Selecting a different Subscription ID

By default, all resources are provisioned to the default subscription of the Azure tenant. You can change
that behavior by providing the `subscription_id` argument inside the `azurerm` provider, or by setting the
`ARM_SUBSCRIPTION_ID` environment variable.

Here is an example of integrating a few subscriptions and selecting a different subscription from the default
where Lacework will deploy all the cloud resources.

```hcl
provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000002" // Not the default subscription
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source  = "lacework/activity-log/azure"
  version = "~> 3.0"
  subscription_ids = [
    "00000000-0000-0000-0000-000000000000", // The default subscription
    "00000000-0000-0000-0000-000000000001",
    "00000000-0000-0000-0000-000000000002",
    "00000000-0000-0000-0000-000000000003"
  ]
}
```

For detailed information on customizing the `azurerm` provider, see [the Terraform Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs).
