
automations = {
  automation-prod = {
    region             = "thcuks"
    name               = "thc-uks-prd-automation"
    sku                = "basic"
    resource_group_key = "thcalz_mgmt_monitor_rg"
    # diagnostic_profiles = {
    #   p1 = {
    #     name             = "operational_logs"
    #     definition_key   = "azure_automation"
    #     destination_type = "log_analytics"
    #     destination_key  = "central_logs"
    #     # Here the log_analytics_destination type is set.
    #     log_analytics_destination_type = "Dedicated"
    #   }
    # }
  }
}

shared_services = {
  automation_log_analytics_links = {
    link1 = {
      workspace_key          = "alz_la"
      automation_account_key = "automation-prod"
      resource_group_key     = "thcalz_mgmt_monitor_rg"
    }
  }
}
