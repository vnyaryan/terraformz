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





module "bes_resourcegroup" {
  source =  "/root/terraformz/zterraformz/modules/resourcegroup"
  
  resource_group_name = var.resource_group_name
  resource_group_location = "westus2" 

} 


module "bes_resourcegroup_wait_40_seconds"{
  source = "/root/terraformz/zterraformz/modules/helper/timer"
  
   dependency = module.bes_resourcegroup.resource_group_name
   #dependency = var.resource_group_name
   wait_in_seconds     = "40"
}




data "azurerm_client_config" "current" {}

module "keyvault" {
 depends_on  = [module.bes_resourcegroup.id]
 source =  "/root/terraformz/zterraformz/modules/keyvault"

 kvname = var.keyvaultname
 kvlocation  = var.rglocation
 kvrgname  = module.bes_resourcegroup_wait_40_seconds.dependency
 tenantid = data.azurerm_client_config.current.tenant_id
 objectid = data.azurerm_client_config.current.object_id

}



module "storage" {
 depends_on  = [module.keyvault]
 source =  "/root/zterraformz/modules/storageaccount"

 straccount_name     = var.storage_account_name
 strlocation         = var.rglocation
 strresource_group   = module.bes_resourcegroup_wait_40_seconds.dependency
 straccount_tier     = var.storage_account_tier
 strreplication_type = var.storage_replication_type

}


module "vnet" {
 depends_on  = [module.storage]
 source =  "/root/zterraformz/modules/virtualnetwork"

 vnet_name                = var.virtual_network_name
 vnet_address_space       = var.virtual_network_address_space
 vnet_location            = var.rglocation
 vnet_resource_group_name = module.bes_resourcegroup_wait_40_seconds.dependency
 

}


module "vnetsubnet" {
 depends_on  = [module.vnet]
 source =  "/root/zterraformz/modules/vnetsubnet"

 subnet_name                      = var.subnet_name
 subnet_resource_group_name       = module.bes_resourcegroup_wait_40_seconds.dependency
 subnet_vnet_name                 = var.virtual_network_name
 address_prefixes                 = var.address_prefixes


}




module "acr" {
 depends_on  = [module.vnetsubnet]
 source =  "/root/zterraformz/modules/acr"

 acr_name                      = var.acr_name
 acr_resource_group_name       = module.bes_resourcegroup_wait_40_seconds.dependency
 acr_location                  = var.rglocation
 acr_sku                       = var.acr_sku_value


}




