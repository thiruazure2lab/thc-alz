variable "name" {}
variable "resource_group_name" {
  type        = string
}

variable "global_settings" {
  description = "Global settings object (see module README.md)"
}
variable "settings" {}
variable "location" {}
variable "virtual_machine_id" {}
variable "base_tags" {}