module "notification_hub" {
  source   = "./modules/messaging/notification_hub"
  for_each = try(var.notification_hub, {})

  global_settings     = local.global_settings
  settings            = each.value
  location            = lookup(each.value, "region", null) == null ? local.combined_objects_resource_groups[try(each.value.lz_key, local.client_config.landingzone_key)][each.value.resource_group_key].location : local.global_settings.regions[each.value.region]
  resource_group_name = local.combined_objects_resource_groups[try(each.value.lz_key, local.client_config.landingzone_key)][each.value.resource_group_key].name
  base_tags           = try(local.global_settings.inherit_tags, false) ? local.combined_objects_resource_groups[try(each.value.lz_key, local.client_config.landingzone_key)][each.value.resource_group_key].tags : {}
}

output "notification_hub" {
  value = module.notification_hub
}