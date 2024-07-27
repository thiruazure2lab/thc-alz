resource "azurecaf_name" "analysis_services" {
  name          = var.name
  resource_type = "azurerm_analysis_services_server"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_analysis_services_server" "analysis_services" {
  name                      = azurecaf_name.analysis_services.result
  resource_group_name       = var.resource_group_name
  location                  = var.location
  sku                       = var.sku
  admin_users               = var.admin_users
  #querypool_connection_mode = try(var.querypool_connection_mode, null)
  backup_blob_container_uri = try(var.backup_blob_container_uri,null)
  enable_power_bi_service   = var.enable_power_bi_service
  #ipv4_firewall_rule        = var.ipv4_firewall_rule
  tags = merge(var.tags, var.base_tags)

  lifecycle {
    ignore_changes = [
      tags["BrandName"],
      tags["CreationDate"]
    ]
  }
  
  dynamic "ipv4_firewall_rule" {
    for_each = try(var.ipv4_firewall_rule, {})

    content {
      name = ipv4_firewall_rule.value.name
      range_start = ipv4_firewall_rule.value.range_start
      range_end = ipv4_firewall_rule.value.range_end
    }
  }
}