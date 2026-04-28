# The upstream recipe adds gstreamer1.0 and the include path only for smarc-*
# machines via oe.utils.conditional(), which does not respond to MACHINEOVERRIDES.
# Replicate the same additions here for VK boards.
DEPENDS:append:vkrzg2lc = " gstreamer1.0"
DEPENDS:append:vk-d184280e = " gstreamer1.0"

TARGET_CFLAGS:append:vkrzg2lc = " -I${STAGING_DIR_HOST}/usr/include/gstreamer-1.0"
TARGET_CFLAGS:append:vk-d184280e = " -I${STAGING_DIR_HOST}/usr/include/gstreamer-1.0"

# do_compile uses raw "make MACHINE=..." (not oe_runmake), so EXTRA_OEMAKE is
# not picked up here.  Override the task to pass smarc-rzg2lc so the upstream
# Makefile adds the correct wayland + gstreamer link flags.
do_compile:vkrzg2lc () {
    cd ${S}
    make MACHINE=smarc-rzg2lc
}

do_compile:vk-d184280e () {
    cd ${S}
    make MACHINE=smarc-rzg2lc
}
