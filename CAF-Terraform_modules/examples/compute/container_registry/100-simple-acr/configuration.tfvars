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
}

azure_container_registries = {
  acr1 = {
    name                       = "acr-test"
    resource_group_key         = "acr_region1"
    sku                        = "Premium"
    georeplication_region_keys = ["region2", "region3"]
  }
}

