output "name" {
  value       = var.settings.name
  description = "The name of the SignalR Service"
}

output "id" {
  value       = lookup(azurerm_template_deployment.signalr.outputs, "id")
  description = "The ID of the SignalR Service"
}

output "location" {
  value = var.location
}