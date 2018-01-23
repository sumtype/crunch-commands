#!/bin/bash
echo 'Starting snazzy standard code styling check, with automated fixes where appropriate.'
standard --fix --env mocha | snazzy
