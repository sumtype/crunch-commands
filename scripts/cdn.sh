#!/bin/bash
cd $1 && [ -f ./.nvmrc ] && nvm use
