# Builds Chromium 132's GN tool under a separate PN ("chromium-gn-native") so it
# can coexist with gn-native_git.bb (Qt's 6.8.3 fork, required by qtwebengine).
# The chromium-ozone-wayland bbappend depends on this and injects chromium-gn
# into PATH during do_configure so "gn gen" picks up the correct GN version.

FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-browser/meta-chromium/recipes-browser/chromium/gn:"

require ${COREBASE}/../meta-browser/meta-chromium/recipes-browser/chromium/gn-native_132.0.6834.83.bb

# The native-last check is in an anonymous python() function in insane.bbclass
# (parse time). It calls d.getVar('INSANE_SKIP') which resolves OVERRIDES — but
# OVERRIDES does not contain the PN at parse time, so INSANE_SKIP:${PN} variants
# are never consulted. Only the unqualified base INSANE_SKIP is read.
# chromium-%.bbappend (meta-browser-hwdecode) only sets INSANE_SKIP:${PN}, so
# the unqualified form is independent and safe to set here.
INSANE_SKIP:append = " native-last"

# Install as chromium-gn, not gn, to avoid overwriting ${bindir}/gn which is
# owned by gn-native_git.bb (Qt's fork) in the shared native sysroot.
do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/out/Release/gn ${D}${bindir}/chromium-gn
}
