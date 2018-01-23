#!/bin/bash
#Global Variable Declarations
echo "Updating Crush Commands package..."
CURRENT_DIR="$PWD"
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ../..
git pull origin master
. install.sh update
cd "$CURRENT_DIR"
