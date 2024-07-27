module "private_endpoint" {
  source   = "../../networking/private_endpoint"
  for_each = try(var.settings.private_endpoints, {})

  base_tags       = var.base_tags
  client_config   = var.client_config
  global_settings = var.global_settings
  location        = var.location
  name            = each.value.name
  private_dns     = var.private_dns
  resource_group_name = var.resource_group_name
  resource_id     = lookup(azurerm_template_deployment.signalr.outputs, "id")
  settings        = each.value
  # subnet_id     = can(each.value.subnet_id) ? each.value.subnet_id : var.remote_objects.vnets[try(each.value.lz_key, var.client_config.landingzone_key)][each.value.vnet_key].subnets[each.value.subnet_key].id
  subnet_id       = try(try(var.vnets[var.client_config.landingzone_key][each.value.vnet_key].subnets[each.value.subnet_key].id, var.vnets[each.value.lz_key][each.value.vnet_key].subnets[each.value.subnet_key].id), each.value.subnetid)
}
