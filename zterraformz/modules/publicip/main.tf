resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  resource_group_name = var.public_ip_resource_group_name
  location            = var.public_ip_resource_group_location
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku


}


