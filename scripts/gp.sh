#!/bin/bash
#Global Variable Declarations
REPO=""
#Function Declarations
getBranch() {
  echo $(git status | head -n 1 | cut -d ' ' -f 3)
}
#Script Execution
git add --all
if [ $# -eq 0 ]
then
  git commit -S -m "Updated files."
  git push origin $(getBranch)
fi
if [ $# -eq 1 ]
then
  REPO="$1"
  git commit -S -m "Updated files."
  git push "$REPO" $(getBranch)
fi
if [ $# -eq 2 ]
then
  REPO="$1"
  shift
  git commit -S -m "$@"
  git push "$REPO" $(getBranch)
fi
