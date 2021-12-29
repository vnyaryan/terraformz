resource "azurerm_log_analytics_solution" "aksmonitoring" {
    
    solution_name         = "ContainerInsights"
    location              = var.log_analytics_solution_location
    resource_group_name   = var.log_analytics_solution_resource_group_name
    workspace_resource_id = var.workspace_resource_id
    workspace_name        = var.workspace_name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}


