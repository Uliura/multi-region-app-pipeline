provider "azurerm" {
    subscription_id = "a4634be0-8c57-4abe-9c19-60e1f7843718"
    client_id = "fa2f8089-455d-4ded-ac99-5fe384f19a0b"
    client_secret = "T_y4LjytVEl09E0liwAR-fJ6xu5H7Go40n"
    tenant_id = "eec4dce1-8ec8-497f-a6bf-7aae86446635"
  features {}
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.2"
    }
  }
}