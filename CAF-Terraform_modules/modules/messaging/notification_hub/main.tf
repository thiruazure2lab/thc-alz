terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }
  required_version = ">= 0.13"
}

locals {
  tags         = merge(var.base_tags, try(var.settings.tags, null))
  arm_filename = "${path.module}/arm_notification_hubs.json"

  # this is the format required by ARM templates
  parameters_body = {
    namespaceName = {
      value = var.settings.namespaceName
    }
    location = {
      value = var.location
    }
    skuName = {
      value = var.settings.skuName
    }
    tags = {
      value = local.tags
    }
    notificationHubName = {
      value = var.settings.notificationHubName
    }
    resourceGroupName = {
      value = var.resource_group_name
    }
  }
}