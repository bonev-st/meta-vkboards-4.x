FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

DEPENDS:append = " fiptool-native"

SYSROOT_UBOOT="${RECIPE_SYSROOT}/boot"

do_compile() {
	# Create bl2_bp.bin
	for bl2boot in ${BL2_BOOT_TARGET}; do
		# Create bl2_bp.bin
		bptool ${SYSROOT_TFA}/bl2.bin ${S}/bp.bin 0x08004000 $bl2boot
		cat ${S}/bp.bin ${SYSROOT_TFA}/bl2.bin > ${S}/bl2_bp_$bl2boot.bin

		# Conver BL2 to S-Record
		objcopy -I binary -O srec --adjust-vma=${BL2_ADJUST_VMA} --srec-forceS3 ${S}/bl2_bp_$bl2boot.bin ${S}/bl2_bp_$bl2boot.srec
	done

	if [ -n "${UBOOT_CONFIG}" ]; then
	     for config in ${UBOOT_CONFIG}; do
		fiptool create --align 16 --soc-fw ${SYSROOT_TFA}/bl31.bin --nt-fw ${SYSROOT_UBOOT}/u-boot.bin-${config} ${S}/fip_${config}.bin
		objcopy -I binary -O srec --adjust-vma=${FIP_ADJUST_VMA} --srec-forceS3 ${S}/fip_${config}.bin ${S}/fip_${config}.srec
	     done
	fi
}

do_deploy () {
	# Create deploy folder
	install -d ${DEPLOYDIR}

	# Copy BL2 and FIP images
	for bl2boot in ${BL2_BOOT_TARGET}; do
		install -m 0644 ${S}/bl2_bp_$bl2boot.bin ${DEPLOYDIR}/bl2_bp_$bl2boot-${MACHINE}.bin
		install -m 0644 ${S}/bl2_bp_$bl2boot.srec ${DEPLOYDIR}/bl2_bp_$bl2boot-${MACHINE}.srec
	done

	if [ -n "${UBOOT_CONFIG}" ]; then
	     for config in ${UBOOT_CONFIG}; do
		install -m 0644 ${S}/fip_${config}.bin ${DEPLOYDIR}/fip_${config}-${MACHINE}.bin
		install -m 0644 ${S}/fip_${config}.srec ${DEPLOYDIR}/fip_${config}-${MACHINE}.srec
	     done
	fi
}

