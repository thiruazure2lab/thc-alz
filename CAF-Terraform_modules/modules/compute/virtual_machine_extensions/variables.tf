variable "virtual_machine_id" {}
variable "extension" {}
variable "extension_name" {}
variable "settings" {
  default = {}
}
variable "client_config" {
  description = "Client configuration object (see module README.md)."
}
variable "keyvault_id" {
  default = null
}
variable "keyvaults" {
  default = {}
}
variable "wvd_host_pools" {
  default = {}
}

variable "private_ip_address" {
  default = ""
}

variable "vm_name" {
  default = ""
}

variable "tags" {
  default = {} 
}