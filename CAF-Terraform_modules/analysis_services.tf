##### azurerm_data_factory
module "analysis_services" {
  source = "./modules/analysis_services"

  for_each = var.analysis_services

  name                      = each.value.name
  resource_group_name       = local.resource_groups[each.value.resource_group_key].name
  location                  = lookup(each.value, "region", null) == null ? local.resource_groups[each.value.resource_group_key].location : local.global_settings.regions[each.value.region]
  sku                       = each.value.sku
  global_settings           = local.global_settings
  backup_blob_container_uri = try(each.value.backup_blob_container_uri, null)
  admin_users               = try(each.value.admin_users, [])
  base_tags                 = try(local.global_settings.inherit_tags, false) ? local.resource_groups[each.value.resource_group_key].tags : {}
  tags                      = try(each.value.tags, null)
  enable_power_bi_service   = try(each.value.enable_power_bi_service, false)
  ipv4_firewall_rule        = try(each.value.ipv4_firewall_rule, {})
}

output "analysis_services" {
  value = module.analysis_services
}
