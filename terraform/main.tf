provider "azurerm" {
}

resource "azurerm_resource_group" "rg" {
  name     = "proa-interview"
  location = "Australia East"
}

resource "azurerm_app_service_plan" "asp" {
  name                = "proa-asp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "app" {
  name                = "proa-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    # python_version =file("${path.root}/.python-version")
    linux_fx_version = "DOCKER|ghcr.io/weizhe-sha/proa-interview:latest"
  }

  app_settings = {
    WEBSITES_PORT = "80"
  }
}
