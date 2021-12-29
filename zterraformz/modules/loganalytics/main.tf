resource "azurerm_log_analytics_workspace" "test" {
    # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
    name                = var.log_analytics_workspace_name
    location            = var.log_analytics_workspace_rglocation
    resource_group_name = var.log_analytics_workspace_rgname
    sku                 = var.log_analytics_workspace__sku
}



