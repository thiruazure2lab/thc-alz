
bastion_hosts = {
  bastion_hub = {
    name               = "bastion-conn"
    region             = "thcuks"
    resource_group_key = "thcalz_conn_vnet_rg"
    vnet_key           = "thcalz_conn_vnet"
    subnet_key         = "AzureBastionSubnet"
    public_ip_key      = "bastion_host_rg1"
  }
}