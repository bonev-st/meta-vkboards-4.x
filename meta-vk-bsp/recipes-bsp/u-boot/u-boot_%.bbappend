FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

UBOOT_REV:vkrzg2lc = "5141064c1552accaf69c6f509bf21b2063b9cff5"
UBOOT_REV:vk-d184280e = "5141064c1552accaf69c6f509bf21b2063b9cff5"

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

