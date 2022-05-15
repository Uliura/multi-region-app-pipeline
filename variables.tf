variable "RESOURCE_GROUP_NAME" {
  description = "Default resource group name that the database will be created in."
}

variable "LOCATION" {
  description = "The location/region where the database and server are created. Changing this forces a new resource to be created."
}

variable "LOCATION_1" {
  description = "The location/region where the database and server are created. Changing this forces a new resource to be created."
}

variable "LOCATION_2" {
  description = "The location/region where the database and server are created. Changing this forces a new resource to be created."
}


variable "APP_SERVICE_PLAN_NAME_1" {
  type        = string
  description = "App Service Plan name in Azure"
}

variable "APP_SERVICE_NAME_1" {
  type        = string
  description = "App Service name in Azure"
}

variable "APP_SERVICE_PLAN_NAME_2" {
  type        = string
  description = "App Service Plan name in Azure"
}

variable "APP_SERVICE_NAME_2" {
  type        = string
  description = "App Service name in Azure"
}

variable "APP_PLAN_SKU_NAME" {
  type        = string
    validation {
    condition     = contains(["S1","P1V2"], var.APP_PLAN_SKU_NAME)
    error_message = "The Plan value can be S1 or P1V2 only."
  }
}

variable "APP_PLAN_OS_TYPE" {
  type        = string
    validation {
    condition     = contains(["Linux", "Windows"], var.APP_PLAN_OS_TYPE)
    error_message = "The OS type must be Linux or Windows."
  }
}

variable "APP_SLOT_NAME" {
  type        = string
  description = "App slot name in Azure"
}

variable "PYTHON_VERSION" {
  type        = string
}