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

make $CTHREADS ARCH=$ARCHITECTURE CROSS_COMPILE="ccache arm-linux-gnueabihf-gcc"      LOCALVERSION="-$LINUXFAMILY" KSRC=/home/ubuntu//armbian/cache/sources/linux-    mainline/linux-4.13.y/debian/hdrtmp/usr/src/linux-headers-4.13.4-sunxi SHELL    ="sh -x"


make $CTHREADS ARCH=$ARCHITECTURE CROSS_COMPILE="ccache arm-linux-gnueabihf-gcc"  LOCALVERSION="-$LINUXFAMILY" KSRC=/home/ubuntu//armbian/cache/sources/linux-mainline/linux-4.13.y SHELL="sh -x " >t2 2>t2


http://makepp.sourceforge.net/gallery/
http://makepp.sourceforge.net/
https://stackoverflow.com/questions/14563302/build-a-makefile-dependency-inheritance-tree

https://stackoverflow.com/questions/5032269/backtrace-for-gnu-make
remake

# explain ccache
- https://askubuntu.com/questions/470545/how-do-i-set-up-ccache
