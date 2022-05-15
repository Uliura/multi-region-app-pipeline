terraform {
   backend "azurerm" {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.RESOURCE_GROUP_NAME
  location = var.LOCATION
}

module "FirstApp" {
  source                    = "./modules/App"
  app_service_plan_name     = var.APP_SERVICE_PLAN_NAME_1
  resource_group_name       = var.RESOURCE_GROUP_NAME
  location                  = var.LOCATION_1
  app_plan_sku_name         = var.APP_PLAN_SKU_NAME
  app_plan_os_type          = var.APP_PLAN_OS_TYPE
  app_service_name          = var.APP_SERVICE_NAME_1
  app_slot_name             = var.APP_SLOT_NAME
  python_version            = var.PYTHON_VERSION
depends_on = [ 
  azurerm_resource_group.rg  
]
}

module "SecondApp" {
  source                    = "./modules/App"
  app_service_plan_name     = var.APP_SERVICE_PLAN_NAME_2
  resource_group_name       = var.RESOURCE_GROUP_NAME
  location                  = var.LOCATION_2
  app_plan_sku_name         = var.APP_PLAN_SKU_NAME
  app_plan_os_type          = var.APP_PLAN_OS_TYPE
  app_service_name          = var.APP_SERVICE_NAME_2
  app_slot_name             = var.APP_SLOT_NAME
  python_version            = var.PYTHON_VERSION
depends_on = [ 
  azurerm_resource_group.rg  
]
}

module "frontdoor" {
  source                    = "./modules/FrontDoor"
  resource_group_name       = var.RESOURCE_GROUP_NAME 
depends_on = [ 
  module.SecondApp,
  module.FirstApp 
]
}