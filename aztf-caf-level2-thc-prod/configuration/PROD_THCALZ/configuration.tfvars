landingzone = {
  backend_type        = "azurerm"
  level               = "level2"
  key                 = "thcalz_level2_prod01"
  global_settings_key = "foundation"
  tfstates = {
    foundation = {
      level   = "lower"
      tfstate = "foundation.tfstate"
    }
    thcalz_level2_conn01 = {
      level   = "current"
      tfstate = "thcalz_level2_conn01.tfstate"
    }
  }
}

global_settings = {
  default_region = "thcuks"
  inherit_tags   = false
}
