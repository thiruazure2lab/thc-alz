module "private_endpoint" {
  source   = "../../networking/private_endpoint"
  for_each = var.private_endpoints

  resource_id         = azurerm_function_app.function_app.id
  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = try(var.vnets[var.client_config.landingzone_key][each.value.vnet_key].subnets[each.value.subnet_key].id, var.vnets[each.value.lz_key][each.value.vnet_key].subnets[each.value.subnet_key].id)
  settings            = each.value
  global_settings     = var.global_settings
  base_tags           = local.tags
  private_dns         = var.private_dns
  client_config       = var.client_config
}

# module "private_endpoint_slots" {
#   source   = "../../networking/private_endpoint"
#   for_each = {
#     for key,value in try(var.private_endpoints, {}):key => value
#     if try(value.function_app_slot_key,null)!= null
#   }

#   resource_id         = azurerm_function_app_slot.function_app_slot[each.value.function_app_slot_key].id
#   name                = each.value.name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   subnet_id           = try(var.vnets[var.client_config.landingzone_key][each.value.vnet_key].subnets[each.value.subnet_key].id, var.vnets[each.value.lz_key][each.value.vnet_key].subnets[each.value.subnet_key].id)
#   settings            = each.value
#   global_settings     = var.global_settings
#   base_tags           = local.tags
#   private_dns         = var.private_dns
#   client_config       = var.client_config
# }