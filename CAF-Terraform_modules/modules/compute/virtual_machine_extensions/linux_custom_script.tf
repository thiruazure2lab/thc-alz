resource "azurerm_virtual_machine_extension" "linux_custom_scipt" {
  for_each                   = (var.extension_name == "linux_custom_extension") ? toset(["enabled"]) : toset([])
  name                       = "cloudinit"
  virtual_machine_id         = var.virtual_machine_id
  publisher                  = "Microsoft.Azure.Extensions"
  type                       = "CustomScript"
  type_handler_version       = "2.1"
  tags = var.tags

  lifecycle {
    ignore_changes = [
      settings,
      protected_settings,
      tags
    ]
  }

  settings = jsonencode(
    {
      "fileUris": var.extension.fileUris,
      "commandToExecute": format(" sh %s  '%s' '%s' '%s' '%s' '%s' '%s'",var.extension.scrip_file_name,var.extension.vm_name,var.extension.vm_privateip,var.extension.domain_name,var.extension.ou_path, data.external.linux_domain_join_username["enabled"].result.value, data.external.linux_domain_join_password["enabled"].result.value)
    }
  )

  protected_settings = jsonencode(
    {
     "storageAccountName": var.extension.storageAccountName,
     "storageAccountKey" : data.external.storageAccountKey["enabled"].result.value
    }
  )
}


# data "azurerm_key_vault_secret" "linux_domain_join_password" {
#   for_each     = var.extension_name == "linux_custom_extension" ? toset(["enabled"]) : toset([])
#   name         = var.extension.linux_domain_join_password_keyvault.secret_name
#   key_vault_id = try(var.extension.linux_domain_join_password_keyvault.key_vault_id, var.keyvaults[var.extension.linux_domain_join_password_keyvault.keyvault_key].id)
# }

# data "azurerm_key_vault_secret" "linux_domain_join_username" {
#   for_each     = var.extension_name == "linux_custom_extension" ? toset(["enabled"]) : toset([])
#   name         = var.extension.linux_domain_join_username_keyvault.secret_name
#   key_vault_id = try(var.extension.linux_domain_join_username_keyvault.key_vault_id, var.keyvaults[var.extension.linux_domain_join_username_keyvault.keyvault_key].id)
# }

# data "azurerm_key_vault_secret" "storageAccountKey" {
#   for_each     = var.extension_name == "linux_custom_extension" ? toset(["enabled"]) : toset([])
#   name         = var.extension.storageAccountKey.secret_name
#   key_vault_id = try(var.extension.storageAccountKey.key_vault_id, var.keyvaults[var.extension.storageAccountKey.keyvault_key].id)
# }

data "external" "linux_domain_join_password" {
    for_each     = var.extension_name == "linux_custom_extension" ? toset(["enabled"]) : toset([])
    program = ["bash",format("%s/scripts/getkvsecret.sh", path.module)]
    query = {
      secret = var.extension.linux_domain_join_password_keyvault.secret_name
      kvname = "kva3gsp002"
    }
}

data "external" "linux_domain_join_username" {
    for_each     = var.extension_name == "linux_custom_extension" ? toset(["enabled"]) : toset([])
    program = ["bash",format("%s/scripts/getkvsecret.sh", path.module)]
    query = {
      secret = var.extension.linux_domain_join_username_keyvault.secret_name
      kvname = "kva3gsp002"
    }
}

data "external" "storageAccountKey" {
    for_each     = var.extension_name == "linux_custom_extension" ? toset(["enabled"]) : toset([])
    program = ["bash",format("%s/scripts/getkvsecret.sh", path.module)]
    query = {
      secret = var.extension.storageAccountKey.secret_name
      kvname = "kva3gsp002"
    }
}