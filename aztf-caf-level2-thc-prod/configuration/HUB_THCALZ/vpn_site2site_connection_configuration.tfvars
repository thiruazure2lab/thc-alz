
virtual_network_gateways = {
  gateway1 = {
    name                       = "vgw-prod-uksouth-001"
    resource_group_key         = "thcalz_conn_vnet_rg"
    type                       = "VPN"
    sku                        = "VpnGw2AZ"
    private_ip_address_enabled = true
    # enable_bpg defaults to false. If set, true, input the necessary parameters as well. VPN Type only
    enable_bgp = false
    vpn_type   = "RouteBased"
    # multiple IP configs are needed for active_active state. VPN Type only.
    ip_configuration = {
      ipconfig1 = {
        ipconfig_name         = "gatewayIp1"
        public_ip_address_key = "vngw_pip"
        #lz_key                        = "examples"
        #lz_key optional, only needed if the vnet_key is inside another landing zone
        vnet_key                      = "thcalz_conn_vnet"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}

local_network_gateways = {
  local1 = {
    name               = "enterprisevpn"
    resource_group_key = "thcalz_conn_vnet_rg"
    address_space      = ["10.0.0.0/8"]
    gateway_address    = "164.134.0.134"
    bgp_settings = {}
  }
}

virtual_network_gateway_connections = {
  connection1 = {
    name                        = "onpremise_connection"
    resource_group_key          = "thcalz_conn_vnet_rg"
    type                        = "IPSec"
    region                      = "thcuks"
    virtual_network_gateway_key = "gateway1"
    local_network_gateway_key   = "local1"

    shared_key = "raimeh-tk74nw-di@!gket-iemen-st$az"
  }

}
