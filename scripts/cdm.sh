#!/bin/bash
if [ $# -eq 0 ]
then
  echo "You must specify a path to create and navigate to."
fi
if [ $# -eq 1 ]
then
  mkdir -p $1 && cd $1
fi
