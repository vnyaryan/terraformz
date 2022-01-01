resource "azurerm_postgresql_server" "postgresql" {
  name                = var.postgresql_name
  location            = var.postgresql_location
  resource_group_name = var.resource_group_name

  administrator_login          = var.postgresql_username
  administrator_login_password = var.postgresql_password

  sku_name   = var.postgresql_sku
  version    = var.postgresql_version
  storage_mb = var.postgresql_storage_mb

  backup_retention_days        = var.postgresql_backup_retention_days
  geo_redundant_backup_enabled = var.postgresql_geo_redundant_backup_enabled
  auto_grow_enabled            = var.postgresql_auto_grow_enabled

  public_network_access_enabled    = var.postgresql_public_network_access_enabled
  ssl_enforcement_enabled          = var.postgresql_ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced = var.postgresql_ssl_minimal_tls_version_enforced
}



