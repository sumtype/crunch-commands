#!/bin/bash
#Script Execution
if [ $# -eq 0 ]
then
  echo "You must specify a URL for your origin remote repository."
fi
if [ $# -eq 1 ]
then
  git init
  git remote add origin "$1"
fi
