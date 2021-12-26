terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id   = "a80e6116-038e-4cd9-87ec-3543895d290a"
  tenant_id         = "61f0e387-5434-46f4-aef2-ba7f5f7cf226"
  client_id         = "e436d7e5-2f55-4c51-af33-de6fa0d583e7"
  client_secret     = "Idri1hzp4KS5wi5OfsFA2IBR~zARzc~p_C"
}



resource "azurerm_resource_group" "resgroup" {
  name     = var.rgname
  location = var.rglocation
}

data "azurerm_client_config" "current" {}

module "keyvault" {
 depends_on  = [azurerm_resource_group.resgroup]  
 source =  "/root/terraformz/zterraformz/modules/keyvault"

 kvname = var.keyvaultname
 kvlocation  = var.rglocation
 kvrgname  = var.rgname
 tenantid = data.azurerm_client_config.current.tenant_id
 objectid = data.azurerm_client_config.current.object_id

}

