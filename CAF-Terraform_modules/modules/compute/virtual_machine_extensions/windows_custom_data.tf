resource "azurerm_virtual_machine_extension" "cloudinit" {
  for_each                   = (var.extension_name == "windows_customdata_extension") ? toset(["enabled"]) : toset([])
  name                       = "cloudinit"
  virtual_machine_id         = var.virtual_machine_id
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
      "commandToExecute": "powershell -ExecutionPolicy unrestricted -NoProfile -NonInteractive -command \"cp c:/azuredata/customdata.bin c:/azuredata/install.ps1; c:/azuredata/install.ps1\""
    }
  )
}
