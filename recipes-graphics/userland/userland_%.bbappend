# Userland is installed to cml solely for the purpose
# of vcmailbox which does not require libegl-mesa
RDEPENDS:${PN}:remove:cml-base = "libegl-mesa"
