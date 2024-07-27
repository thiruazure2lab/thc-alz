terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }

}

locals {
  tags         = merge(var.base_tags, try(var.settings.tags, null))
  arm_filename = "${path.module}/arm_signalR_services.json"

  # this is the format required by ARM templates
  parameters_body = {
    signalrName = {
      value = var.settings.name
    }
    location = {
      value = var.location
    }
    sku = {
      value = var.settings.sku
    }
    kind = {
      value = var.settings.kind
    }
    tags = {
      value = local.tags
    }
    clientCertEnabled = {
      value = try(var.settings.clientCertEnabled, false)
    }
    resourceGroupName = {
      value = var.resource_group_name
    }
    features = {
      value = try(var.settings.features, [])
    }
    allowedOrigins = {
      value = try(var.settings.allowedOrigins, ["*"])
    }
    liveTraceConfiguration = {
      value = try(var.settings.liveTraceConfiguration, {})
    }
  }
}