terraform {
  required_version = ">= 0.12.31"

  required_providers {
    azurerm = "~> 2.28"
    random  = ">= 2.1"
    lacework = {
      source  = "lacework/lacework"
      version = "~> 0.3"
    }
  }
}
