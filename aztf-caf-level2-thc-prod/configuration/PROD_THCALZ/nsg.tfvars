network_security_group_definition = {
  websn01_nsg = {
    version            = 1
    name               = "thc-uks-pl-prod-websn01-rg01-nsg"
    resource_group_key = "thcalz_prod_vnet_rg"
    nsg                = []
  }
    appsn01_nsg = {
    version            = 1
    name               = "thc-uks-pl-prod-appsn01-rg01-nsg"
    resource_group_key = "thcalz_prod_vnet_rg"
    nsg                = []
  }
    dbsn01_nsg = {
    version            = 1
    name               = "thc-uks-pl-prod-dbsn01-rg01-nsg"
    resource_group_key = "thcalz_prod_vnet_rg"
    nsg                = []
  }
}