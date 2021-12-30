resource "azurerm_user_assigned_identity" "identity" {
  name                = var.user_assigned_identity_name
  resource_group_name = var.user_assigned_identity_resource_group_name
  location            = var.user_assigned_identity_resource_group_location
  
} 




