#!/bin/bash

echo "This is search! Starting searching..."

grep -r $2 $1 2>/dev/null
# $1--directory
# $2--pattern