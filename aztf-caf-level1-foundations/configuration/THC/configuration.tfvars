landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "launchpad"
  level               = "level1"
  key                 = "foundation"
  tfstates = {
   launchpad = {
    level   = "lower"
    tfstate = "aztf-caf-level0-launchpad.tfstate"
   }
  } 
}