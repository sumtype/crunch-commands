#!/bin/bash
#Global Variable Declarations
URL=""
#Script Execution
if [ $# -eq 0 ]
then
  echo "You must specify a repository URL to clone from."
fi
if [ $# -eq 1 ]
then
  URL="$1"
  git clone "$URL"
  if [ $? -eq 0 ]
  then
    cd $(eval echo ${URL##*/} | cut -d '.' -f 1)
    if [ -f "package.json" ]
    then
      npm install
    fi
    cd ..
  fi
fi
