output "id" {
  value = azurerm_storage_account.stg.id
}

output "name" {
  value = azurerm_storage_account.stg.name
}

output "location" {
  value = var.location

}

output "resource_group_name" {
  value = var.resource_group_name
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.stg.primary_blob_endpoint
}

output "containers" {
  value = module.container
}

output "data_lake_filesystems" {
  value = module.data_lake_filesystem
}

output "identity" {
  value = try(azurerm_storage_account.stg.identity, null)
}

output "rbac_id" {
  value = try(azurerm_storage_account.stg.identity.0, null)
}

output "primary_connection_string" {
  value = try(azurerm_storage_account.stg.primary_connection_string,null)
}

output "file_share" {
  description = "The file shares output objects as created by the file shares submodule."
  value       = module.file_share
}