require recipes-kernel/linux/linux-gyroidos.inc

# enable buildhistory for this recipe to allow SRCREV extraction
inherit buildhistory
BUILDHISTORY_COMMIT = "0"

SRC_URI += "\
	file://gyroidos-rpi.cfg \
"
SRC_URI:append:raspberrypi5 = " file://gyroidos-rpi5.cfg"

LINUX_VERSION_EXTENSION = "-gyroidos"

FILESEXTRAPATHS:prepend := "${THISDIR}/linux-raspberrypi:"
