FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = "\
	file://0001-modify-bptool-mode-names.patch \
"

