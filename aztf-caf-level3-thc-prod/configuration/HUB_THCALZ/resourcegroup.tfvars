resource_groups = {
  thcalz_conn_vnet_rg = {
    name   = "thc-uks-pl-conn-vnet-rg01"
    region = "thcuks"
    reuse  = true
  }
  thcalz_conn_test_rg = {
    name   = "thc-uks-pl-conn-test-rg01"
    region = "thcuks"
    tags   = {}
  }
}