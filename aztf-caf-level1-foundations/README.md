# Cloud Adoption Framework landing zones for Terraform - Level 1 (Foundation)

This repository contains MPG's Terraform configuration files for the Cloud Adoption Framework (CAF) implementation of Level 1 Landing Zones.

# What is the CAF?

Microsoft [Cloud Adoption Framework for Azure](https://aka.ms/caf) provides you with guidance and best practices to adopt Azure.

A landing zone is a segment of a cloud environment, that has been preprovisioned through code, and is dedicated to the support of one or more workloads. Landing zones provide access to foundational tools and controls to establish a compliant place to innovate and build new workloads in the cloud, or to migrate existing workloads to the cloud. Landing zones use defined sets of cloud services and best practices to set you up for success.

## Getting started

To get started with creating your environment, you can clone this repository and then make customisations in for the following ways.

### Configuration

Make customisations by changing files inside the [configuration folder](./configuration). 

### DevOps

#### Pipelines...

Make customisations by changing files inside the [pipelines folder](./pipelines).

## Related repositories

Landing zones for Terraform are composed of multiple open-source components and projects:

| Repo                                                                                              | Description                                                |
|---------------------------------------------------------------------------------------------------|------------------------------------------------------------|
| [caf-terraform-landingzones](https://dev.azure.com/MPG-GS-Azure-MSP/MPG-GS-Azure-LandingZone/_git/caf-terraform-landingzones)    | landing zones repo with sample and core documentations     |
| [rover](https://github.com/aztfmod/rover)                                                         | devops toolset for operating landing zones                 |
| [azure_caf_provider](https://github.com/aztfmod/terraform-provider-azurecaf)                      | custom provider for naming conventions                     |
| [module](https://dev.azure.com/MPG-GS-Azure-MSP/MPG-GS-Azure-LandingZone/_git/caf-terraform-modules)                                           | CAF Terraform module                                       |
