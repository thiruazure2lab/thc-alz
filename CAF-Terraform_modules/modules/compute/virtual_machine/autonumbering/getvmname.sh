#!/bin/bash
set -e
eval "$(jq -r '@sh "export key=\(.key) subscription=\(.subscription) storageAccountName=\(.storageAccountName) RR=\(.RR) AA=\(.AA) LL=\(.LL) type_code=\(.type_code) type=\(.type)"')"
az storage entity show --partition-key "${RR^^}.${AA^^}.${subscription^^}.${type^^}.${LL^^}" --row-key "${key^^}" -t vminventory --account-name ${storageAccountName} --subscription 4e8fba9a-9170-45dc-9cea-5c03d95ba729 --account-key xVst6bInt3f9qfpMxTQEajZHuX11QI9Y8rK41TPI0xVIHgxKr2wrAIx0HrSQdTiXSyOgiLKJYegAqDbbjywp1w==