resource "azurerm_storage_share" "fs" {
  name                 = var.settings.name
  storage_account_name = var.storage_account_name
  quota                = try(var.settings.quota, null)
  metadata             = try(var.settings.metadata, null)
}