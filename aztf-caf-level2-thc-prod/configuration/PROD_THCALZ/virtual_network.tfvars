vnets = {
  thcalz_prod_vnet = {
    resource_group_key = "thcalz_prod_vnet_rg"
    vnet = {
      name          = "THC-UKS-LZ-PROD-VNET-01"
      address_space = ["10.10.0.0/19"]
    }
    subnets = {
      websn01_subnet = {
        name = "THC-UKS-LZ-PROD-WEBSN01"
        cidr = ["10.10.0.0/23"]
        nsg_key = "websn01_nsg"
      }
      appsn01_subnet = {
        name = "THC-UKS-LZ-PROD-APPSN01"
        cidr = ["10.10.2.0/23"]
        nsg_key = "appsn01_nsg"
      }
      dbsn01_subnet = {
        name = "THC-UKS-LZ-PROD-DBSN01"
        cidr = ["10.10.4.0/23"]
        nsg_key = "dbsn01_nsg"
      }
    }
  }
}
