# armbian-sunxi-fel-boot

# Prepared 
- take a big cup of coffee :-)
- check you already installed  
    - git 
    - vagrant
    - virtualbox 
     

# Tag 
- sunxi 
- orangepi 
- [ one, plus, zero] 
- H3 
- armbian

# Motivation  
- Boot a orangepi SBC without SD card




# TL;DR
- This is  the TL;DR version

> - ```git clone https://github.com/MathiasStadler/armbian-sunxi-fel-boot```
> - ```chmod +x run.sh```
> - cross the fingers
> - ```./run.sh```

- for more details read and visit the linked  website and repos

# Hint and Errors
- if you find any .... please let me know that => stadler-mathias@web.de
- a screenshot , a one liner ... is more as enough


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

# CHanges inside the Vagrantfile
- TODO What & why


# Wiki 
## Fel Mode [https://linux-sunxi.org/FEL]
cd 

# unsorted
- [Github mastering markdown](https://guides.github.com/features/mastering-markdown/)

- [Power button orangepiplus](https://parglescouk.wordpress.com/2016/08/30/shutting-down-an-orange-pi-from-the-on-board-button/)
 - https://github.com/jernejsk/OpenELEC-OPi2/issues/12



 # TODO
 - https://docs.armbian.com/Developer-Guide_FEL-boot/#advanced-configuration
 - ```cd && cd armbian```
 - ```cp config/templates/fel-boot.cmd.template userpatches/fel-boot.cmd```

# TODO 1
found the ip from the dhcp server and set in userpatches/fel-boot.cmd as FEL_LOCAL_IP



 # entry FEL MODE
 ## OrangePi plus
 - [Info from here](http://linux-sunxi.org/Xunlong_Orange_Pi_Plus)
 - The button marked SW3, located between the HDMI and SATA, triggers FEL mode when pressed during boot. (SW3 pulls the H3 BOOTSEL pin to low level.)
- To verify you have successfully entered FEL mode, check the output of fel version. For the Orange Pi Plus, it should look like:
```lsusb
Bus 001 Device 002: ID 1f3a:efe8 Onda (unverified) V972 tablet in flashing mode```
```sudo sunxi-fel version
AWUSBFEX soc=00001680(H3) 00000001 ver=0001 44 08 scratchpad=00007e00 00000000 00000000```


# compile and start FEL modus 
- the command above should run inside the vagrant box
- follow the instruction after the compile phase
- ```/compile.sh KERNEL_ONLY=no KERNEL_CONFIGURE=no BOARD=orangepiplus BRANCH=next PROGRESS_DISPLAY=plain RELEASE=xenial BUILD_DESKTOP=yes ROOTFS_TYPE=fel.```



# get ip from adapter with mac address
- IP_LINK_ADDR=$(ip -o address |grep -v inet6 | grep $(ip -o link |grep aa:bb:cc:dd:ee:ff|awk {'print $2'}|sed 's/://') | awk {'print $4'}|cut -d \/ -f 1)

# replace with ip addr
- ```sed -i "s/FEL_LOCAL_IP/$(echo $IP_LINK_ADDR)/g" userpatches/fel-boot.cmd```
- please notice the double quotas  
