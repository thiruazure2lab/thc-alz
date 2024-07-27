module "snapshotpolicy" {
  source   = "./snapshot"
  for_each = try(var.settings.snapshotpolicy, {})

  depends_on          = [azurerm_netapp_account.account]
  account_name        = azurerm_netapp_account.account.name
  resource_group_name = azurerm_netapp_account.account.resource_group_name
  location            = azurerm_netapp_account.account.location
  settings            = each.value
  base_tags           = var.base_tags
  global_settings     = var.global_settings
}
