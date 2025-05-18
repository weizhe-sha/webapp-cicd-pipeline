terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.29.0"
    }
  }
  required_version = ">= 0.14.9"
  backend "azurerm" {
    resource_group_name  = "terraform-state"
    storage_account_name = "proastg"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  subscription_id = "e76f596f-9840-402c-b029-334dc07167a1"
  features {}
}