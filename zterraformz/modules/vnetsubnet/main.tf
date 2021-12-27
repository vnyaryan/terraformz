
resource "azurerm_subnet" "subent" {
  name                 = var.subnet_name
  resource_group_name  = var.subnet_resource_group_name
  virtual_network_name = var.subnet_vnet_name
  address_prefixes     = var.address_prefixes

 
}
