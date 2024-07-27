landingzone = {
  backend_type        = "azurerm"
  level               = "level3"
  key                 = "thcalz_level3_conn01" # LZ_Key
  global_settings_key = "thcalz_level2_conn01"
  tfstates = {
    thcalz_level2_conn01 = {
      level   = "lower"
      tfstate = "thcalz_level2_conn01.tfstate"
    }
    thcalz_level3_mgmt = {
      level   = "current"
      tfstate = "thcalz_level3_mgmt.tfstate"
    }
    thcalz_level3_idnt = {
      level   = "current"
      tfstate = "thcalz_level3_idnt.tfstate"
    }
    thcalz_level3_prod = {
      level   = "current"
      tfstate = "thcalz_level3_prod.tfstate"
    }
  }
}

global_settings = {
  default_region = "thcuks"
  inherit_tags   = false
}
