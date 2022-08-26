#!/bin/sh

# quick setup, needs to be run as root

#### ================
## checking perms
#### ================

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

./link-nix.sh
sudo -u `logname` ./link.sh
nixos-rebuild switch
