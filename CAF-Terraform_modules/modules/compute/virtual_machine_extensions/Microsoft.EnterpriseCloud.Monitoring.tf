####################### MicrosoftMonitoringAgent for Windows #################################
resource "azurerm_virtual_machine_extension" "monitoring" {
  for_each = var.extension_name == "microsoft_enterprise_cloud_monitoring" ? toset(["enabled"]) : toset([])

  name = "microsoft_enterprise_cloud_monitoring"

  virtual_machine_id   = var.virtual_machine_id
  publisher            = "Microsoft.EnterpriseCloud.Monitoring"
  type                 = "MicrosoftMonitoringAgent"
  type_handler_version = "1.0"
  tags                 = var.tags
  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  settings = jsonencode(
    {
      # for cross subscription use diagnostic_log_analytics_workspace_id
      #"workspaceId" : try(var.extension.diagnostic_log_analytics_workspace_id,data.azurerm_log_analytics_workspace.monitoring[each.key].workspace_id)
      "workspaceId" : try(var.extension.diagnostic_log_analytics_workspace_id,data.azurerm_log_analytics_workspace.monitoring[each.key].workspace_id)
    }
  )
  protected_settings = jsonencode(
    {
      # for cross subscription use diagnostic_log_analytics_shared_key or key vault
      # "workspaceKey" : try(var.extension.diagnostic_log_analytics_shared_key,data.azurerm_key_vault_secret.monitoring[each.key].value,data.azurerm_log_analytics_workspace.monitoring[each.key].primary_shared_key)
     "workspaceKey" : try(var.extension.diagnostic_log_analytics_shared_key,data.azurerm_log_analytics_workspace.monitoring[each.key].primary_shared_key)
    }
  )

}
####################### OmsAgentForLinux for Linux #################################
resource "azurerm_virtual_machine_extension" "monitoringLinux" {
  for_each = var.extension_name == "microsoft_enterprise_cloud_monitoring_linux" ? toset(["enabled"]) : toset([])

  name = "OmsAgentForLinux"

  virtual_machine_id   = var.virtual_machine_id
  publisher            = "Microsoft.EnterpriseCloud.Monitoring"
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.14"

  settings = jsonencode(
    {
      #"workspaceId" : data.azurerm_log_analytics_workspace.monitoringlinux[each.key].workspace_id
      "workspaceId" : try(var.extension.diagnostic_log_analytics_workspace_id,data.azurerm_log_analytics_workspace.monitoringlinux[each.key].workspace_id)

    }
  )
  protected_settings = jsonencode(
    {
      #"workspaceKey" : data.azurerm_log_analytics_workspace.monitoringlinux[each.key].primary_shared_key
      "workspaceKey" : try(var.extension.diagnostic_log_analytics_shared_key,data.azurerm_log_analytics_workspace.monitoringlinux[each.key].primary_shared_key)

    }
  )
}
####################### DependencyAgentWindows for Windows #################################
resource "azurerm_virtual_machine_extension" "DAAgent" {
  for_each = var.extension_name == "DAAgentExtension" ? toset(["enabled"]) : toset([])

  name = "DAAgentExtension"

  virtual_machine_id   = var.virtual_machine_id
  publisher            = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                 = "DependencyAgentWindows"
  type_handler_version = "9.10"
  tags = var.tags
  auto_upgrade_minor_version = true

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
  
}
####################### DependencyAgentLinux for Linux #################################
resource "azurerm_virtual_machine_extension" "DAAgentLinux" {
  for_each = var.extension_name == "DAAgentExtensionLinux" ? toset(["enabled"]) : toset([])

  name = "DependencyAgentLinux"

  virtual_machine_id   = var.virtual_machine_id
  publisher            = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                 = "DependencyAgentLinux"
  type_handler_version = "9.10"
  auto_upgrade_minor_version = true
  
}


data "azurerm_log_analytics_workspace" "monitoring" {
  for_each = var.extension_name == "microsoft_enterprise_cloud_monitoring" && lookup(var.extension,"diagnostic_log_analytics_key",null) != null? toset(["enabled"]) : toset([])

  name                = var.settings.diagnostics.log_analytics[var.extension.diagnostic_log_analytics_key].name
  resource_group_name = var.settings.diagnostics.log_analytics[var.extension.diagnostic_log_analytics_key].resource_group_name
}

data "azurerm_log_analytics_workspace" "monitoringlinux" {
  for_each = var.extension_name == "microsoft_enterprise_cloud_monitoring_linux" && lookup(var.extension,"diagnostic_log_analytics_key",null) != null? toset(["enabled"]) : toset([])

  name                = var.settings.diagnostics.log_analytics[var.extension.diagnostic_log_analytics_key].name
  resource_group_name = var.settings.diagnostics.log_analytics[var.extension.diagnostic_log_analytics_key].resource_group_name
}
/*
data "azurerm_key_vault_secret" "monitoring"{
  for_each = var.extension_name == "microsoft_enterprise_cloud_monitoring" ? toset(["enabled"]) : toset([])
  
  name               = var.extension.log_analytics_shared_kv.secret_name
  key_vault_id       = try(var.extension.log_analytics_shared_kv.key_vault_id,var.keyvaults[var.client_config.landingzone_key][var.extension.log_analytics_shared_kv.keyvault_key].id,var.keyvaults[var.extension.log_analytics_shared_kv.lz_key][var.extension.log_analytics_shared_kv.keyvault_key].id)
}*/