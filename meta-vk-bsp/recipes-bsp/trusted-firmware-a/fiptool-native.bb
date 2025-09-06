LIC_FILES_CHKSUM = " \
	file://${WORKDIR}/git/docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde \
"

require fiptool-native.inc

TFA_URI ?= "git://github.com/renesas-rz/rzg_trusted-firmware-a.git;protocol=https"
TFA_REV ?= "cc18695622e5637ec70ee3ae8eb5e83b09d13804"
TFA_BRANCH ?= "v2.9/rz"

SRC_URI = "${TFA_URI};branch=${TFA_BRANCH}"
SRCREV = "${TFA_REV}"

PV = "2.9+git"