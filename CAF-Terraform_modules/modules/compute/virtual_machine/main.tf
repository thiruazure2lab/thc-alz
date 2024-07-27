terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }
  required_version = ">= 0.13"
}


locals {
  os_type = lower(var.settings.os_type)
  # Generate SSH Keys only if a public one is not provided
  create_sshkeys = local.os_type == "linux" && try(var.settings.public_key_pem_file == "", true)
  module_tag = {
    "module" = basename(abspath(path.module))
  }
  tags = merge(var.base_tags, local.module_tag, try(var.settings.tags, null))
  arm_filename = "${path.module}/shared_disk.json"
  /* for_each = lookup(var.settings, "shared_disk", {})
  # this is the format required by ARM templates
  parameters_body = {
    diskName = {
      value = each.value.shared_disk.name
    }
    location = {
      value = var.location
    }
    sku = {
      value = each.value.sku
    }
    diskSizeGb = {
      value = each.value.diskSizeGb
    }
    createOption = {
      value = each.value.createOption
    }
    hyperVGeneration = {
      value = try(each.value.hyperVGeneration, "V1")
    }
    diskEncryptionSetType = {
      value = try(each.value.diskEncryptionSetType, "EncryptionAtRestWithPlatformKey")
    }
    maxShares = {
      value = each.value.maxShares
    }
    dataAccessAuthMode = {
      value = try(each.value.dataAccessAuthMode, "None")
    }
    networkAccessPolicy = {
      value = try(each.value.networkAccessPolicy, "DenyAll")
    }
    publicNetworkAccess = {
      value = try(each.value.publicNetworkAccess, "Disabled")
    }
    resourceGroupName = {
      value = var.resource_group_name
    }
    sharedDiskTags = {
      value = local.tags
    }
  } */
}