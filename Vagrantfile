# -*- mode: ruby -*-
# vi: set ft=ruby :


#custum MAC address for bridge network adpater
#we need a custum MAC for detect the DHCP IP address
box_bridge_mac_addr = "AABBCCDDEEFF"


Vagrant.require_version ">= 1.5"


#provisioning script runs once after the first vagrant up as user ubuntu
provisioning_script = <<SCRIPT
# use remote git version instead of sharing a copy from host to preserve proper file permissions
# and prevent permission related issues for the temp directory
git clone https://github.com/armbian/build /home/ubuntu/armbian
mkdir -p /vagrant/output /vagrant/userpatches
ln -sf /vagrant/output /home/ubuntu/armbian/output
ln -sf /vagrant/userpatches /home/ubuntu/armbian/userpatches
cp /home/ubuntu/armbian/config/templates/fel-boot.cmd.template /home/ubuntu/armbian/userpatches/fel-boot.cmd
#Get the ip from the bdridge device detect by custom MAC address
IP_LINK_ADDR=$(ip -o address |grep -v inet6 | grep $(ip -o link |grep BOX_BRIDGE_MAC_ADDR|awk {'print $2'}|sed 's/://') | awk {'print $4'}|cut -d / -f 1)
echo $IPLINK_ADDR
#Set/replace the IP address for the NFS server for the FEL-BOOT
sed -i "s/FEL_LOCAL_IP/$(echo $IP_LINK_ADDR)/g" /home/ubuntu/armbian/userpatches/fel-boot.cmd
SCRIPT

provisioning_script.gsub(/BOX_BRIDGE_MAC_ADDR/,box_bridge_mac_addr)

Vagrant.configure(2) do |config|

# network
#Add 2nd inface in bridge mode for the NFS server
config.vm.network "public_network", type: "dhcp", bridge: "eno1" , :mac => box_bridge_mac_addr

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
    config.vm.provision "shell", inline: provisioning_script

    # forward terminal type for better compatibility with Dialog - disabled on Ubuntu by default
    config.ssh.forward_env = ["TERM"]

    # default user name is "ubuntu", please do not change it

    # SSH password auth is disabled by default, uncomment to enable and set the password
    #config.ssh.password = "armbian"

    config.vm.provider "virtualbox" do |vb|
        
        #name of VM in virtualbox
        vb.name = "Armbian Builder"

        # uncomment this to enable the VirtualBox GUI
        #vb.gui = true

        # Tweak these to fit your needs.
        vb.memory = "8192"
        vb.cpus = "4"
    vb.customize ['modifyvm', :id, '--usb', 'on']
    #Add the usb filter for the USB Host Mode for the FEL Mode
    #Caheck inside with lsusb was succesfully if tzhe device is connect AND thr FEL Mode is active
	vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'OrangePiEFIMode', '--vendorid', '0x1f3a', '--productid', '0xefe8']
    end
end
