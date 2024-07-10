resource_groups = {
  thcalz_idnt_vnet_rg = {
    name   = "thc-uks-pl-idnt-vnet-rg01"
    region = "thcuks"
    reuse  = true
  }
  thcalz_idnt_test_rg = {
    name   = "thc-uks-pl-idnt-test-rg01"
    region = "thcuks"
    tags   = {}
  }
  thcalz_idnt_prod_rg = {
    name   = "thc-uks-pl-idnt-prod-rg01"
    region = "thcuks"
    tags   = {}
  }
}
