resource "azuread_group" "azure_admin" {
  display_name     = var.az_admin_display_name
  mail_enabled     = var.az_admin_mail_enabled
  mail_nickname    = var.az_admin_mail_nickname
  security_enabled = var.az_admin_security_enabled
  types            = ["Unified"]


}

