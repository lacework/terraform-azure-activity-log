# Integrate Azure with Lacework for Activity Log Analysis with storage account network rules

The following example shows configuring storage account network rules. Whenuse_storage_account_network_rules is enabled the default network rule action is set to DENY. The Terraform Caller must be added to the allowed ip rules to enable Terraform management such as subsequent terraform apply or terraform destroy.

## Sample Code

```hcl
provider "azurerm" {
  features {}
}

provider "lacework" {}

module "az_activity_log" {
  source  = "lacework/activity-log/azure"
  version = "~> 3.0"

  use_storage_account_network_rules = true

  # Example of allowed user Ip addresses. Should Include the Terraform caller.
  storage_account_network_rule_ip_rules = ["34.208.85.38"]
}
```

For detailed information on integrating Lacework with Azure, see [Azure Compliance & Activity Log Integrations - Terraform From Any Supported Host](https://docs.lacework.com/onboarding/azure-compliance-and-activity-log-integrations-terraform-from-any-supported-host).

For detailed information on customizing the `azurerm` provider, see [the Terraform Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs).
