vnet_peerings = {
  thcalz_mgmt_to_thcalz_hub = {
    name = "THC-UKS-PL-MGMT-VNET-01-vpeer-THC-UKS-PL-CONN-VNET-01"
    from = {
      vnet_key = "thcalz_mgmt_vnet"
    }
    to = {
      lz_key                    = "thcalz_level2_conn01"
      output_key                = "vnets"
      vnet_key                  = "thcalz_conn_vnet"
      remote_virtual_network_id = "/subscriptions/9adecef0-c958-4e2c-bd95-9c372d083c61/resourceGroups/thc-uks-pl-conn-vnet-rg01/providers/Microsoft.Network/virtualNetworks/THC-UKS-PL-CONN-VNET-01"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = true
    use_remote_gateway           = false
  }

}