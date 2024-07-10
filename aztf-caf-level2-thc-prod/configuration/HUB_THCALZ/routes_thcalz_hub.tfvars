
# route_tables = {
#   udr-hub-rt = {
#     name               = "RT-SN-THCALZ-HUB"
#     resource_group_key = "thcalz_hub_vnet_rg"
#   }
#   udr-hub-corp-rt = {
#     name               = "RT-SN-THCALZ-HUB-CORP"
#     resource_group_key = "thcalz_hub_vnet_rg"
#   }
#   udr-hub-sec-rt = {
#     name               = "RT-SN-THCALZ-HUB-SEC"
#     resource_group_key = "thcalz_hub_vnet_rg"
#   }
#   udr-north-south-rt = {
#     name               = "RT-SN-THCALZ-North-South"
#     resource_group_key = "thcalz_hub_vnet_rg"
#   }
# }

# azurerm_routes = {
#   udr-hub = {
#     name               = "R-SN-THCALZ-HUB"
#     resource_group_key = "thcalz_hub_vnet_rg"
#     route_table_key    = "udr-hub-rt"
#     address_prefix     = "10.34.0.0/22"
#     next_hop_type      = "virtualappliance" 
#     next_hop_in_ip_address = "10.34.2.132"
#   }
#   udr-hub-corp = {
#     name               = "R-SN-THCALZ-HUB-CORP"
#     resource_group_key = "thcalz_hub_vnet_rg"
#     route_table_key    = "udr-hub-corp-rt"
#     address_prefix     = "10.34.4.0/25"
#     next_hop_type      = "virtualappliance" 
#     next_hop_in_ip_address = "10.34.2.132"

#   }
#   udr-hub-sec = {
#     name               = "R-SN-THCALZ-HUB-SEC"
#     resource_group_key = "thcalz_hub_vnet_rg"
#     route_table_key    = "udr-hub-sec-rt"
#     address_prefix     = "10.34.4.128/25"
#     next_hop_type      = "virtualappliance" 
#     next_hop_in_ip_address = "10.34.2.132"
#   }
  
#   udr-north-south = {
#     name               = "R-SN-THCALZ-North-South"
#     resource_group_key = "thcalz_hub_vnet_rg"
#     route_table_key    = "udr-north-south-rt"
#     address_prefix     = "0.0.0.0/0"   # default route for internet
#     next_hop_type      = "Internet" 
#     #next_hop_in_ip_address = "10.34.2.132"
#   }
# }





