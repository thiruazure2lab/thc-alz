set -e

export TENANT="manpowergroupapps.onmicrosoft.com"
export SCOPE="https://graph.microsoft.com/.default"
export GRAPH_URL="https://graph.microsoft.com/beta"
export OAUTH_URL="https://login.microsoftonline.com/$TENANT/oauth2/v2.0/token"


generate_token(){
    echo "t"
    if [ ! -f authtoken ]; then
      echo "f"
      echo $    
      CLID=${CAF_SP_CLIENTID}
      KEY=$(az keyvault secret show --name "CAF-SP-CLIENTID" --vault-name "kva3gsp002"| jq -r ".value" )
      echo "secret $KEY"
      echo $KEY
      echo $SCOPE
      ## authenticate and get bearer token
      curl -s $OAUTH_URL -X POST -H "Content-Type: application/x-www-form-urlencoded" --data-urlencode "client_id=$CLID" --data-urlencode "scope=$SCOPE" --data-urlencode "client_secret=$KEY" --data-urlencode "grant_type=client_credentials"
      TOKEN=$(curl -s $OAUTH_URL -X POST -H "Content-Type: application/x-www-form-urlencoded" --data-urlencode "client_id=$CLID" --data-urlencode "scope=$SCOPE" --data-urlencode "client_secret=$KEY" --data-urlencode "grant_type=client_credentials" | jq -r .access_token)
      
      echo $TOKEN
      # write token to file
      echo $TOKEN > authtoken
      echo "h"
    fi
    # display JSON content in token
    #PAYLOAD=$(echo $TOKEN | awk -F'.' '{print $2}' | base64 -d 2>/dev/null) # extract payload and base64 decode
    
}
generate_payload(){
    name="${access_package}"
    des="${access_description}"
    catId="${access_catalogId}"

    payload=$(jq -n --arg displayName "$name" --arg description "$des" --arg catalogId "$catId" '{"displayName":$displayName,"description":$description,"catalogId":$catalogId}')
    echo $payload > payload

    echo $payload
}

generate_payload_catalogAdd(){
    catId="${access_catalogId}"
    accessPackageResource=$(jq -n --arg originId "${groupId}" --arg originSystem "AadGroup" '{"originId":$originId,"originSystem":$originSystem}')
    payload_cat_add=$(jq -n --arg catalogId "$catId" --arg requestType "AdminAdd" --argjson accessPackageResource "$accessPackageResource" '{"catalogId":$catalogId,"requestType":$requestType,"accessPackageResource":$accessPackageResource}')
    echo $payload_cat_add>payload_cat_add
}

generate_payload_role(){

    #TOKEN=$(cat authtoken)
    host="$GRAPH_URL/identityGovernance/entitlementManagement/accessPackageCatalogs/${access_catalogId}/accessPackageResources"

    res=$(curl  -X GET -H "Authorization: Bearer $TOKEN"  -s $host)
    
    echo $res

    value=$(jq -r '.value' <<< ${res})
    
    groupOriginId="Member_${groupId}"
    accessPackageResource=$(echo "$value" | jq -c '.[] | select( .originId | contains("'"${groupId}"'"))')
    accessPackageResourceScope=$(jq -n --arg originId "${groupId}" --arg originSystem "AadGroup" '{"originId":$originId,"originSystem":$originSystem}')
    accessPackageResourceRole=$(jq -n --arg originId "${groupOriginId}" --arg displayName "Member" --arg originSystem "AadGroup" --argjson accessPackageResource "$accessPackageResource" '{"originId":$originId,"displayName":$displayName,"originSystem":$originSystem,"accessPackageResource":$accessPackageResource}')
    payload_role=$(jq -n --argjson accessPackageResourceRole "$accessPackageResourceRole" --argjson accessPackageResourceScope "$accessPackageResourceScope" '{"accessPackageResourceRole":$accessPackageResourceRole,"accessPackageResourceScope":$accessPackageResourceScope}')
    echo $payload_role>payload_role
}

generate_payload_policy(){
    echo ${accessPackageId}
    atrue=true
    afalse=false
    policyDname="Policy for all users access request"
    pdes="Policy for all users access request with two stage approval"
    allowedTargetScope="allDirectoryUsers"
    primaryApproversJson='[{"@odata.type":"microsoft.graph.singleUser","id":"%s"}]'
    primaryApprovers=$(printf "$primaryApproversJson" "${primaryApproverId}")
    secondaryApproverJson='[{"@odata.type":"microsoft.graph.groupMembers","id":"%s"}]'
    secondaryApprover=$(printf "$secondaryApproverJson" "${secondaryApproverId}")
    stagesJson='[{"approvalStageTimeOutInDays":14,"isApproverJustificationRequired":true,"isEscalationEnabled":false,"primaryApprovers":%s,"escalationApprovers":[]},{"approvalStageTimeOutInDays":14,"isApproverJustificationRequired":true,"isEscalationEnabled":false,"primaryApprovers":%s,"escalationApprovers":[]}]'
    approvalStages=$(printf "$stagesJson" "$primaryApprovers" "$secondaryApprover")
    requestApprovalSettings='{"isApprovalRequired":true,"isApprovalRequiredForExtension":true,"isRequestorJustificationRequired":true,"approvalMode":"Serial","approvalStages":'$approvalStages'}'
    questions1Json='{"@odata.type": "#microsoft.graph.accessPackageTextInputQuestion","sequence":1,"isRequired":true,"isSingleLineQuestion":true,"text":{"@odata.type": "#microsoft.graph.accessPackageLocalizedContent","defaultText":"What is the ServiceNow Request ID?"}}'
    questions2Json='{"@odata.type": "#microsoft.graph.accessPackageTextInputQuestion","sequence":2,"isRequired":true,"isSingleLineQuestion":true,"text":{"@odata.type": "#microsoft.graph.accessPackageLocalizedContent","defaultText":"What is the name of your immediate manager?"}}'
    questions3Json='{"@odata.type": "#microsoft.graph.accessPackageTextInputQuestion","sequence":3,"isRequired":true,"isSingleLineQuestion":true,"text":{"@odata.type": "#microsoft.graph.accessPackageLocalizedContent","defaultText":"Why you require this access?"}}'
    questions4Json='{"@odata.type": "#microsoft.graph.accessPackageTextInputQuestion","sequence":4,"isRequired":true,"isSingleLineQuestion":true,"text":{"@odata.type": "#microsoft.graph.accessPackageLocalizedContent","defaultText":"For how long you will require this access?"}}'
    questions5Json='{"@odata.type": "#microsoft.graph.accessPackageTextInputQuestion","sequence":5,"isRequired":true,"isSingleLineQuestion":true,"text":{"@odata.type": "#microsoft.graph.accessPackageLocalizedContent","defaultText":"You are accessing from which country?"}}'
    question=$(printf "[$questions1Json,$questions2Json,$questions3Json,$questions4Json,$questions5Json]")
    payload_policy='{"accessPackageId":"'"${accessPackageId}"'","displayName":"'"${policyDname}"'","description":"'"${pdes}"'","expirationDateTime":null,"canExtend":false,"requestorSettings":{"scopeType":"AllExistingDirectoryMemberUsers","acceptRequests":true},"questions":'${question}',"requestApprovalSettings":'$requestApprovalSettings'}'
}

access_package_catAdd(){
    
    echo "toke_rolen_cat"
    #TOKEN=$(cat authtoken)
    #echo $TOKEN
    echo "here_role_cat"
    generate_payload_catalogAdd
    
    host="$GRAPH_URL/identityGovernance/entitlementManagement/accessPackageResourceRequests"

    response3=$(curl  -H "Authorization: Bearer $TOKEN"  -H "Content-Type:application/json" \
    -X POST --data "${payload_cat_add}" $host)
    
    echo $response3 
}

access_package_role(){
    
    echo "toke_rolen"

    #TOKEN=$(cat authtoken)
    echo $TOKEN
    echo "here_role"
    generate_payload_role
    
    host="$GRAPH_URL/identityGovernance/entitlementManagement/accessPackages/${accessPackageId}/accessPackageResourceRoleScopes"

    response2=$(curl  -H "Authorization: Bearer $TOKEN"  -H "Content-Type:application/json" \
    -X POST --data "${payload_role}" $host --verbose)
    echo $response2
    
}

access_package_policy(){
    echo "package policy"
    host="$GRAPH_URL/identityGovernance/entitlementManagement/accessPackageAssignmentPolicies"
    generate_payload_policy
    response_policy=$(curl  -H "Authorization: Bearer $TOKEN"  -H "Content-Type:application/json" \
    -X POST --data "${payload_policy}" $host)
    echo $response_policy
}

access_package(){
    access_package_catAdd
    echo "token"

    #TOKEN=$(cat authtoken)
    echo $TOKEN
    echo "here"
    generate_payload
    
    host="$GRAPH_URL/identityGovernance/entitlementManagement/accessPackages"

    response=$(curl  -H "Authorization: Bearer $TOKEN"  -H "Content-Type:application/json" \
    -X POST --data "${payload}" $host)
    echo $response
    export accessPackageId=$(jq -r '.id' <<< ${response})
    echo $accessPackageId
    sleep 15s
    access_package_role
    access_package_policy
}
echo "hello"
echo "${access_package}"
echo "new"
generate_token
access_package
