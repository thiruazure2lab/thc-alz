resource "azurerm_resource_group" "myrgterraform" {
  name     = "myrg-terraform"
  location = "East US"
  
}
terraform {
    required_version = ">= 1.0.0"
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = ">= 2.0"
        }
    }
    backend "azurerm" {
        resource_group_name   = "terraform-storage-rg"
        storage_account_name  = "terraformstate201"
        container_name        = "tfstatefiles"
        key                   = "terraform.tfstate"
    }
}
provider "azurerm" {
    features {}
    alias = "hj"
  
}