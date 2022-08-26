#!/bin/sh

# quick setup, needs to be run as root

#### ================
## checking perms
#### ================

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

./setup-scripts/link-nix.sh
sudo -u `logname` ./setup-scripts/link.sh
sudo -u `logname` ./setup-scripts/link-rice.sh
nixos-rebuild switch
