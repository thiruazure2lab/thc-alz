resource "azurerm_netapp_account" "account" {
  # Must be unique for the subscription.
  name                = var.settings.name
  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "active_directory" {
    for_each = try(var.settings.active_directory, {}) == {} ? [] : [1]

    content {
      username			            = data.external.spnusername["enabled"].result.value
      password                  = data.external.spnkey["enabled"].result.value
      smb_server_name    	      = var.settings.active_directory.smb_server_name
      dns_servers            	  = var.settings.active_directory.dns_servers
      domain              	    = var.settings.active_directory.domain
      organizational_unit       = var.settings.active_directory.organizational_unit
    }
  }
}
/*data "azurerm_key_vault_secret" "spnkey" {
  #for_each     = try(var.settings.active_directory, {}) ? toset(["enabled"]) : toset([])
  name         = var.active_directory.keyvault.password_secret_name
  key_vault_id = try(var.active_directory.keyvault.key_vault_id, var.keyvaults[var.active_directory.keyvault.keyvault_key].id)
}*/

data "external" "spnkey" {
    for_each     = lookup(var.settings.active_directory.keyvault,"password_secret_name",null) == null ? toset([]) : toset(["enabled"])
    program = ["bash",format("%s/scripts/getkvsecret.sh", path.module)]
    query = {
      secret = var.settings.active_directory.keyvault.password_secret_name
      #secret = "corp-windows-svc-password"
      kvname = "kva3gsp002"
    }
}

data "external" "spnusername" {
    for_each     = lookup(var.settings.active_directory.keyvault,"username_secret_name",null) == null ? toset([]) : toset(["enabled"])
    program = ["bash",format("%s/scripts/getkvsecret.sh", path.module)]
    query = {
      secret = var.settings.active_directory.keyvault.username_secret_name
      #secret = "corp-windows-svc-user"
      kvname = "kva3gsp002"
    }
}
