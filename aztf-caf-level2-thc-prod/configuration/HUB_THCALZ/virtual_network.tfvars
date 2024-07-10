vnets = {
  thcalz_conn_vnet = {
    resource_group_key = "thcalz_conn_vnet_rg"

    vnet = {
      name          = "THC-UKS-PL-CONN-VNET-01"
      address_space = ["10.11.0.0/16"]
    }
    specialsubnets = {

      AzureFirewallSubnet = {
        name = "AzureFirewallSubnet"
        cidr = ["10.11.0.0/25"]
      }

      # AzureFirewallManagementSubnet = {
      #   name = "AzureFirewallManagementSubnet"
      #   cidr = ["10.11.4.0/25"]
      # }

      GatewaySubnet = {
        name = "GatewaySubnet"
        cidr = ["10.11.1.0/25"]
      }

    }
    subnets = {

      AzureBastionSubnet = {
        name    = "AzureBastionSubnet"
        cidr    = ["10.11.2.0/25"]
        nsg_key = "conn_vnet_nsg"
      }
      JumpServer = {
        name    = "jumpserver"
        cidr    = ["10.11.3.0/25"]
        nsg_key = "jumpbox_l3"
      }
    }
  }
}
