set -e
echo $key
get_num () {
    max_num=0
    az storage entity show --partition-key "${RR^^}.${AA^^}.${subscription^^}" --row-key "${type^^}.${LL^^}" -t ${tableName} --account-name ${storageAccountName} --subscription 4e8fba9a-9170-45dc-9cea-5c03d95ba729 --account-key xVst6bInt3f9qfpMxTQEajZHuX11QI9Y8rK41TPI0xVIHgxKr2wrAIx0HrSQdTiXSyOgiLKJYegAqDbbjywp1w== || az storage entity insert -t ${tableName} --account-name ${storageAccountName} -e PartitionKey="${RR^^}.${AA^^}.${subscription^^}" RowKey="${type^^}.${LL^^}" Region=${RR^^} Customer=${AA^^} Subscription=${subscription^^} Type=${type^^} Lifecycle=${LL^^} MAX_NUMBER_USED=$max_num  --subscription 4e8fba9a-9170-45dc-9cea-5c03d95ba729  --if-exists replace --account-key xVst6bInt3f9qfpMxTQEajZHuX11QI9Y8rK41TPI0xVIHgxKr2wrAIx0HrSQdTiXSyOgiLKJYegAqDbbjywp1w==
    res=$(az storage entity show --partition-key "${RR^^}.${AA^^}.${subscription^^}" --row-key "${type^^}.${LL^^}" -t ${tableName} --account-name ${storageAccountName} --subscription 4e8fba9a-9170-45dc-9cea-5c03d95ba729 --account-key xVst6bInt3f9qfpMxTQEajZHuX11QI9Y8rK41TPI0xVIHgxKr2wrAIx0HrSQdTiXSyOgiLKJYegAqDbbjywp1w==);
    etag=$(jq -r ".etag" <<< ${res})
    num=$(jq -r ".MAX_NUMBER_USED" <<< ${res})
    echo $num
    max_num=$(($num+1))
    export local_max_num=$max_num
    export newetag=$etag
    echo $max_num
    
    
}

set_num () {
  az storage entity replace -t ${tableName} --account-name ${storageAccountName} -e PartitionKey="${RR^^}.${AA^^}.${subscription^^}" RowKey="${type^^}.${LL^^}" Region=${RR^^} Customer=${AA^^} Subscription=${subscription^^} Type=${type^^} Lifecycle=${LL^^} MAX_NUMBER_USED=${local_max_num} --subscription 4e8fba9a-9170-45dc-9cea-5c03d95ba729 --account-key xVst6bInt3f9qfpMxTQEajZHuX11QI9Y8rK41TPI0xVIHgxKr2wrAIx0HrSQdTiXSyOgiLKJYegAqDbbjywp1w== --if-match ${newetag}
}

get_name () {
  n=${#local_max_num}
  a=1
  b=2
  if [ $n == $a ]
  then
    vmnum="00$local_max_num"
  elif [ $n == $b]
  then
    vmnum="0$local_max_num"
  else
    vmnum="$local_max_num"
  fi
  vmname="vm${RR,,}${AA,,}${LL,,}${type_code,,}${vmnum}"
  echo "vmname=$vmname"
  echo $vmname > $key
  az storage entity insert -t vminventory --account-name ${storageAccountName} -e PartitionKey="${RR^^}.${AA^^}.${subscription^^}.${type^^}.${LL^^}" RowKey="${key^^}" Region=${RR^^} name=${vmname} --subscription 4e8fba9a-9170-45dc-9cea-5c03d95ba729  --if-exists replace --account-key xVst6bInt3f9qfpMxTQEajZHuX11QI9Y8rK41TPI0xVIHgxKr2wrAIx0HrSQdTiXSyOgiLKJYegAqDbbjywp1w==
}

echo "here"
get_num
until set_num
do 
  sleep 10;
  get_num
  echo "waiting";
done
echo "done"

get_name
