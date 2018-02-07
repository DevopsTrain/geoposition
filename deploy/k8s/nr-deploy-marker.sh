#!/bin/bash
# Arguments:
#  $1: NR APP ID
#  $2: NR API key
#  $3: SCM revision
#  $4: Build Number
#  $5: User name (build queued by)

curl -X POST 'https://api.newrelic.com/v2/applications/$1/deployments.json' \
     -H 'X-Api-Key:$2' -i \
     -H 'Content-Type: application/json' \
     -d \
'{
  "deployment": {
    "revision": "$3",
    "changelog": "",
    "description": "$4",
    "user": "$5"
  }
}' 