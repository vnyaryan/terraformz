resource "azurerm_key_vault" "example" {
  name                        = var.kvname
  location                    = var.kvlocation
  resource_group_name         = var.kvrgname
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenantid
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = var.tenantid
    object_id = var.objectid

    key_permissions = [
      "Get",
	  "List",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

