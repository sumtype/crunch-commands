#!/bin/bash
echo 'Running node.js application vulnerability checks.'
echo 'Starting `nsp check`.' && nsp check && echo 'Starting `retire`.' && retire && echo 'Starting `snyk test`.' && snyk test && echo 'Known vulnerability checks complete.'
