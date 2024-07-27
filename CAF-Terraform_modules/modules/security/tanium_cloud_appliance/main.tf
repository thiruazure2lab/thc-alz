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
  arm_filename = "${path.module}/arm_tanium_appliance.json"
  os_type      = "linux"
  # this is the format required by ARM templates
  parameters_body = {
    networkInterfaceName1 = {
      value = var.settings.networking_interfaces_name
    }
    location = {
      value = var.location
    }
    subnetId = {
      value = var.subnetId
    }
    virtualMachineName = {
      value = var.settings.virtualMachineName
    }
    osDiskType = {
      value = var.settings.osDiskType
    }
    osDiskDeleteOption = {
      value = try(var.settings.osDiskDeleteOption,"Delete")
    }
    dataDisks1 = {
      value = var.settings.dataDisks1
    }
    virtualMachineSize = {
      value = var.settings.virtualMachineSize
    }
    nicDeleteOption = {
      value = try(var.settings.nicDeleteOption, "Detach")
    }
    adminUsername = {
      value = try(var.settings.adminUsername, "adminuser")
    }
    adminPassword = {
      value = random_password.admin.result
    }
    zone = {
      value = try(var.settings.zone,"1")
    }
    privateIPAddress = {
      value = var.settings.privateIPAddress
    }
    tags = {
      value = local.tags
    }
  }
}