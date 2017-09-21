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
> -     ```passwd ubuntu```
> - logout out 
>   - ```exit```
> - stop vagrant box
>   - ```vagrant halt```
> - get list all names of boxes/vm
>   - ```vboxmanage  list vms```
> - clone box 
>   - ```vboxmanage clonevm --snapshot "<CURRENT VM NAME>" --name "<NAME_OF_COPY>"  --register```
>   - e.g.
>   - ```vboxmanage clonevm --snapshot "Armbian Builder" --name "Armbian Builder save"  --register```
> -  rerun a new box  destroy > up 
>   - ```vagrant destroy```
>   - ```vagrant up```

7. execute the  provisioning_script
    - is start with the command vagrant up


# Wiki 
## Fel Mode [https://linux-sunxi.org/FEL]


# unsorted
- [Github mastering markdown](https://guides.github.com/features/mastering-markdown/)

 