#!/bin/bash
set -e
eval "$(jq -r '@sh "export secret=\(.secret) kvname=\(.kvname)"')"
##########az account set -s 4e8fba9a-9170-45dc-9cea-5c03d95ba729
res=$(az keyvault secret show --name ${secret} --vault-name ${kvname} )
value=$(jq -r ".value" <<< ${res})
jq -n --arg value "$value" '{"value":$value}'