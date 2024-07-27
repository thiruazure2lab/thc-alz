output "id" {
  # value = azurerm_template_deployment.data_disksv2.id
  value =  lookup(azurerm_template_deployment.data_disksv2.outputs, "id")
}
output "name" {
  # value = azurerm_template_deployment.data_disksv2.name
  value       = azurecaf_name.data_disksv2.result
}
