variable "aks_name" {
    type = string


}

variable "resource_group_location" {
    type = string
}

variable "resource_group_name" {
    type = string

}


variable "aks_dns_prefix" {
   type = string

}

variable "node_resource_group" {
   type = string

}


variable "aks_vm_size" {
   type = string

}



variable "aks_os_disk_size_gb" {
   type = string

}



variable "aks_availability_zones" {
   type = list

}




variable "aks_auto_scaling" {
   type = string

}



variable "aks_min_count" {
   type = string

}

variable "aks_max_count" {
   type = string

}

variable "aks_vnet_subnet_id" {
   type = string

}

variable "aks_admin_group_object_ids" {
   type = list
}


variable "aks_outbound_ip_address_ids" {
   type = list

}



variable "aks_log_analytics_workspace_id" {
   type = string

}




