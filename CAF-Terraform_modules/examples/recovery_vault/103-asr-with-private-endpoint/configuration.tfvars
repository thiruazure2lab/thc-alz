global_settings = {
  default_region = "region1"
  regions = {
    region1 = "southeastasia"
    region2 = "eastasia"
  }
}

resource_groups = {
  primary = {
    name   = "sharedsvc_re1"
    region = "region1"
  }
  secondary = {
    name   = "sharedsvc_re2"
    region = "region2"
  }
}
