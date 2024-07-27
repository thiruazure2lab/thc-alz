terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }
  required_version = ">= 0.13"
}


locals {
  module_tag = {
    "module" = basename(abspath(path.module))
  }
  tags         = merge(var.base_tags, local.module_tag, try(var.settings.tags, null))
  arm_filename = "${path.module}/shared_disk.json"
  # this is the format required by ARM templates
  parameters_body = {
    diskName = {
      value = var.name
    }
    location = {
      value = var.location
    }
    sku = {
      value = var.settings.sku
    }
    diskSizeGb = {
      value = var.settings.diskSizeGb
    }
    createOption = {
      value = var.settings.createOption
    }
    hyperVGeneration = {
      value = try(var.settings.hyperVGeneration, "V1")
    }
    diskEncryptionSetType = {
      value = try(var.settings.diskEncryptionSetType, "EncryptionAtRestWithPlatformKey")
    }
    maxShares = {
      value = try(var.settings.maxShares,1)
    }
    dataAccessAuthMode = {
      value = try(var.settings.dataAccessAuthMode, "None")
    }
    networkAccessPolicy = {
      value = try(var.settings.networkAccessPolicy, "AllowAll")
    }
    publicNetworkAccess = {
      value = try(var.settings.publicNetworkAccess, "Enabled")
    }
    resourceGroupName = {
      value = var.resource_group_name
    }
    sharedDiskTags = {
      value = local.tags
    }
    /* zone = {
      value = try(var.settings.zone, "")
    } */
  }
}