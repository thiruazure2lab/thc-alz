resource "azurerm_template_deployment" "signalr" {

  name                = var.settings.name
  resource_group_name = var.resource_group_name

  template_body = file(local.arm_filename)

  parameters_body = jsonencode(local.parameters_body)

  deployment_mode = "Incremental"

  timeouts {
    create = "10h"
    update = "10h"
    delete = "10h"
    read   = "5m"
  }
}
