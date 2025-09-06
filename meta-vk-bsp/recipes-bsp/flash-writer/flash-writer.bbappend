FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = "\
	file://0001-add-vkboards-support.patch \
"
