vnet_peerings = {
  thcalz_hub_to_thcalz_mgmt = {
    name = "THC-UKS-PL-CONN-VNET-01-vpeer-THC-UKS-PL-MGMT-VNET-01"
    from = {
      vnet_key = "thcalz_conn_vnet"
    }
    to = {
      lz_key                    = "thcalz_level2_mgmt01"
      output_key                = "vnets"
      vnet_key                  = "thcalz_mgmt_vnet"
      remote_virtual_network_id = "/subscriptions/9ca00828-7313-4d1a-8e50-8befc39eeb6f/resourceGroups/thc-uks-pl-mgmt-vnet-rg01/providers/Microsoft.Network/virtualNetworks/THC-UKS-LZ-MGMT-VNET-01"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = true
    use_remote_gateway           = false
  }

  thcalz_hub_to_thcalz_idnt = {
    name = "THC-UKS-PL-CONN-VNET-01-vpeer-THC-UKS-PL-IDNT-VNET-01"
    from = {
      vnet_key = "thcalz_conn_vnet"
    }
    to = {
      lz_key                    = "thcalz_level2_idnt01"
      output_key                = "vnets"
      vnet_key                  = "thcalz_idnt_vnet"
      remote_virtual_network_id = "/subscriptions/ad3976ec-1742-428b-99ba-0cad14609749/resourceGroups/thc-uks-pl-idnt-vnet-rg01/providers/Microsoft.Network/virtualNetworks/THC-UKS-PL-IDNT-VNET-01"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = true
    use_remote_gateway           = false
  }

  thcalz_hub_to_thcalz_prod = {
    name = "THC-UKS-PL-CONN-VNET-01-vpeer-THC-UKS-LZ-PROD-VNET-01"
    from = {
      vnet_key = "thcalz_conn_vnet"
    }
    to = {
      lz_key                    = "thcalz_level2_prod01"
      output_key                = "vnets"
      vnet_key                  = "thcalz_prod_vnet"
      remote_virtual_network_id = "/subscriptions/e9358d30-8961-4f78-93d4-46ee1e225e7b/resourceGroups/thc-uks-pl-prod-vnet-rg01/providers/Microsoft.Network/virtualNetworks/THC-UKS-LZ-PROD-VNET-01"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = true
    use_remote_gateway           = false
  }

}