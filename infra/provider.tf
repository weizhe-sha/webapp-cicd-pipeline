terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.29.0"
    }
  }
  required_version = ">= 0.14.9"
  backend "azurerm" {
    resource_group_name  = ## storage account resource group name ##
    storage_account_name = ## storage account name ##
    container_name       = ## container name ##
    key                  = "infra.tfstate"
  }
}
provider "azurerm" {
  subscription_id = ## subscription id ##
  features {}
}