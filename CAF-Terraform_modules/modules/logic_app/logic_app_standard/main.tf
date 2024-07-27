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
  tags         = merge(local.module_tag, try(var.settings.tags, null))
  arm_filename = "${path.module}/arm_logic_apps.json"
  ai_tags      = try(var.application_insights_id, null) == null ? null : {"hidden-link: /app-insights-resource-id": var.application_insights_id}
  storage_accounts = try(var.settings.storage, null) == null ? null : (var.storage_accounts[try(var.settings.storage.lz_key, var.client_config.landingzone_key)][var.settings.storage.storage_account_key].name)
}
locals{
  # this is the format required by ARM templates
  parameters_body = {
    logic_app_name = {
      value = var.settings.name
    }
    app_service_plan_id = {
      value = var.app_service_plan_id
    }
    resourceGroupName = {
      value = var.resource_group_name
    },
    virtualNetworkSubnetId = {
      value = var.subnet_id
    }
    tags = {
      value = merge(local.tags,local.ai_tags)
    }
    location = {
      value = var.location
    }
    storageAccountName = {
      value = local.storage_accounts
    }
    functionExtensionVersion = {
      value = try(var.settings.functionExtensionVersion,"~4")
    }
  }
}