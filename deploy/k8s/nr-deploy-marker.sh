#!/bin/bash
# Arguments:
#  $0: NR APP ID
#  $1: NR API key
#  $2: SCM revision
#  $3: Build Number
#  $4: User name (build queued by)

curl -X POST 'https://api.newrelic.com/v2/applications/$0/deployments.json' \
     -H 'X-Api-Key:$1' -i \
     -H 'Content-Type: application/json' \
     -d \
'{
  "deployment": {
    "revision": "$2",
    "changelog": "",
    "description": "$3",
    "user": "$4"
  }
}' 