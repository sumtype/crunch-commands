if [ $# -eq 0 ]
  then
    echo "You must specify an appropriate command, enter 'crunch-commands -h' for more information."
  else
    if [ "$1" == "help" ]
      then
        . help.sh
      else
        if [ "$1" == "update" ]
          then
            . update.sh
          else
            echo ""
            echo "Action not recognized, enter 'crunch-commands help' for more information about available actions."
            echo ""
        fi
    fi
fi
