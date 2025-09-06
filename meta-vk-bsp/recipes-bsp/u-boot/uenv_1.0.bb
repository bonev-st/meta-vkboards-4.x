SUMMARY = "U-Boot Env"
SECTION = "app"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

S = "${WORKDIR}"

SRC_URI = " \
    file://readme.txt \
    file://${UENV_FILE} \
"

FILES:${PN} = "/boot"

do_install () {
    install -d ${D}/boot
    install -m 0644 ${S}/${UENV_FILE} ${D}/boot/uEnv.txt
    install -m 0644 ${S}/readme.txt ${D}/boot/readme.txt
}

inherit deploy
addtask deploy after do_install

do_deploy () {
    install -m 0644 ${D}/boot/uEnv.txt ${DEPLOYDIR}
    install -m 0644 ${D}/boot/readme.txt ${DEPLOYDIR}
}

PACKAGE_ARCH = "${MACHINE_ARCH}"
