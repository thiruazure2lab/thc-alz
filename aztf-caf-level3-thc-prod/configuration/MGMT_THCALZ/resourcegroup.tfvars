  resource_groups = {
    thcalz_mgmt_vnet_rg ={
      name = "thc-uks-pl-mgmt-vnet-rg01"
      region = "thcuks"
      reuse = true
    }
    thcalz_mgmt_test_rg = {
    name   = "thc-uks-pl-mgmt-test-rg01"
    region = "thcuks"
    tags   = {}
  }
  }