# Use Chromium 132's GN (chromium-gn-native) rather than the system gn-native
# (which is Qt's 6.8.3 fork, required by qtwebengine).
DEPENDS:append = " chromium-gn-native"

do_configure:prepend() {
    mkdir -p "${WORKDIR}/chromium-gn-wrapper"
    ln -sf "${STAGING_BINDIR_NATIVE}/chromium-gn" "${WORKDIR}/chromium-gn-wrapper/gn"
    export PATH="${WORKDIR}/chromium-gn-wrapper:${PATH}"
}
