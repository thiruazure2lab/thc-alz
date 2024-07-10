terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "=1.6.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "thc-uks-sentinel-rg01"
    storage_account_name = "saukstflevel2sentinel"
    container_name       = "tfstate"
    key                  = "terraform.sentinel.tfstate"
  }

}

provider "azurerm" {
  features {}
  client_id       = "56b86720-69d2-4d4e-910b-66d9fbfe9171"
  client_secret   = "6Sw8Q~5H1juJQaJod1cYSQQW7VJ-lV0Saup3Jdyt"
  tenant_id       = "89f0b56e-6d16-4fe8-9dba-176fa940f7c9"
  subscription_id = "6b604172-d40d-4fb7-a40c-046aed5f5e7e"
}
