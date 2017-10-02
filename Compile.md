```
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
eval env PATH=/home/ubuntu/armbian/cache/toolchains/gcc-linaro-7.1.1-2017.08-x86_64_arm-linux-gnueabihf/bin:/usr/lib/ccache:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin 
make $CTHREADS ARCH=$ARCHITECTURE CROSS_COMPILE="$CCACHE $KERNEL_COMPILER" LOCALVERSION="-$LINUXFAMILY" $KERNEL_IMAGE_TYPE modules dtbs

exit

make -j6 ARCH=arm 'CROSS_COMPILE=ccache arm-linux-gnueabihf-' LOCALVERSION=-sunxi zImage modules dtbs



make $CTHREADS ARCH=$ARCHITECTURE CROSS_COMPILE="$CCACHE $KERNEL_COMPILER" LOCALVERSION="-$LINUXFAMILY" KERNEL_IMAGE_TYPE modules dtbs'
