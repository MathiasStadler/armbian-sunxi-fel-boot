#!/bin/bash
#./compile.sh KERNEL_ONLY=no KERNEL_CONFIGURE=no BOARD=orangepiplus BRANCH=next PROGRESS_DISPLAY=plain RELEASE=jessie BUILD_DESKTOP=no ROOTFS_TYPE=fel

sudo armbian/compile.sh KERNEL_ONLY=no KERNEL_CONFIGURE=no BOARD=orangepiplus BRANCH=next PROGRESS_DISPLAY=plain RELEASE=xenial BUILD_DESKTOP=yes ROOTFS_TYPE=fel
