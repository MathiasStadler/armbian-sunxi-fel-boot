```
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8

export CTHREADS=-j6
echo $CTHREADS

export BOOTCONFIG=orangepi_plus_defconfig
echo $BOOTCONFIG

export CCACHE=ccache
echo $CCACHE

export UBOOT_COMPILER=arm-linux-gnueabihf-
echo $UBOOT_COMPILER

export KERNEL_COMPILER=arm-linux-gnueabihf-
echo $KERNEL_COMPILER

export ARCHITECTURE=arm
echo $ARCHITECTURE

export LINUXFAMILY=-sunxi
echo $LINUXFAMILY

export KERNEL_IMAGE_TYPE=zImage
echo $KERNEL_IMAGE_TYPE

cd /home/ubuntu/armbian/cache/sources/linux-mainline/linux-4.13.y

eval CCACHE_BASEDIR=/home/ubuntu/armbian/cache/sources/linux-mainline/linux-4.13.y 
export  #PATH=/usr/lib/ccache:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/home/ubuntu/armbian/cache/toolchains/gcc-linaro-7.1.1-2017.08-x86_64_arm-linux-gnueabihf/bin:$PATH

PATH=/home/ubuntu/armbian/cache/toolchains/gcc-linaro-7.1.1-2017.08-x86_64_arm-linux-gnueabihf/bin:/usr/lib/ccache:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin


which g++ gcc


exit



#scripts
make $CTHREADS ARCH=$ARCHITECTURE CROSS_COMPILE="$CCACHE $KERNEL_COMPILER" LOCALVERSION="-$LINUXFAMILY" scripts


#headers_check
make $CTHREADS ARCH=$ARCHITECTURE CROSS_COMPILE="$CCACHE $KERNEL_COMPILER" LOCALVERSION="-$LINUXFAMILY" headers_check

make -j6 ARCH=arm 'CROSS_COMPILE=ccache arm-linux-gnueabihf-' LOCALVERSION=-sunxi zImage modules dtbs



make $CTHREADS ARCH=$ARCHITECTURE CROSS_COMPILE="$CCACHE $KERNEL_COMPILER" LOCALVERSION="-$LINUXFAMILY" KERNEL_IMAGE_TYPE modules dtbs'



#rtl8189cu

```
make $CTHREADS ARCH=$ARCHITECTURE CROSS_COMPILE="$CCACHE $KERNEL_COMPILER" LOCALVERSION="-$LINUXFAMILY" KSRC=/home/ubuntu/armbian/cache/sources/linux-mainline/linux-4.13.y
```
make $CTHREADS ARCH=$ARCHITECTURE CROSS_COMPILE="$CCACHE $KERNEL_COMPILER"  LOCALVERSION="-$LINUXFAMILY" KSRC=/home/ubuntu//armbian/cache/sources/linux-mainline/linux-4.13.y/debian/hdrtmp/usr/src/linux-headers-4.13.4-sunxi SHELL="sh -x"


make $CTHREADS ARCH=$ARCHITECTURE CROSS_COMPILE="$CCACHE $KERNEL_COMPILER"  LOCALVERSION="-$LINUXFAMILY" KSRC=/home/ubuntu//armbian/cache/sources/linux-mainline/linux-4.13.y SHELL="sh -x"



# explain ccache
- https://askubuntu.com/questions/470545/how-do-i-set-up-ccache



make ARCH=arm CROSS_COMPILE= -C /usr/src/linux-headers-3.4.110-sun8i M=/usr/src/rtl8189ES_linux  modules

make ARCH=arm CROSS_COMPILE= -C /home/ubuntu//armbian/cache/sources/linux-mainline/linux-4.13.y M=/home/ubuntu/rtl8189ES_linux  modules


##from mkefile

CROSS_COMPILE := /home/android_sdk/Allwinner/a31/kitkat-a3x_v4.5/lichee/buildroot/output/external-toolchain/bin/arm-linux-gnueabi-
KSRC :=/home/android_sdk/Allwinner/a31/kitkat-a3x_v4.5/lichee/linux-3.3



###
make V=1  ARCH=arm CROSS_COMPILE="$CCACHE $KERNEL_COMPILE" -C /home/ubuntu//armbian/cache/sources/linux-mainline/linux-4.13.y M=/home/ubuntu/rtl8189ES_linux
make ARCH=arm CROSS_COMPILE="$CCACHE $KERNEL_COMPILE" -C /home/ubuntu//armbian/cache/sources/linux-mainline/linux-4.13.y M=/home/ubuntu/rtl8189ES_linux

https://github.com/rdm-dev/rtl8189ES_linux.git

# hint for modpost=0 
https://stackoverflow.com/questions/4715259/linux-modpost-does-not-build-anything