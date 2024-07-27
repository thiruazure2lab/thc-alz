#variable "snapshot" {}
variable "resource_group_name" {}
variable "location" {}
variable "account_name" {}
variable "tags" {
  default = {}
}
variable "settings" {}
variable "global_settings" {
  description = "Global settings object (see module README.md)"
}
variable "base_tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = map(any)
}
