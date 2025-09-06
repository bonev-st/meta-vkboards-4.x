FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

UBOOT_REV ?= "b105c304da659417de099e50af1a0fce7aa85164"

SRC_URI:append = " \
	file://0001-add-support-for-cm33-command.patch \
	file://0002-disable-EEE-for-ethernet-phy-LEDs.patch \
	file://0003-adjust-INFO-for-used-Macronix-flash-devices.patch \
	file://0004-add-option-rawimg-for-fastboot-flash-write-command.patch \
	file://0005-resolve-problem-with-endpoint-maxpacket-while-receiv.patch \
	file://0006-add-support-for-WDTOVF_PERROUT-signal.patch \
	file://0007-add-vk-boards-common-files.patch \
	file://0008-add-Vekatech-boards-support.patch \
"

