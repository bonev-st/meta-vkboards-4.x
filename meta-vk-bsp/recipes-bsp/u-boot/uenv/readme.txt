# How to configure the environment variables in uEnv.txt

It is possible to set an environment variable in uEnv.txt. To load the devicetree overlay file from
"overlay/" folder, you should set "enable_overlay_" or "fdt_extra_overlays". Also you can set some
environment variables from uboot to overwrite the old settings.

Refer to the following description for different boards.

## For vkrzv2l/g2l U-Boot Env
|---------------------------------------------------------------------
| fdtfile              : is a base dtb file, should be set vkrzv2l.dtb
|						 , vkrzg2l.dtb or vkrzg2lc.dtb
|---------------------------------------------------------------------
| fdt_extra_overlays   : other dtbo files to be loading, such as
|						 f1.dtbo f2.dtbo
|---------------------------------------------------------------------
| extrabootargs		   : append extra arguments to linux boot cmdline
|---------------------------------------------------------------------
| ethaddr			   : ETH0 MAC address
|---------------------------------------------------------------------
| eth1addr			   : ETH1 MAC address
|---------------------------------------------------------------------
|---------------------------------------------------------------------
|  uboot env   : you could set some environment variables of u-boot here,
|				 such as 'console=' 'bootargs='
\---------------------------------------------------------------------

default setting:
#fdt_extra_overlays=1.dtbo 2.dtbo 3.dtbo
fdt_extra_overlays=mipi_vklcd07.dtbo

#ethaddr=aa:bb:cc:aa:bb:cc
#eth1addr=aa:bb:cc:aa:bb:cd

#extrabootargs=video=HDMI-A-1:1920x1080@60.00
