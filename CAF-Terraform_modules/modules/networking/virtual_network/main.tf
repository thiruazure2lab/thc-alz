################ Deployment Date Tag ############################
resource "time_static" "vnet"{
}

locals {
  module_tag = {
    "module" = basename(abspath(path.module))
  }
  settings_tags = merge(var.base_tags, local.module_tag, var.tags)
  tags_value    = {
    for key,value in local.settings_tags: key => value
    if key != "DeploymentDate"
  }
  combined_tags = lookup(local.settings_tags,"DeploymentDate",false)?merge(local.tags_value,{DeploymentDate=time_static.vnet.rfc3339}):local.tags_value
}
#################################################################


locals {
  tags = local.combined_tags
}

terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}