resource "azurerm_virtual_machine_extension" "windows_custom_script" {
  for_each                   = (var.extension_name == "windows_custom_extension") ? toset(["enabled"]) : toset([])
  name                       = "cloudinit"
  virtual_machine_id         = var.virtual_machine_id
  # publisher                  = "Microsoft.Azure.Extensions"
  # type                       = "CustomScript"
  # type_handler_version       = "2.1"
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.10"  
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
      "scriptname": var.extension.script_file_name,
      "commandToExecute": "powershell -ExecutionPolicy unrestricted -NoProfile -NonInteractive -File ${var.extension.subfolder}/${var.extension.script_file_name} -vmname ${var.extension.vmname} -hostEnv ${var.extension.hostEnv} -hostBuild ${var.extension.hostBuild}"
    }
  )

  protected_settings = jsonencode(
    {
     "storageAccountName": var.extension.storageAccountName,
     "storageAccountKey" : data.external.storageAccountKeyWin["enabled"].result.value
    }
  )
}

data "external" "storageAccountKeyWin" {
    for_each     = var.extension_name == "windows_custom_extension" ? toset(["enabled"]) : toset([])
    program = ["bash",format("%s/scripts/getkvsecret.sh", path.module)]
    query = {
      secret = var.extension.storageAccountKey.secret_name
      kvname = "kva3gsp002"
    }
}