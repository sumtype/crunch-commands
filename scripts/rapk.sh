#!/bin/bash
if [ $# -eq 3 ]
  then
    zipalign -v -p 4 "$1" "$2" && apksigner sign --ks "$3" "$2"
  else
    if [ $# -eq 2 ]
      then
        apksigner sign --ks "$2" "$1"
      else
        echo 'rapk: Error, missing argument(s).'
    fi
fi
