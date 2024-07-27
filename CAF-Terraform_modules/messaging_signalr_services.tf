module "signalr_services" {
  source   = "./modules/messaging/signalr_service"
  for_each = local.messaging.signalr_services

  global_settings     = local.global_settings
  client_config       = local.client_config
  settings            = each.value
  private_dns         = local.combined_objects_private_dns
  vnets               = local.combined_objects_networking
  private_endpoints   = try(each.value.private_endpoints, {})
  resource_group_name = local.combined_objects_resource_groups[try(each.value.lz_key, local.client_config.landingzone_key)][each.value.resource_group_key].name
  location            = try(local.global_settings.regions[each.value.region], local.combined_objects_resource_groups[try(each.value.lz_key, local.client_config.landingzone_key)][each.value.resource_group_key].location)
  base_tags           = try(local.global_settings.inherit_tags, false) ? local.resource_groups[each.value.resource_group_key].tags : {}
}

output "signalr_services" {
  value = module.signalr_services
}