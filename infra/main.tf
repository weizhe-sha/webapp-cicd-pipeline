variable "github_username" {
  type      = string
  sensitive = true
}

variable "github_PAT" {
  type      = string
  sensitive = true
}

resource "azurerm_resource_group" "rg" {
  name     = "proa-interview"
  location = "Australia East"
}

resource "azurerm_service_plan" "asp" {
  name                = "proa-asp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "proa-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id
  depends_on          = [azurerm_service_plan.asp]
  https_only          = true
  site_config {
    always_on           = false
    minimum_tls_version = "1.2"
    application_stack {
      # python_version = file("${path.module}/../.python-version")
      docker_registry_url      = "https://ghcr.io"
      docker_image_name        = "weizhe-sha/proa-interview:main"
      docker_registry_username = var.github_username
      docker_registry_password = var.github_PAT
    }
  }
}

# resource "azurerm_app_service" "app" {
#   name                = "proa-app"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   app_service_plan_id = azurerm_app_service_plan.asp.id

#   site_config {
#     # python_version =file("${path.root}/.python-version")
#     linux_fx_version = "DOCKER|ghcr.io/weizhe-sha/proa-interview:latest"
#   }

#   app_settings = {
#     WEBSITES_PORT = "80"
#   }
# }
