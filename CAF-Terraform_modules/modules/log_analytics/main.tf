terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }
  required_version = ">= 0.13"
}

################ Deployment Date Tag ############################
resource "time_static" "law"{
}

locals {
  module_tag = {
    "module" = basename(abspath(path.module))
  }
  settings_tags = merge(var.base_tags, local.module_tag, try(var.log_analytics.tags, null))
  tags_value    = {
    for key,value in local.settings_tags: key => value
    if key != "DeploymentDate"
  }
  combined_tags = lookup(local.settings_tags,"DeploymentDate",false)?merge(local.tags_value,{DeploymentDate=time_static.law.rfc3339}):local.tags_value
}
#################################################################


locals {
  tags = local.combined_tags
}