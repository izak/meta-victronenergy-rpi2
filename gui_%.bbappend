# Specifically install a udev bridge for gui, on Rpi2 the keyboard is not where
# you might expect it.

SRC_URI = " \
   file://keyboard.rules \
"
RDEPENDS_${PN} += "udev"


do_install() {
    install -d ${D}${sysconfdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/keyboard.rules ${D}${sysconfdir}/udev/rules.d/keyboard.rules
}

FILES_${PN} = "${sysconfdir}/udev/rules.d/keyboard.rules"
