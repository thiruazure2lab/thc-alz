signalr_services = {
  sr1 = {
    name = "examplesr"
    resource_group_key = "re1"
    sku = {
        "name": "Premium_P1",
        "tier": "Premium",
        "size": "P1",
        "capacity": 2
    }
    kind = ""
    clientCertEnabled = false #optional defaults to false
    features = {
      {
        "flag": "ServiceMode",
        "value": "true"
      },
      {
        "flag": "EnableConnectivityLogs",
        "value": "true"
      }
    }
    allowedOrigins = [*]
    liveTraceConfiguration = {
      "enabled": "true",
      "categories": [
          {
              "name": "ConnectivityLogs",
              "enabled": "true"
          },
          {
              "name": "MessagingLogs",
              "enabled": "true"
          },
          {
              "name": "HttpRequestLogs",
              "enabled": "true"
          }
      ]
    }
    tags = {}
    
  }
}