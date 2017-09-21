#!/bin/bash


set -e

echo " install vagrant plugins"
vagrant plugin install vagrant-disksize
vagrant plugin install vagrant-vbguest


#armbian vagrant version
echo "clone armbian vagrant version"
git clone https://github.com/igorpecovnik/lib.git armbian-vagrant

echo "change to armbian-vagrant"
cd armbian-vagrant

echo "save orginal Vagrantfile save"
cp Vargentfile Vagrantfile_save

echo "replace Vagrantfile"
cp ../Vagrantfile Vagrantfile

echo "vagrant up"
echo "the next thning make the provisioning_script inside the Vagrantfile"
vagrant up





