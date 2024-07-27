module "load_balancers_v2" {
  source   = "./modules/networking/load_balancers_v2"
  for_each = {
    for key, value in local.networking.load_balancers : key => value
    if try(value.version, 0) == 2
  }

  resource_group_name = local.resource_groups[each.value.resource_group_key].name
  location            = lookup(each.value, "region", null) == null ? local.resource_groups[each.value.resource_group_key].location : local.global_settings.regions[each.value.region]
  public_ip_addresses = local.combined_objects_public_ip_addresses
  client_config       = local.client_config
  vnets               = local.combined_objects_networking
  diagnostic_profiles = try(each.value.diagnostic_profiles, null)
  diagnostics         = local.combined_diagnostics
  global_settings     = local.global_settings
  settings            = each.value
  base_tags           = try(local.global_settings.inherit_tags, false) ? local.resource_groups[each.value.resource_group_key].tags : {}
  existing_resources = {
    virtual_machines = try(local.combined_objects_virtual_machines, {})
    # virtual_machines = try(module.virtual_machines, {})
    #vm scale set will be added later
  }
}

output "load_balancers_v2" {
  value = module.load_balancers_v2
}
