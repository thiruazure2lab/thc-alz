variable "global_settings" {}
variable "client_config" {}
variable "settings" {}
variable "resource_group_name" {}
variable "location" {}
variable "account_name" {}
variable "vnets" {}
variable "snapshot_policy" {
  default = {}
}
variable "base_tags" {
  default = {}
}
