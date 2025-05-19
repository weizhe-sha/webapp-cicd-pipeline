variable "github_PAT" {
  type = string
  sensitive = true
}

variable "github_username" {
  type = string
  sensitive = true
}

variable "image_name" {
  type = string
}

import {
  id = ## resoucre group id ##
  to = azurerm_resource_group.rg
}

resource "azurerm_resource_group" "rg" {
  name     = ## resource group name ##
  location = ## resource group location ##
}

resource "azurerm_service_plan" "asp" {
  name                = ## asp name ##
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = ## webapp name ##
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id
  depends_on          = [azurerm_service_plan.asp]
  https_only          = false
  site_config {
    minimum_tls_version = "1.2"
    always_on           = false
    application_stack {
      docker_registry_password = var.github_PAT
      docker_image_name = var.image_name
      docker_registry_username = var.github_username
    }
  }
  app_settings = {
    "WEBSITES_PORT" = 5000
  }
}