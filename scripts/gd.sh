#!/bin/bash
#Function Declarations
getBranch() {
  echo $(git status | head -n 1 | cut -d ' ' -f 3)
}
#Script Execution
if [ $# -eq 0 ]
then
  git pull origin $(getBranch)
else
  git pull $1 $(getBranch)
fi
