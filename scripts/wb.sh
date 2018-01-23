#!/bin/bash
#Global Variable Declarations
INPUT="$@"
QUERY=" "
#Script Execution
for i in "${INPUT[@]}"; do
  QUERY+="$i"
done
sensible-browser "https://duckduckgo.com/?q=$QUERY"
