terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "kddi-rg"
    storage_account_name = "kddistg"
    container_name       = "preprodcontainer"
    key                  = "tfstate"
  }
}

provider "azurerm" {
  features {}
}