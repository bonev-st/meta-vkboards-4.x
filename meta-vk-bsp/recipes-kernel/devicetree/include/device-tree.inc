SRC_URI:${MACHINE} = " \
    file://${MACHINE}/${MACHINE}.dts \
    ${@' '.join(['file://${MACHINE}/%s' % f for f in d.getVar('KERNEL_DEVICETREE_OVERLAY').split()])} \
    "

