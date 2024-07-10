  resource_groups = {
    thcalz_prod_vnet_rg ={
      name = "thc-uks-pl-prod-vnet-rg01"
      region = "thcuks"
      reuse = true
    }
    thcalz_prod_test_rg = {
    name   = "thc-uks-pl-prod-test-rg01"
    region = "thcuks"
    tags   = {}
  }
  }