
variable "keyvaultname" {
    type = string
    
	
}
   
   

variable "rglocation" {
    type = string
   
   
}


variable "resource_group_name" {
    type = string


}


variable "storage_account_name" {
    type = string


}



variable "storage_account_tier" {
    type = string


}


variable "storage_replication_type" {
    type = string


}




variable "virtual_network_address_space" {
   type = list

 }



variable "virtual_network_name" {
   type = string

 }




variable "subnet_name" {
   type = string

 }


variable "address_prefixes" {

   type = list

 }




variable "acr_name" {
   type = string

 }



variable "acr_sku_value" { 
  type = string

 }





variable "log_analytics_workspace_name" {

   type = string

 }




variable "log_analytics_workspace_name_sku" {
   type = string

 }





variable "public_ip_name" {
  type = string
   

}


 variable "public_ip_allocation_method" {
   type = string

}

variable "public_ip_sku" {
   type = string

}




variable "user_assigned_identity_name" {
  type = string


}

variable "role_definition_name" {
    type = string


}


variable "az_admin_display_name" {
    type = string


}

variable "az_admin_mail_enabled" {
    type = string

}

variable "az_admin_mail_nickname" {
    type = string

}


variable "az_admin_security_enabled" {
    type = string

}


variable "aks_name" {
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







