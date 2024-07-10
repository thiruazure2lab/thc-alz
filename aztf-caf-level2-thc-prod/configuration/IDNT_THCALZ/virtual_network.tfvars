vnets = {
  thcalz_idnt_vnet = {
    resource_group_key = "thcalz_idnt_vnet_rg"
    vnet = {
      name          = "THC-UKS-PL-IDNT-VNET-01"
      address_space = ["10.10.44.0/22"]
    }
    subnets = {
      addcsn01_subnet = {
        name = "THC-UKS-PL-IDNT-ADDCSN01"
        cidr = ["10.10.44.0/25"]
        nsg_key = "addcsn01_nsg"
      }
    }
  }
}