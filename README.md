# armbian-sunxi-fel-boot

#Version 0.0.1

# TL;DR
> - ```git clone https://github.com/MathiasStadler/armbian-sunxi-fel-boot```
> - ```chmod +x run.sh```
> - cross fingers
> - ```./run.sh```
> - ```cd armbian-vagrant```
> - ```vagrant ssh```
> - ```chmod +x compile_and_start_felmode_orangepiplus.sh```
> - ```./compile_and_start_felmode_orangepiplus.sh```
> - follow the instruction after the compilation and image preparation phase 
> - for more details please visit the linked  website and repos

# Hints and Errors
- if you find any .... please let me know => stadler-mathias@web.de
- a screenshot , a one liner ... is more than enough

# Preparations 
- have a big cup of coffee :-)
- check whether you already installed:   
    - git 
    - vagrant
    - virtualbox & Extension Pack for USB support
    

# Tag 
- sunxi 
- orangepi one, plus, zero 
- H3 
- armbian

# Motivation  
- convenience
- Booting an ORANGEPI SBC (Single Board computer) without preparing of a SD card for booting


# entry FEL MODE
- the vagrant box is already prepare with the virtualbox usb filter

## OrangePi plus
- details see here please =>  http://linux-sunxi.org/Xunlong_Orange_Pi_Plus
- The button marked SW3, located between the HDMI and SATA, triggers FEL mode when pressed during boot. 
- (SW3 pulls the H3 BOOTSEL pin to low level.)
- To verify you have successfully entered FEL mode, check the output of fel version. 
- For the Orange Pi Plus, it should look like:
```lsusb```
```Bus 001 Device 002: ID 1f3a:efe8 Onda (unverified) V972 tablet in flashing mode```
```sudo sunxi-fel version```
- the output should be for a orangepi plus SBC
```AWUSBFEX soc=00001680(H3) 00000001 ver=0001 44 08 scratchpad=00007e00 00000000 00000000```


# Necessary hardware
- orange pi SBC - i'm tested that with a orange pi plus 
- Power adapter for SBC 
- USB cable for the OTG USB plug
- serial console - I'm used a FTD1232 <=> usb adapter 3,3 Volt  


# procedure of run.sh

1. check/install necessary vagrant plugin
> ```vagrant plugin list```
>  we should have 
>    -   vagrant-disksize  for armbian vagrant based env
>    -   vagrant-vbguest for your convenience

- ```vagrant plugin install vagrant-disksize```
- ```vagrant plugin install vagrant-vbguest```    

2. clone the vagrant version of armbian vagrant
- ```git clone https://github.com/igorpecovnik/lib.git armbian-vagrant```

3. echo "change to armbian-vagrant folder"
- ```cd armbian-vagrant```

4. save orginal Vagrantfile 
```cp Vargentfile Vagrantfile_save```

5. replace Vagrantfile with Vagrantfile of these repo
```cp ../Vagrantfile Vagrantfile```

6. start vagrant box 
- the next thing make the provisioning_script inside the Vagrantfile
- ```vagrant up```

> - You can start every time from scratch
> - Attention you loss all your work, data ....
> - Think before and maybe make a copy before
> - set a passwd for user ubuntu
> - ```passwd ubuntu```
> - logout out 
> - ```exit```
> - stop vagrant box
> - ```vagrant halt```
> - get list all names of boxes/vm
> - ```vboxmanage  list vms```
> - clone box 
> - ```vboxmanage clonevm --snapshot "<CURRENT VM NAME>" --name "<NAME_OF_COPY>" --register```
> - e.g.
> - ```vboxmanage clonevm --snapshot "Armbian Builder" --name "Armbian Builder save" --register```
> -  rerun a new box  destroy > up 
> - ```vagrant destroy```
> - ```vagrant up```

7. execute the  provisioning_script
    - is start with the command vagrant up

# Changes inside the Vagrantfile
- add a 2nd bridge network adapter with custom MAC address 
- add USB filter for orange pi H3 OTG USB 
- add the the copy command for  fel-bbot.sh script and set the IP address from the 2nd network adapter. So is NFS boot possible.  

# Wiki 
## Fel Mode [https://linux-sunxi.org/FEL]


# unsorted
- [Github mastering markdown](https://guides.github.com/features/mastering-markdown/)

- [Power button orangepiplus](https://parglescouk.wordpress.com/2016/08/30/shutting-down-an-orange-pi-from-the-on-board-button/)
 - https://github.com/jernejsk/OpenELEC-OPi2/issues/12


# custom script for compile and start FEL modus 
- the command above should run inside the vagrant box
- follow the instruction after the compile phase
- ```/compile.sh KERNEL_ONLY=no KERNEL_CONFIGURE=no BOARD=orangepiplus BRANCH=next PROGRESS_DISPLAY=plain RELEASE=xenial BUILD_DESKTOP=yes ROOTFS_TYPE=fel.```

# get ip from adapter with custom mac address
- IP_LINK_ADDR=$(ip -o address |grep -v inet6 | grep $(ip -o link |grep aa:bb:cc:dd:ee:ff|awk {'print $2'}|sed 's/://') | awk {'print $4'}|cut -d \/ -f 1)

# sed command for replace placeholder FEL_LOCAL_IP with ip addr of 2nd network adapter
- ```sed -i "s/FEL_LOCAL_IP/$(echo $IP_LINK_ADDR)/g" userpatches/fel-boot.cmd```
- please notice the double quotas for substitute the shell variable in the sed command   



# network driver 