terraform {
  required_version = ">= 0.12.31"

  required_providers {
    azuread = ">= 0.11"
    azurerm = "~> 2.26.0"
    random  = ">= 2.1"
    lacework = {
      source  = "lacework/lacework"
      version = "~> 0.3"
    }
  }
}
