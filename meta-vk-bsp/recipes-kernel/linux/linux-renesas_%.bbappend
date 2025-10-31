FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"


SRCREV = "018d7cdec80ede56e8f398c39198568098d0359c"

SRC_URI:append = " \
	file://0001-update-some-Macronix-device-names-against-jedec-ID.patch \
	file://0002-add-fitipower-ek79xxx-panel-drivers.patch \
	file://0009-refactor-update-ek79007ad-and-ek79202d-panel-driver.patch \
	file://0010-dts-renesas-r9a07g044-fix-dtc-warning.patch \
	file://0011-drm-ti-sn65dsi83-disable-PLL-error.patch \
"

#SRC_URI:append:vkrzg2lc = " \
#	file://0003-add-vkrzg2lc-board-support.patch \
#"

KBUILD_DEFCONFIG = "defconfig"
KCONFIG_MODE = "alldefconfig"

FILESEXTRAPATHS:prepend := "${THISDIR}/Kconfigs:"

SRC_URI += " \
	file://ADV7511.cfg \
	file://CANBUS.cfg \
	file://EEPROM_I2C.cfg \
	file://MXTTOUCH.cfg \
	file://NETWORK.cfg \
	file://PANEL_PANEL_FITIPOWER_EK79007AD.cfg \
	file://RTL8211F.cfg \
	file://TRACEPOINTS.cfg \
	file://USB_GADGET.cfg \
	file://USB_ACM.cfg \
	file://USB_SERIAL.cfg \
	file://USB_MODEM.cfg \
	file://USB_WL.cfg \
	file://BT.cfg \
	"

SRC_URI += " ${@oe.utils.conditional("CONFIG_HASSI", "1", " file://docker.cfg file://apparmor.cfg ", "", d)} "

SRC_URI:append:vkrzg2lc = " \
	file://GT911.cfg \
	file://FT5X06.cfg \
	file://PANEL_ILITEK_ILI9881C.cfg \
	file://PANEL_PANEL_FITIPOWER_EK79202D.cfg \
	file://SND_SOC_DA7213.cfg \
	file://SND_SEQ.cfg \
	file://CIFS.cfg \
	file://DSI_BRIDGES.cfg \
	file://BOARD_VKRZG2LC.cfg \
	"

