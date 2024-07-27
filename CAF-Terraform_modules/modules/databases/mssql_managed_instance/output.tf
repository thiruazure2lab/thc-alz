
output "name" {
  value       = azurecaf_name.mssqlmi.result
  description = "SQL MI Name"
}

output "id" {
  value =  try(lookup(azurerm_template_deployment.mssqlmi.outputs, "id"), var.settings.arm_deployment_id)
  # value       = var.settings.arm_deployment_id
  /* depends_on = [
    azurerm_template_deployment.mssqlmi
  ] */
  description = "SQL MI Id"
}

output "location" {
  value = var.location
}

output "principal_id" {
  value = try(lookup(azurerm_template_deployment.mssqlmi.outputs, "objectId"), var.settings.arm_deployment_objectid)
  # value       = var.settings.arm_deployment_objectid
  /*depends_on = [
    azurerm_template_deployment.mssqlmi
  ] */
  description = "SQL MI Identity Principal Id"
}