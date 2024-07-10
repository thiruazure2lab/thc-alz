# Cloud Adoption Framework landing zones for Terraform

## MSP ENVIRONMENT

Considerations:

- This level create custom management group hireracy


## Deploying with local experience

You can then specify the environment you are running:

```bash
export environment=MSP
export caf_environment=MSP
export Launchpad_subscription_id=xxxxxxxxxxxxxx

```

### 1. Launchpad-level0 landing zones

#### Deploy the foundation

```bash
rover -lz /tf/caf/landingzones/caf_solutions/addon/caf_eslz \
  -tfstate foundation.tfstate \
  -var-folder /tf/caf/configuration/${environment} \
  -parallelism 30 \
  -level level1 \
  -env ${caf_environment} \
  -tfstate_subsctiption_id ${Launchpad_subscription_id} \
  -a [plan|apply|destroy]
```
