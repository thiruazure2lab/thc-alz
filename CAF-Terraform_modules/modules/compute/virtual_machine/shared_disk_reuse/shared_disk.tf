data "azurerm_managed_disk" "shared_disk" {
  name                = var.name
  resource_group_name = var.resource_group_name
}