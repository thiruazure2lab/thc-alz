output "name" {
  value       = azurecaf_name.snapshot_policy.result
  description = "Snapshot Policy Name"
}

output "id" {
  value       = lookup(azurerm_template_deployment.snapshot_policy.outputs, "id")
  description = "Snapshot Policy Id"
}

output "location" {
  value = var.location
}
