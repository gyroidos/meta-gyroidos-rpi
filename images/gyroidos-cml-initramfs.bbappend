# HACK: the boot.img for RPi secure boot must not be larger than 180 MB.
# remove the openssh server from the CML to reduce initramfs size in dev builds
PACKAGE_INSTALL:remove = "${@oe.utils.vartrue('RPI_SECURE_BOOT', 'openssh-sshd', '', d)}"
PACKAGE_INSTALL:remove = "${@oe.utils.vartrue('RPI_SECURE_BOOT', 'ssh-keys', '', d)}"

# remove gdb which is about 100 MB to reduce size of debug images and accelerate boot
PACKAGE_INSTALL:remove = "cmld-dbg"
PACKAGE_INSTALL:remove = "gdb"
PACKAGE_INSTALL:remove = "gdbserver"

# only raspberrypi 4 + 5 support secure boot + customer private key
PACKAGE_INSTALL:append:raspberrypi4-64 = " userland"
PACKAGE_INSTALL:append:raspberrypi5 = " userland"
