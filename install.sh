#!/bin/sh

#### ================
## checking perms
#### ================

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

./setup-scripts/setup-nix.sh
