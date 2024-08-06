terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.41.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 1.5.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = ">= 1.2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.1.0"
    }
  }
}
provider "azurerm" {
  features {  
    key_vault {
      purge_soft_delete_on_destroy = true
    }
    
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    application_insights {
      disable_generated_rule = true
    }
    log_analytics_workspace {
      permanently_delete_on_destroy = true
      }
    
  }   # Optional features block  
  skip_provider_registration = true


}
provider "azuread" {
  # Configuration options
  use_msi = true

  # use_msi = false

}
provider "random" {
  # Configuration options

}

provider "azurecaf" {
  # Configuration options
    # use_msi = false
}
provider "null" {
  # Configuration options
}
