#!/bin/bash


set -e

echo " install vagrant plugins"
vagrant plugin install vagrant-disksize
vagrant plugin install vagrant-vbguest


#armbian vagrant version
echo "clone armbian vagrant version"
git clone https://github.com/armbian/build armbian-vagrant

echo "change to armbian-vagrant"
#cd $(dirname armbian-vagrant)
pushd armbian-vagrant

echo "save orginal Vagrantfile save"
cp Vagrantfile Vagrantfile_save

echo "replace Vagrantfile"
cp ../Vagrantfile Vagrantfile

echo "vagrant box update => we will work with the last version"
vagrant box update

echo "vagrant up"
echo "the next thning make the provisioning_script inside the Vagrantfile"
vagrant up

#vagrant status
popd

echo "\n\n\n"
echo "change to armbian-vagrant"
echo "type simple for Login inside Box"
echo "vagrant ssh"



