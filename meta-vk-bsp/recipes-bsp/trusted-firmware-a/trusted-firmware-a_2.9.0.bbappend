DESCRIPTION = "Trusted Firmware-A for VK-boards"

EXTRA_OEMAKE:append ?= " SPI_FLASH=${TFA_SPI_FLASH}"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = "\
	file://0001-add-vkboards-support.patch \
"

