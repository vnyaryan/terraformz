resource "azurerm_kubernetes_cluster" "aks" {
  name                            = var.aks_name
  location                        = var.resource_group_location
  resource_group_name             = var.resource_group_name
  dns_prefix                      = var.aks_dns_prefix
  node_resource_group             =  var.node_resource_group

  default_node_pool {
    name                = "systempool"
    type                = "VirtualMachineScaleSets"
    vm_size             = var.aks_vm_size
    os_disk_size_gb     = var.aks_os_disk_size_gb 
    availability_zones  = var.aks_availability_zones
    enable_auto_scaling = var.aks_auto_scaling
    min_count           = var.aks_min_count
    max_count           = var.aks_max_count 
    vnet_subnet_id      = var.aks_vnet_subnet_id 

  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control {
    enabled = true
    azure_active_directory {
      azure_rbac_enabled     = true
      managed                = true
      admin_group_object_ids = var.aks_admin_group_object_ids
    }
  }

  network_profile {
    network_plugin      = "azure"
    network_policy      = "azure"
        load_balancer_sku   = "Standard"
            load_balancer_profile {
                   outbound_ip_address_ids = var.aks_outbound_ip_address_ids
         }
  }

  addon_profile {
    azure_policy {
      enabled = true
    }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.aks_log_analytics_workspace_id
    }
  }


 }


