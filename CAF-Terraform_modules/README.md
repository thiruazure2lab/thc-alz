# Cloud Adoption Framework for Azure - Terraform module

Microsoft [Cloud Adoption Framework for Azure](https://aka.ms/caf) provides you with guidance and best practices to adopt Azure.

This module allows you to create resources on Microsoft Azure, is used by the Cloud Adoption Framework for Azure (CAF) landing zones to provision resources in an Azure subscription and can deploy resources being directly invoked from the Terraform registry.

## Getting started

This module can be used to create resources on its own, or can be called from a CAF landing zone.

It can be invoked from the [Terraform registry](https://registry.terraform.io/modules/aztfmod/caf/azurerm/)

```terraform
module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "~>5.1.0"
  # insert the 7 required variables here
}
```