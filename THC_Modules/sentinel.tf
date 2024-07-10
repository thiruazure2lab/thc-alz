

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "sentinel_rg" {
  name     = "sentinel-rg"
  location = "uksouth"
}

resource "azurerm_log_analytics_workspace" "sentinel_workspace" {
  name                = "sentinel-workspace"
  location            = azurerm_resource_group.sentinel_rg.location
  resource_group_name = azurerm_resource_group.sentinel_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel" {
  customer_managed_key_enabled = false

}

output "sentinel_workspace_id" {
  value = azurerm_log_analytics_workspace.sentinel_workspace.id
}
