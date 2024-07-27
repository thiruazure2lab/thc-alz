
output "name" {
  value       = var.settings.name
  description = "Logic App Name"
}

output "id" {
  value       = try(lookup(azurerm_template_deployment.logic_app_standard.outputs, "id"),"")
  description = "Logic App Id"
}

output "location" {
  value = var.location
}