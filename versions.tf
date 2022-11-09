terraform {
  required_version = ">= 0.14"

  required_providers {
    azurerm = "~> 2.28"
    random  = ">= 2.1"
    lacework = {
      source  = "lacework/lacework"
      version = "~> 1.0"
    }
  }
}
