#!/bin/sh

workingDir=$PWD

cd "$PWD/nixos/configs/rice"
./link.sh
cd $workingDir
