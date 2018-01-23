#!/bin/bash
#Global Variable Declarations
DIRECTORY_PATH="$1"
LOCATION_PATH="$2"
UPDATE_INTERVAL="$3"
DATE_UNFORMATTED=""
DATE_FORMATTED=""
#Script Execution
while [ true ]; do
  rsync -ar --exclude='.git' $DIRECTORY_PATH $LOCATION_PATH
  DATE_UNFORMATTED="$(date +%s)"
  DATE_FORMATTED="$(date -d @$DATE_UNFORMATTED +%Y-%m-%d) @ $(date -d @$DATE_UNFORMATTED +%T)"
  echo "sf.sh: $DIRECTORY_PATH synced to $LOCATION_PATH on $DATE_FORMATTED"
  sleep $UPDATE_INTERVAL
done
