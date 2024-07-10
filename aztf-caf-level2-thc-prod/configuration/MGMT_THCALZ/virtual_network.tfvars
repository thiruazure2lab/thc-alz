vnets = {
  thcalz_mgmt_vnet = {
    resource_group_key = "thcalz_mgmt_vnet_rg"
    vnet = {
      name          = "THC-UKS-LZ-MGMT-VNET-01"
      address_space = ["10.10.40.0/22"]
    }
    subnets = {
      infrasn01_subnet = {
        name = "THC-UKS-PL-MGMT-INFRASN01"
        cidr = ["10.10.40.0/25"]
        nsg_key = "infrasn01_nsg"
      }
      toolssn01_subnet = {
        name = "THC-UKS-PL-MGMT-TOOLSSN01"
        cidr = ["10.10.40.128/25"]
        nsg_key = "toolssn01_nsg"
      }
      secsn01_subnet = {
        name = "THC-UKS-PL-MGMT-SECSN01"
        cidr = ["10.10.41.0/25"]
        nsg_key = "secsn01_nsg"
      }
      # addcsn01_subnet = {
      #   name = "THC-UKS-PL-MGMT-SECSN01"
      #   cidr = ["10.10.41.0/25"]
      #   nsg_key = "secsn01_nsg"
      # }
     }
  }
}