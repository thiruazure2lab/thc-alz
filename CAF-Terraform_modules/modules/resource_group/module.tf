
# naming convention
resource "azurecaf_name" "rg" {
  name          = var.resource_group_name
  resource_type = "azurerm_resource_group"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

################ Deployment Date Tag ############################
resource "time_static" "rg"{
}

// locals {
//   settings_tags = merge(var.tags, lookup(var.settings, "tags", {}))
//   tags_value    = {
//     for key,value in local.settings_tags: key => value
//     if key != "DeploymentDate"
//   }
//   combined_tags = lookup(local.settings_tags,"DeploymentDate",false)?merge(local.tags_value,{DeploymentDate=time_static.rg.rfc3339}):local.tags_value
// }
#################################################################
resource "azurerm_resource_group" "rg" {
  name     = azurecaf_name.rg.result
  location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
  // tags     = local.combined_tags
  tags = var.tags
}
