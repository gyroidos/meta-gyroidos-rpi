require raspberrypi-generic.inc

MACHINE="raspberrypi2"
MACHINEOVERRIDES =. "raspberrypi2:"

GYROIDOS_GUESTOS_ARCH = "qemuarm"

DISTRO_FEATURES:remove = " tmedbg-extended"

# Kernel image name
SDIMG_KERNELIMAGE = "kernel7.img"
