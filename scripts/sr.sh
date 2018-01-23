#!/bin/bash
find $1 -type f -exec shred -n 40 {} \;
rm -rf $1
