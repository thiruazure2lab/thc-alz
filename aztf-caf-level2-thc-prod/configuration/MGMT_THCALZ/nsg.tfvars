network_security_group_definition = {
  infrasn01_nsg = {
    version            = 1
    name               = "thc-uks-pl-mgmt-infrasn01-nsg"
    resource_group_key = "thcalz_mgmt_vnet_rg"
    nsg                = []
  }
  toolssn01_nsg = {
    version            = 1
    name               = "thc-uks-pl-mgmt-toolssn01-nsg"
    resource_group_key = "thcalz_mgmt_vnet_rg"
    nsg                = []
  }
  secsn01_nsg = {
    version            = 1
    name               = "thc-uks-pl-mgmt-secsn01-nsg"
    resource_group_key = "thcalz_mgmt_vnet_rg"
    nsg                = []
  }
  # addcsn01_nsg = {
  #   version            = 1
  #   name               = "thc-uks-pl-mgmt-addcsn01-nsg"
  #   resource_group_key = "thcalz_idnt_vnet_rg"
  #   nsg                = []
  # }
}