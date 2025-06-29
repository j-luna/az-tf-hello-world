/*
module "rg" {
  source   = "git::https://github.com/j-luna/terraform-modules-azure.git//resource-group?ref=v0.0.2"
  name     = var.resource_group_name
  location = var.location
}

module "plan" {
  source              = "git::https://github.com/j-luna/terraform-modules-azure.git//service-plan?ref=v0.0.2"
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = module.rg.name
  sku_name            = var.sku_name
  os_type             = var.os_type
}
*/


resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}


resource "azurerm_service_plan" "app_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.web_app_name
  location            = var.location
  resource_group_name = rg.name
  service_plan_id     = app_plan.id

  site_config {
    application_stack {
      node_version = "20-lts"
    }
    always_on = false
  }

  app_settings = {
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"
    "WEBSITE_RUN_FROM_PACKAGE" = "0"
  }
} 
