# Specifically install a udev bridge for gui, on Rpi2 the keyboard is not where
# you might expect it.

RDEPENDS_${PN} += "udev"

do_install_append() {
    install -d ${D}${sysconfdir}/udev/rules.d
    echo 'SUBSYSTEM=="input", KERNEL=="event0", SYMLINK+="input/by-path/platform-gpio-keys-event"' > \
        ${D}${sysconfdir}/udev/rules.d/keyboard.rules
}

FILES_${PN} += "${sysconfdir}/udev/rules.d/keyboard.rules"
