# network_security_group_definition = {
#   nsg-test-prod = {
#     version            = 1
#     resource_group_key = "thcalz_prod_test_rg"
#     name               = "nsg-test-prod"
#     nsg = [
#       # {
#       #   name                       = "ssh-inbound-22",
#       #   priority                   = "200"
#       #   direction                  = "Inbound"
#       #   access                     = "Allow"
#       #   protocol                   = "tcp"
#       #   source_port_range          = "*"
#       #   destination_port_range     = "22"
#       #   source_address_prefix      = "*"
#       #   destination_address_prefix = "VirtualNetwork"
#       # }
#     ]
#   }
# }