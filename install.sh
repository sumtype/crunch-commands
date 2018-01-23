#!/bin/bash
#Global Variable Declarations
COMMANDS_EXPORT="export PATH=\"\$PATH:$PWD/scripts\""
CRUNCH_COMMAND_EXPORT="export PATH=\"\$PATH:$PWD/scripts/crunch-commands\""
COMMANDS=("crunch-commands/scripts" "crunch-commands/scripts/crunch-commands" "alias crunch-commands=\". crunch-commands.sh\"")
LOOP_ITERATION=0
#Function Declarations
getPatternLinesInFile() {
  echo $(grep -n "$1" -e "$2") | cut -f 1 -d ":"
}
trimCharacters() {
  cut -c "$(($1+1))"- | rev | cut -c "$(($2+1))"- | rev
}
#Script Execution
#Make alias strings for each shell script in the folder and put them into the COMMANDS array.
cd scripts
for i in $(find . -maxdepth 1 -name "*.sh"); do
  COMMANDS+=( "alias $(echo $i | trimCharacters 2 3)=\". $(echo $i | trimCharacters 2 3).sh\"" )
done
###Message for the user.
if [ "$1" == "update" ]
  then
    echo "Reinstalling Crunch Commands..."
  else
    echo "Installing Crunch Commands..."
fi
###Copy ~/.bashrc to bashrc.txt for editing.
cp ~/.bashrc bashrc.txt
###Remove the previous export folders and command aliases from bashrc.txt and add the new export folders and aliases.
for i in "${COMMANDS[@]}"; do
  if [ "$(getPatternLinesInFile ./bashrc.txt "$i")" != "" ]
    then
      sed -i "$(getPatternLinesInFile ./bashrc.txt "$i") d" ./bashrc.txt
  fi
  if [ $LOOP_ITERATION -eq 0 ]
    then
      echo $COMMANDS_EXPORT >> ./bashrc.txt
    else
      if [ $LOOP_ITERATION -eq 1 ]
        then
          echo $CRUNCH_COMMAND_EXPORT >> ./bashrc.txt
        else
          echo $i >> ./bashrc.txt
      fi
  fi
  LOOP_ITERATION=$((LOOP_ITERATION+1))
done
###Replace ~/.bashrc with bashrc.txt
cp ./bashrc.txt ~/.bashrc
###Remove bashrc.txt
rm -rf ./bashrc.txt
###Source the new ~/.bashrc file.
. ~/.bashrc
###Message for the user.
if [ "$1" == "update" ]
  then
    echo "Reinstallation complete."
  else
    echo "Installation complete."
fi
