
import {
  id = "/subscriptions/e76f596f-9840-402c-b029-334dc07167a1/resourceGroups/proa-interview"
  to = azurerm_resource_group.rg
}

import {
  id = "/subscriptions/e76f596f-9840-402c-b029-334dc07167a1/resourceGroups/proa-interview/providers/Microsoft.Web/sites/proa-webapp"
  to = azurerm_linux_web_app.webapp
}

import {
  id = "/subscriptions/e76f596f-9840-402c-b029-334dc07167a1/resourceGroups/proa-interview/providers/Microsoft.Web/serverFarms/proa-asp"
  to = azurerm_service_plan.asp
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "proa-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id
  depends_on          = [azurerm_service_plan.asp]
  https_only          = false
  site_config {
    minimum_tls_version = "1.2"
    always_on           = false
    application_stack {
      docker_registry_url = "https://ghcr.io"
      docker_image_name        = "${var.github_repo}:${var.repo_branch}"
      docker_registry_username = var.github_username
      docker_registry_password = var.github_PAT
    }
  }
}