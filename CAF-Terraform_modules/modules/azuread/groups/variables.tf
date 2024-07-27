variable "global_settings" {
  description = "Global settings object (see module README.md)"
}
variable "azuread_groups" {
  description = "Set of groups to be created."
}
variable "tenant_id" {
  description = "The tenant ID of the Azure AD environment where to create the groups."
  type        = string
}

variable "access_package" {
  description = "This variable is used to create access package"
  default = {}
}

variable "access_package_name" {
  description = "This variable is used to keep package name same as RG"
  default = ""
}