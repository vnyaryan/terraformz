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





module "resourcegroup" {
  source =  "/root/terraformz/zterraformz/modules/resourcegroup"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.rglocation

}

/*

module "bes_resourcegroup_wait_40_seconds"{
  source = "/root/terraformz/zterraformz/modules/helper/timer"

   dependency = module.bes_resourcegroup.resource_group_name
   #dependency = var.resource_group_name
   wait_in_seconds     = "40"
}

*/


data "azurerm_client_config" "current" {}

module "keyvault" {
 depends_on  = [module.resourcegroup.id]
 source =  "/root/terraformz/zterraformz/modules/keyvault"

 kvname = var.keyvaultname
 kvlocation  = module.resourcegroup.resource_group_location
 kvrgname  =  module.resourcegroup.resource_group_name
 tenantid = data.azurerm_client_config.current.tenant_id
 objectid = data.azurerm_client_config.current.object_id

}




module "storage" {
 depends_on  = [module.keyvault]
 source =  "/root/terraformz/zterraformz/modules/storageaccount"

 straccount_name     = var.storage_account_name
 strlocation         = module.resourcegroup.resource_group_location
 strresource_group   = module.resourcegroup.resource_group_name
 straccount_tier     = var.storage_account_tier
 strreplication_type = var.storage_replication_type

}


module "vnet" {
 depends_on  = [module.storage]
 source =  "/root/terraformz/zterraformz/modules/virtualnetwork"

 vnet_name                = var.virtual_network_name
 vnet_address_space       = var.virtual_network_address_space
 vnet_location            = module.resourcegroup.resource_group_location
 vnet_resource_group_name = module.resourcegroup.resource_group_name


}


module "vnetsubnet" {
 depends_on  = [module.vnet]
 source =  "/root/terraformz/zterraformz/modules/vnetsubnet"

 subnet_name                      = var.subnet_name
 subnet_resource_group_name       = module.resourcegroup.resource_group_name
 subnet_vnet_name                 = var.virtual_network_name
 address_prefixes                 = var.address_prefixes


}




module "acr" {
 depends_on  = [module.vnetsubnet]
 source =  "/root/terraformz/zterraformz/modules/acr"

 acr_name                      = var.acr_name
 acr_resource_group_name       = module.resourcegroup.resource_group_name
 acr_location                  = module.resourcegroup.resource_group_location
 acr_sku                       = var.acr_sku_value


}




module "loganalytics" {
 depends_on  = [module.acr]
 source =  "/root/terraformz/zterraformz/modules/loganalytics"

 log_analytics_workspace_name            =  var.log_analytics_workspace_name
 log_analytics_workspace_rglocation      =  module.resourcegroup.resource_group_location
 log_analytics_workspace_rgname          =  module.resourcegroup.resource_group_name
 log_analytics_workspace__sku            =  var.log_analytics_workspace_name_sku


}


module "loganalytics_solution" {
  depends_on  = [module.loganalytics]
  source =  "/root/terraformz/zterraformz/modules/logsolution"

  log_analytics_solution_location                 =  module.resourcegroup.resource_group_location
  log_analytics_solution_resource_group_name      =  module.resourcegroup.resource_group_name
  workspace_name                                  =  module.loganalytics.name
  workspace_resource_id                           =  module.loganalytics.id

}




module "publicip" {
 depends_on  = [module.loganalytics_solution]
 source =  "/root/terraformz/zterraformz/modules/publicip"

 public_ip_name                     =  var.public_ip_name
 public_ip_resource_group_name      =  module.resourcegroup.resource_group_name
 public_ip_resource_group_location  =  module.resourcegroup.resource_group_location
 public_ip_allocation_method        =  var.public_ip_allocation_method
 public_ip_sku                      =  var.public_ip_sku

}




