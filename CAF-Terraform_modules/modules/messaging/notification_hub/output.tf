
output "name" {
  value       = var.settings.notificationHubName
  description = "NH Name"
}

output "namespaceName" {
  value = var.settings.namespaceName
}

output "id" {
  value       = lookup(azurerm_template_deployment.notificationHub.outputs, "id")
  description = "NH Id"
}

output "location" {
  value = var.location
}