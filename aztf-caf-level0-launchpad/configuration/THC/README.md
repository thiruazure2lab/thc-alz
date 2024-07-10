# Cloud Adoption Framework landing zones for Terraform - Starter template

## Canary ENVIRONMENT

Assumptions:

- Canary environment is meant to be run locally and could optionally be run within Azure DevOps pipelines.
- Canary environment implements diagnostics and logs for every solution deployed.
- Canary environment implements rudimentary RBAC model.

:warning: This Requires owner privileges on the subscription to be deployed successfully. Only complete the following steps if you have those permissions or the launchpad deployment will fail.

## Deploying with local experience

After completing the steps from the general [configuration readme](../README.md), you can start using the sandpit deployment:

You can then specify the environment you are running:

```bash
export environment=canary
export caf_environment=canary

```

### 1. Launchpad-level0 landing zones

#### Deploy the launchpad

```bash
rover -lz /tf/caf/landingzones/caf_launchpad \
  -tfstate launchpad.tfstate \
  -var-folder /tf/caf/configuration/${environment} \
  -parallelism 30 \
  -level level0 \
  -env ${caf_environment} \
  -launchpad \
  -a [plan|apply|destroy]
```
