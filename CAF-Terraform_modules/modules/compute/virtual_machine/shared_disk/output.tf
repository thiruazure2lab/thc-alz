output "id" {
  # value = azurerm_template_deployment.shared_disk.id
  value =  lookup(azurerm_template_deployment.shared_disk.outputs, "id")
}
output "name" {
  # value = azurerm_template_deployment.shared_disk.name
  value       = azurecaf_name.shared_disk.result
}
