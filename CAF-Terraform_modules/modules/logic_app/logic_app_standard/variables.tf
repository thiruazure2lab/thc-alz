variable "global_settings" {
  description = "Global settings object (see module README.md)"
}
variable "client_config" {}
variable "settings" {}
variable "application_insights_id" {
  description = "(Required) The name of the resource group where to create the resource."
  type        = string
  default = ""
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created."
  type        = string
}
variable "app_service_plan_id" {
  default = ""
}

variable "storage_accounts" {
  default = {}
}

variable "private_endpoints" {
  default = {}
}

variable "vnets" {
  default = {}
}

variable "private_dns" {
  default = {}
}

variable "resource_group_name" {
  default = ""
}

variable "subnet_id" {
  default = {}
}