#!/bin/bash


#stop vm 

vmName="Armbian Builder"

echo $vmName

vboxmanage controlvm "$vmName" poweroff
vboxmanage unregistervm "$vmName" --delete


rm -rf armbian-vagrant
