resource "azurecaf_name" "snapshot_policy" {

  name          = var.settings.name
  resource_type = "azurerm_netapp_snapshot"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
}

resource "azurerm_template_deployment" "snapshot_policy" {

  name                = azurecaf_name.snapshot_policy.result
  resource_group_name = var.resource_group_name

  template_body = file(local.arm_filename)

  parameters_body = jsonencode(local.parameters_body)

  deployment_mode = "Incremental"

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
    read   = "5m"
  }
}
