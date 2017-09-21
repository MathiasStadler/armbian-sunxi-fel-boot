# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.5"

$provisioning_script = <<SCRIPT
# use remote git version instead of sharing a copy from host to preserve proper file permissions
# and prevent permission related issues for the temp directory
git clone https://github.com/armbian/build /home/ubuntu/armbian
mkdir -p /vagrant/output /vagrant/userpatches
ln -sf /vagrant/output /home/ubuntu/armbian/output
ln -sf /vagrant/userpatches /home/ubuntu/armbian/userpatches
cd
cd armbian
sudo ./compile.sh
#install sunix-tools
apt-get install -y libusb-1.0-0-dev pkg-config
cd
git clone https://github.com/linux-sunxi/sunxi-tools sunxi-tools
cd sunxi-tools
make tools
sudo make install-tools
cd
#tutorial from here
#http://linux-sunxi.org/FEL/USBBoot#Legacy_u-boot-sunxi
git clone git://git.denx.de/u-boot.git
cd u-boot

sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoclean
SCRIPT

Vagrant.configure(2) do |config|

    # What box should we base this build on?
    config.vm.box = "ubuntu/xenial64"


    
    #######################################################################
    # THIS REQUIRES YOU TO INSTALL A PLUGIN. RUN THE COMMAND BELOW...
    #
    #   $ vagrant plugin install vagrant-disksize
    #
    # Default images are not big enough to build Armbian.
    config.disksize.size = "40GB"

    # provisioning: install dependencies, download the repository copy
    config.vm.provision "shell", inline: $provisioning_script

    # forward terminal type for better compatibility with Dialog - disabled on Ubuntu by default
    config.ssh.forward_env = ["TERM"]

    # default user name is "ubuntu", please do not change it

    # SSH password auth is disabled by default, uncomment to enable and set the password
    #config.ssh.password = "armbian"

    config.vm.provider "virtualbox" do |vb|
        vb.name = "Armbian Builder"

        # uncomment this to enable the VirtualBox GUI
        #vb.gui = true

        # Tweak these to fit your needs.
        vb.memory = "8192"
        vb.cpus = "4"
	vb.customize ['modifyvm', :id, '--usb', 'on']
	vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'OrangePiEFIMode', '--vendorid', '0x1f3a', '--productid', '0xefe8']
    end
end
