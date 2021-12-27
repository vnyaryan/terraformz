
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




