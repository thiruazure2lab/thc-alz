public_ip_addresses = {
  az_fw_pip = {
    name               = "pip1-fw"
    resource_group_key = "thcalz_conn_vnet_rg"
    sku                = "Standard" # must be 'Standard' SKU
    # Standard SKU Public IP Addresses that do not specify a zone are zone redundant by default.
    allocation_method       = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  vngw_pip = {
    name                    = "vngw_pip1"
    resource_group_key      = "thcalz_conn_vnet_rg"
    sku                     = "Standard"
    allocation_method       = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  bastion_host_rg1 = {
    name                    = "bastion-rg1-pip1"
    region                  = "thcuks"
    resource_group_key      = "thcalz_conn_vnet_rg"
    sku                     = "Standard"
    allocation_method       = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
}