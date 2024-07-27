variable "global_settings" {
  description = "Global settings object (see module README.md)"
}
variable "settings" {}
variable "base_tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = map(any)
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group where to create the resource."
  type        = string
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created."
  type        = string
}
variable "keyvaults" {
  description = "Keyvault to store the SSH public and private keys when not provided by the var.public_key_pem_file or retrieve admin username and password"
  default     = ""
}
variable "subnetId" {
  type = string
}

variable "client_config" {
  description = "Client configuration object (see module README.md)."
}