module "application_gateways" {
  depends_on = [module.keyvault_certificate_requests]
  source     = "./modules/networking/application_gateway"
  for_each   = local.networking.application_gateways

  global_settings               = local.global_settings
  client_config                 = local.client_config
  diagnostics                   = local.combined_diagnostics
  resource_group_name           = local.resource_groups[each.value.resource_group_key].name
  location                      = lookup(each.value, "region", null) == null ? local.resource_groups[each.value.resource_group_key].location : local.global_settings.regions[each.value.region]
  settings                      = each.value
  sku_name                      = each.value.sku_name
  sku_tier                      = each.value.sku_tier
  vnets                         = local.combined_objects_networking
  base_tags                     = try(local.global_settings.inherit_tags, false) ? local.resource_groups[each.value.resource_group_key].tags : {}
  private_dns                   = lookup(each.value, "private_dns_records", null) == null ? {} : local.combined_objects_private_dns
  public_ip_addresses           = local.combined_objects_public_ip_addresses
  app_services                  = local.combined_objects_app_services
  managed_identities            = local.combined_objects_managed_identities
  keyvaults                     = local.combined_objects_keyvaults
  dns_zones                     = local.combined_objects_dns_zones
  keyvault_certificates         = module.keyvault_certificates
  keyvault_certificate_requests = module.keyvault_certificate_requests
  application_gateway_applications = {
    for key, value in local.networking.application_gateway_applications : key => value
    if value.application_gateway_key == each.key
  }
  application_gateway_waf_policies = local.combined_objects_application_gateway_waf_policies
}

output "application_gateways" {
  value = module.application_gateways

}

output "application_gateway_applications" {
  value = local.networking.application_gateway_applications

}
