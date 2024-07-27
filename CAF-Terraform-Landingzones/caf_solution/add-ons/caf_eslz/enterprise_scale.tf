# For full description on enterprise_scale module usage, please refer to https://github.com/Azure/terraform-azurerm-caf-enterprise-scale

module "enterprise_scale" {
  source  = "git::https://dev.azure.com/HighlandCouncil/AzureLandingZone/_git/caf-enterprise-modules"
  #source = "git::https://admc-Thirupathyk:slpox5bce5r6p7g7vg27bt6he55o6mgyhfysx4fgyuqv6toxeiyq@dev.azure.com/HighlandCouncil/AzureLandingZone/_git/terraform-azurerm-caf-enterprise-scale"

  

  root_parent_id   = data.azurerm_client_config.current.tenant_id
  default_location = local.global_settings.regions[local.global_settings.default_region]

  #path to the policies definition and assignment repo
  library_path                   = var.library_path
  archetype_config_overrides     = local.archetype_config_overrides
  custom_landing_zones           = local.custom_landing_zones
  deploy_core_landing_zones      = var.deploy_core_landing_zones
  root_id                        = var.root_id
  root_name                      = var.root_name
  subscription_id_overrides      = var.subscription_id_overrides
  subscription_id_management     = var.subscription_id_management
  deploy_management_resources    = var.deploy_management_resources
  subscription_id_connectivity   = var.subscription_id_connectivity
  configure_management_resources = local.es_configure_management_resources
  es_subs_archtype_map           = var.es_subs_archtype_map
}
