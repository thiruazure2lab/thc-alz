module "servicebus_namespaces" {
  source   = "./modules/messaging/servicebus/namespace"
  for_each = local.messaging.servicebus_namespaces

  global_settings   = local.global_settings
  client_config     = local.client_config
  settings          = each.value
  location          = lookup(each.value, "region", null) == null ? local.resource_groups[each.value.resource_group_key].location : local.global_settings.regions[each.value.region]
  private_dns       = local.combined_objects_private_dns
  vnets             = local.combined_objects_networking
  private_endpoints = try(each.value.private_endpoints, {})

  resource_groups = local.combined_objects_resource_groups

  remote_objects = {
    resource_groups = local.combined_objects_resource_groups
    vnets           = local.combined_objects_networking
    private_dns     = local.combined_objects_private_dns
  }

}

output "servicebus_namespaces" {
  value = module.servicebus_namespaces
}
