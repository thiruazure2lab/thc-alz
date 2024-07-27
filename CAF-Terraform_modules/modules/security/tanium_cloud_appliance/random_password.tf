resource "random_password" "admin" {
  length           = 70
  min_upper        = 2
  min_lower        = 2
  min_special      = 2
  number           = true
  special          = true
  override_special = "!@#$%&"
}


resource "azurerm_key_vault_secret" "admin_password" {
  name         = format("%s-admin-password", var.settings.virtualMachineName)
  value        = random_password.admin.result
  key_vault_id = local.keyvault.id

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

locals {
  keyvault = try(var.keyvaults[var.settings.lz_key][var.settings.keyvault_key], var.keyvaults[var.client_config.landingzone_key][var.settings.keyvault_key])
}
