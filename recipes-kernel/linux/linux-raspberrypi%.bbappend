require recipes-kernel/linux/linux-gyroidos.inc

# enable buildhistory for this recipe to allow SRCREV extraction
inherit buildhistory
BUILDHISTORY_COMMIT = "0"

SRC_URI += "\
	file://gyroidos-rpi.cfg \
"
SRC_URI:append:raspberrypi5 = " file://gyroidos-rpi5.cfg"

SRC_URI:remove = "git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${LINUX_RPI_KMETA_BRANCH};destsuffix=${KMETA}"
SRC_URI:append = " git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${LINUX_RPI_KMETA_BRANCH};destsuffix=${KMETA};protocol=https "

LINUX_VERSION_EXTENSION = "-gyroidos"

FILESEXTRAPATHS:prepend := "${THISDIR}/linux-raspberrypi:"

# upstream kernel repo dropped bcmrpi3_defconfig, use ours
KBUILD_DEFCONFIG:raspberrypi3-64 = ""
SRC_URI:append:raspberrypi3-64 = "file://bcmrpi3_defconfig"

# Always-on board command line (serial console + root device). Contributed to
# the composable GYROIDOS_KERNEL_CMDLINE owned by meta-gyroidos; a plain
# CONFIG_CMDLINE in the defconfig would be overwritten by
# linux-gyroidos.inc:kernel_do_configure:append.
GYROIDOS_KERNEL_CMDLINE_BASE:raspberrypi3-64 = "console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait"
