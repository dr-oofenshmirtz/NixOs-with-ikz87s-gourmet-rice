#!/bin/sh

#### ================
## checking perms
#### ================

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#### ================
## cleaning
#### ================

echo "Creating Backup Dirs"

NOW=`date +%s` #too lazy to oneline this
PREV_BAK="prevbak.$NOW.tar.gz"
tar -czvf "$PREV_BAK" /etc/nixos/.oldconfs

rm -rf "$PWD/oldconfs" | true
rm -rf /etc/nixos/.oldconfs | true

mkdir "$PWD/oldconfs/" | true
mkdir /etc/nixos/.oldconfs | true

#### ================
## Backup
#### ================

echo "Creating Backups"

date +%F >> /etc/nixos/.oldconfs/bak.meta.txt
date +%T >> /etc/nixos/.oldconfs/bak.meta.txt

mv -f /etc/nixos/configuration.nix /etc/nixos/.oldconfs/
mv -f /etc/nixos/configs/* /etc/nixos/.oldconfs/configs/

cp /etc/nixos/.oldconfs/* "$PWD/oldconfs/"

#### ================
## Linking new configs
#### ================

echo "Linking New Configs"

# This feels like it might not work long term
ln -s "$PWD/nixos/"* /etc/nixos/

#### ================
## Update Permissions
#### ================
# As the script requires sudo all the movements were assigned to root

chown -R `logname`: "$PWD/oldconfs"
chown -R `logname`: $PREV_BAK



