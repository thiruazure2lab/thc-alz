global_settings = {
  default_region = "region1"
  environment    = "test"
  regions = {
    region1 = "southeastasia"
    region2 = "eastasia"
    region3 = "westeurope"
  }
}


resource_groups = {
  # Default to var.global_settings.default_region. You can overwrite it by setting the attribute region = "region2"
  acr_region1 = {
    name = "acr"
  }
  vnet_region1 = {
    name = "acr-vnet"
  }
}

azure_container_registries = {
  acr1 = {
    name                       = "acr-test"
    resource_group_key         = "acr_region1"
    sku                        = "Premium"
    georeplication_region_keys = ["region2", "region3"]
    network_rule_set = {
      rule1 = {
        default_action = "Allow"
        # ip_rules = {
        #   rule1 = {
        #     ip_range = [""]
        #   }
        # }
        virtual_networks = {
          acr1_jumphost = {
            vnet_key   = "hub_rg1"
            subnet_key = "jumphost"
          }
        }
      }
    }

  }
}


vnets = {
  hub_rg1 = {
    resource_group_key = "vnet_region1"
    vnet = {
      name          = "hub"
      address_space = ["100.64.100.0/22"]
    }
    specialsubnets = {}
    subnets = {
      jumphost = {
        name              = "jumphost"
        cidr              = ["100.64.103.0/27"]
        service_endpoints = ["Microsoft.ContainerRegistry"]
      }
    }
  }

}

