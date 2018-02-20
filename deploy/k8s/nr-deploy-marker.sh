#!/bin/bash
# Arguments:
#  $1: NR APP ID
#  $2: NR API key
#  $3: SCM URI
#  $4: SCM revision
#  $5: Build Number
#  $6: User name (build queued by)

echo "NR APP ID   : $1"
echo "NR API key  : $2"
echo "SCM URI     : $3"
echo "SCM revision: $4"
echo "Build Number: $5"
echo "User name   : $6"

curl -X POST 'https://api.newrelic.com/v2/applications/'$1'/deployments.json' \
     -H 'X-Api-Key:'$2 -i \
     -H 'Content-Type: application/json' \
     -d \
'{
  "deployment": {
    "revision": "'$4'",
    "description": "Revision in repository: '$3'/commit/'$4', Build Number: '$5'",
    "user": "'$6'"
  }
}' 