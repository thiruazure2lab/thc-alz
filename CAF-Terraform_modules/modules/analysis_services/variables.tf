variable "name" {
  description = "(Required)  The name of the Analysis Services Server"
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group in which the Analysis Services Server should be exist"
}

variable "location" {
  description = "(Required) The Azure location where the Analysis Services Server exists."
}

variable "sku" {
  description = "(Required) SKU for the Analysis Services Server"
}

variable "admin_users" {
  description = "List of email addresses of admin users."
  default = []
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource"
}

variable "backup_blob_container_uri" {
  description = "URI and SAS of the storage account for Backup"
  default = null
}

variable "base_tags" {}

variable "global_settings" {}

variable "enable_power_bi_service" {
  description = "(Optional) Indicates if the Power BI service is allowed to access or not."
}

variable "ipv4_firewall_rule" {
  description = "One or more ipv4_firewall_rule block(s) as defined below."
  default = {}
}