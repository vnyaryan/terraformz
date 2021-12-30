resource "azurerm_role_assignment" "role" {
  scope                = var.scopeid
  role_definition_name = var.role_definition_name
  principal_id         = var.principal_id 
}


