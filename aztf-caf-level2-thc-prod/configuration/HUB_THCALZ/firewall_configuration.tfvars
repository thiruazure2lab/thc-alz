azurerm_firewalls = {
  firewall1 = {
    name               = "thc-conn-fw01"
    resource_group_key = "thcalz_conn_vnet_rg"
    vnet_key           = "thcalz_conn_vnet"
    sku_tier           = "Standard"
    zones              = ["1", "2", "3"]
    public_ips = {
      ip1 = {
        name          = "az_fw_pip"
        public_ip_key = "az_fw_pip"
        vnet_key      = "thcalz_conn_vnet"
        subnet_key    = "AzureFirewallSubnet"
        # lz_key = "lz_key"
      }
    }
  }
}

# diagnostic_profiles = {
#       central_logs_region1 = {
#         definition_key   = "azurerm_firewall"
#         destination_type = "event_hub"
#         destination_key  = "central_logs"
#       }
#     }
    
# diagnostics_definition = {
#   azurerm_firewall = {
#     name = "operational_logs_and_metrics"
#     categories = {
#       log = [
#         # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
#         ["AzureFirewallApplicationRule", true, false, 0],
#         ["AzureFirewallNetworkRule", true, false, 0],
#         ["AzureFirewallDnsProxy", true, false, 0],
#         ["AZFWApplicationRule", true, false, 0],
#         ["AZFWApplicationRuleAggregation", true, false, 0],
#         ["AZFWDnsQuery", true, false, 0],
#         ["AZFWFatFlow", true, true, 0],
#         ["AZFWFlowTrace", true, true, 0],
#         ["AZFWFqdnResolveFailure", true, false, 0],
#         ["AZFWIdpsSignature", true, false, 0],
#         ["AZFWNatRule", true, false, 0],
#         ["AZFWNatRuleAggregation", true, false, 0],
#         ["AZFWNetworkRule", true, false, 0],
#         ["AZFWNetworkRuleAggregation", true, false, 0],
#         ["AZFWThreatIntel", true, false, 0],
#       ]
#       metric = [
#         #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
#         ["AllMetrics", true, false, 0],
#       ]
#     }

#   }
# }