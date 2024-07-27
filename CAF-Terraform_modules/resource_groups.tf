
module "resource_groups" {
  source = "./modules/resource_group"
  for_each = {
    for key, value in try(var.resource_groups, {}) : key => value
    if try(value.reuse, false) == false
  }

  resource_group_name = each.value.name
  settings            = each.value
  global_settings     = local.global_settings
  tags                = var.tags
}


module "resource_group_reused" {
  depends_on = [module.resource_groups]
  source     = "./modules/resource_group_reused"
  for_each = {
    for key, value in try(var.resource_groups, {}) : key => value
    if try(value.reuse, false) == true
  }

  settings = each.value
}

locals {
  resource_groups = merge(module.resource_groups, module.resource_group_reused)
}

output "resource_groups" {
  value = local.resource_groups
}


################### access management ###############
module "access_package" {
  depends_on = [
    module.resource_groups
  ]

  source = "./modules/azuread/groups"

  for_each = {
    for key, value in try(var.resource_groups, {}) : key => value
    if try(value.reuse, false) == false && try(value.identity_goverance, null) != null
  }
  global_settings     = local.global_settings
  azuread_groups      = each.value.azuread_groups
  access_package      = each.value.access_package
  access_package_name = each.value.name
  tenant_id           = local.client_config.tenant_id
}