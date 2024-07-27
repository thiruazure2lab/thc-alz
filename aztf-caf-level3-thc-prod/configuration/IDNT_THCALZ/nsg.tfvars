network_security_group_definition = {
  addcprod01_nsg = {
    version            = 1
    name               = "idnt-addcprod-nsg"
    resource_group_key = "thcalz_idnt_prod_rg"
    nsg = [
      # {
      #   name                       = "ssh-inbound-22",
      #   priority                   = "200"
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   protocol                   = "tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "22"
      #   source_address_prefix      = "*"
      #   destination_address_prefix = "VirtualNetwork"
      # }
    ]
  }
  # addc01_testvm_nsg = {
  #   version            = 1
  #   name               = "idnt-addctestvm-nsg"
  #   resource_group_key = "thcalz_idnt_test_rg"
  #   nsg = [
  #     # {
  #     #   name                       = "ssh-inbound-22",
  #     #   priority                   = "200"
  #     #   direction                  = "Inbound"
  #     #   access                     = "Allow"
  #     #   protocol                   = "tcp"
  #     #   source_port_range          = "*"
  #     #   destination_port_range     = "22"
  #     #   source_address_prefix      = "*"
  #     #   destination_address_prefix = "VirtualNetwork"
  #     # }
  #   ]

  # }

}
