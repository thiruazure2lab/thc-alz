module "cosmos_dbs" {
  source   = "./modules/databases/cosmos_dbs"
  for_each = local.database.cosmos_dbs

  location            = lookup(each.value, "region", null) == null ? local.resource_groups[each.value.resource_group_key].location : local.global_settings.regions[each.value.region]
  resource_group_name = local.resource_groups[each.value.resource_group_key].name
  global_settings     = local.global_settings
  client_config       = local.client_config
  settings            = each.value
  private_endpoints   = try(each.value.private_endpoints, {})
  private_dns         = local.combined_objects_private_dns
  vnets               = local.combined_objects_networking
  base_tags           = try(local.global_settings.inherit_tags, false) ? local.resource_groups[each.value.resource_group_key].tags : {}
}

output "cosmos_dbs" {
  value = module.cosmos_dbs
}