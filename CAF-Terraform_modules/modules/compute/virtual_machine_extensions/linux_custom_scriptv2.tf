resource "azurerm_virtual_machine_extension" "linux_custom_sciptv2" {
  for_each                   = (var.extension_name == "linux_custom_extensionv2") ? toset(["enabled"]) : toset([])
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
      "commandToExecute": format(" sh %s  '%s' '%s' '%s' '%s' '%s' '%s' '%s' '%s'",var.extension.scrip_file_name,var.extension.vm_name,var.extension.vm_privateip,var.extension.domain_name,var.extension.ou_path, data.external.linux_domain_join_usernamev2["enabled"].result.value, data.external.linux_domain_join_passwordv2["enabled"].result.value, var.extension.hostEnv, var.extension.hostBuild)
    }
  )

  protected_settings = jsonencode(
    {
     "storageAccountName": var.extension.storageAccountName,
     "storageAccountKey" : data.external.storageAccountKeyv2["enabled"].result.value
    }
  )
}

data "external" "linux_domain_join_passwordv2" {
    for_each     = var.extension_name == "linux_custom_extensionv2" ? toset(["enabled"]) : toset([])
    program = ["bash",format("%s/scripts/getkvsecret.sh", path.module)]
    query = {
      secret = var.extension.linux_domain_join_password_keyvault.secret_name
      kvname = "kva3gsp002"
    }
}

data "external" "linux_domain_join_usernamev2" {
    for_each     = var.extension_name == "linux_custom_extensionv2" ? toset(["enabled"]) : toset([])
    program = ["bash",format("%s/scripts/getkvsecret.sh", path.module)]
    query = {
      secret = var.extension.linux_domain_join_username_keyvault.secret_name
      kvname = "kva3gsp002"
    }
}

data "external" "storageAccountKeyv2" {
    for_each     = var.extension_name == "linux_custom_extensionv2" ? toset(["enabled"]) : toset([])
    program = ["bash",format("%s/scripts/getkvsecret.sh", path.module)]
    query = {
      secret = var.extension.storageAccountKey.secret_name
      kvname = "kva3gsp002"
    }
}