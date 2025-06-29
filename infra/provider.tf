terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.4"
}

provider "azurerm" {
  features {}
  subscription_id = "0e1e019f-db36-4b38-b1bf-801f9954426d"
}