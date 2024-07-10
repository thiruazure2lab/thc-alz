landingzone = {
  backend_type = "azurerm"
  level        = "level0"
  key          = "launchpad"
}

enable = {
  bastion_hosts    = false
  virtual_machines = false
}

# Default region. When not set to a resource it will use that value
default_region = "thcuks"

regions = {
  thcuks = "uksouth"
  #thc2 = ""
}

# core tags to be applied accross this landing zone
#tags = {}

# naming convention settings
# for more settings on naming convention, please refer to the provider documentation: https://github.com/aztfmod/terraform-provider-azurecaf
#
# passthrough means the default CAF naming convention is not applied and you are responsible
# of the unicity of the names you are giving. the CAF provider will clear out
passthrough = true
# adds random chars at the end of the names produced by the provider
random_length = 0
# prefix to assign to all resource names (required, but ignored when passthrough is true)
#prefix = "coe"
# all resources deployed will inherit tags from the parent resource group
inherit_tags = true

launchpad_key_names = {
  azuread_app            = "caf_launchpad_level0"
  keyvault_client_secret = "aadapp-caf-launchpad-level0"
  tfstates = [
    "level0",
    "level1",
    "level2"
  ]
}