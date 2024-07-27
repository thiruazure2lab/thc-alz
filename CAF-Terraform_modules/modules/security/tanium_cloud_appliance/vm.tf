resource "azurerm_template_deployment" "tanium_appliance" {

  name                = var.settings.virtualMachineName
  resource_group_name = var.resource_group_name

  template_body = file(local.arm_filename)

  parameters_body = jsonencode(local.parameters_body)

  deployment_mode = "Incremental"
}
