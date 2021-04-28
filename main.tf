provider "azurerm" {
    version = "~>2.0"
    features {}
}

resource "azurerm_app_service_plan" "scratch" {
  name                = "example-appserviceplan"
  location            = var.location
  resource_group_name = var.resource_group

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service_source_control_token" "dobble_token" {
  type  = "GitHub"
  token = "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"
}

resource "azurerm_app_service" "dobble" {
  name                = "dobble-app-service"
  location            = var.location
  resource_group_name = var.resource_group
  app_service_plan_id = azurerm_app_service_plan.scratch.id

  source_control {
    repo_url = var.repo_url
  }
}
