set -e
read -ra arr <<< "${item}"
max=0
for n in "${arr[@]}" ; do
    ((n > max)) && max=$n
done
echo "max used number for ${type} $max"
echo "all values table:${tableName} \n sa:${storageAccountName} \n parition:${RR} \n Row ${AA} \n subs:${subscription} \n num:$max \n life ${LL}"
 
az storage entity insert -t ${tableName} --account-name ${storageAccountName} -e PartitionKey="${RR^^}.${AA^^}.${subscription^^}" RowKey="${type^^}.${LL^^}" Region=${RR^^} Customer=${AA^^} Subscription=${subscription^^} Type=${type^^} Lifecycle=${LL^^} MAX_NUMBER_USED=$max   --subscription 4e8fba9a-9170-45dc-9cea-5c03d95ba729  --if-exists replace --account-key xVst6bInt3f9qfpMxTQEajZHuX11QI9Y8rK41TPI0xVIHgxKr2wrAIx0HrSQdTiXSyOgiLKJYegAqDbbjywp1w==