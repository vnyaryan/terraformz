resource "azurerm_storage_account" "storage" {
  name                     = var.straccount_name
  resource_group_name      = var.strresource_group
  location                 = var.strlocation
  account_tier             = var.straccount_tier
  account_replication_type = var.strreplication_type

 
}

