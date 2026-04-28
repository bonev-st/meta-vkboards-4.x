DESCRIPTION = "Trusted Firmware-A for VK-boards"

EXTRA_OEMAKE:append ?= " SPI_FLASH=${TFA_SPI_FLASH}"

# The TFA sysroot contains firmware blobs and fiptool (an x86_64 host binary).
# Suppress cross-stripping: aarch64-strip can't handle the host ELF and would
# error out.  The .elf debug files are installed 0644 (no exec bit) so they
# are not picked up by strip_execs anyway.
INHIBIT_SYSROOT_STRIP = "1"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = "\
	file://0001-add-vkboards-support.patch \
"

# fiptool is a standalone make target — it is NOT built as a side-effect of
# make bl2/bl31.  Build it explicitly here so it is available for do_install.
# It builds into ${S}/tools/fiptool/fiptool (source tree, not BUILD_DIR).
# Installing it to ${D}/firmware/ lets firmware-pack reach it via
# ${SYSROOT_TFA}/fiptool, eliminating the separate fiptool-native recipe whose
# own SRCREV could silently diverge from the main TFA build.
do_compile:append() {
    oe_runmake -C ${S} fiptool
}

do_install:append() {
    install -m 0755 ${S}/tools/fiptool/fiptool ${D}/firmware/fiptool
}

