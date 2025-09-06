DESCRIPTION = "Command line utility for maXTouch devices"
SECTION = "tools"
HOMEPAGE = "https://github.com/atmel-maxtouch/mxt-app"
LICENSE = "ATMEL_LLA"
LIC_FILES_CHKSUM = "file://LICENSE;md5=8b6acde4490765c7b838377ac61e2d2d"

DEPENDS = "libusb1"

PV = "1.41+git${SRCPV}"

inherit autotools

SRCREV="50d7061c77d4d3fb64e2dc3ffe14cd159181b79d"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"


SRC_URI = "https://github.com/atmel-maxtouch/mxt-app.git \
	   file://mxt-vk-d184280e-ok.xcfg \
"

S = "${WORKDIR}/git"

do_install:append () {
     install -d ${D}/home/root
     install -m 0644    ${WORKDIR}/mxt-vk-d184280e-ok.xcfg  ${D}/home/root/mxt-vk-d184280e-ok.xcfg
}

FILES:${PN} += " /home/root/mxt-vk-d184280e-ok.xcfg "
