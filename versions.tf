terraform {
  required_version = ">= 0.12.31"

  required_providers {
    azuread = "~> 1.2"
    azurerm = "~> 2.26"
    random  = ">= 2.1"
    lacework = {
      source  = "lacework/lacework"
      version = "~> 0.3"
    }
  }
}
