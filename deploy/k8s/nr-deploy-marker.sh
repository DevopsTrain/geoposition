#!/bin/bash
# Arguments:
#  $0: NR APP ID
#  $1: NR API key
#  $2: SCM revision
#  $3: Build Number
#  $4: User name (build queued by)

echo "NR APP ID   : $0 "
echo "NR API key  : $1 "
echo "SCM revision: $2 "
echo "Build Number: $3 "
echo "User name   : $4 "

curl -X POST 'https://api.newrelic.com/v2/applications/$0/deployments.json' \
     -H 'X-Api-Key:$1' -i \
     -H 'Content-Type: application/json' \
     -d \
'{
  "deployment": {
    "revision": "$2",
    "description": "$3",
    "user": "$4"
  }
}' 