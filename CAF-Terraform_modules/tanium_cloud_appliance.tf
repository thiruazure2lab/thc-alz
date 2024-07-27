module "tanium_cloud_appliance" {
  source = "./modules/security/tanium_cloud_appliance"

  for_each = try(var.tanium_cloud_appliance, {})

  global_settings     = local.global_settings
  client_config       = local.client_config
  settings            = each.value
  base_tags           = try(local.global_settings.inherit_tags, false) ? module.resource_groups[each.value.resource_group_key].tags : {}
  resource_group_name = local.resource_groups[each.value.resource_group_key].name
  location            = lookup(each.value, "region", null) == null ? local.resource_groups[each.value.resource_group_key].location : local.global_settings.regions[each.value.region]
  keyvaults           = local.combined_objects_keyvaults
  subnetId            = local.combined_objects_networking[try(each.value.networking.lz_key, local.client_config.landingzone_key)][each.value.networking.vnet_key].subnets[each.value.networking.subnet_key].id

}