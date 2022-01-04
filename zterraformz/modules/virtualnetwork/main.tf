resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.vnet_location
  resource_group_name = var.vnet_resource_group_name
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
}

