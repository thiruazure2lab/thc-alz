resource "azurerm_log_analytics_linked_service" "autoacc_linked_log_workspace" {
  for_each = lookup(var.settings, "update_manager", {})
  resource_group_name = var.resource_group_name
  #workspace_name      = var.settings.update_manager.workspace_name
  workspace_id        = var.settings.update_manager.workspace_id
  read_access_id      = azurerm_automation_account.auto_account.id
}
