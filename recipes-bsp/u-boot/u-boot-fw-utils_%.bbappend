FILESEXTRAPATHS_prepend := "${THISDIR}/compulab/imx8mq:${THISDIR}/${PN}:"

LIC_FILES_CHKSUM = "file://Licenses/gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"

UBOOT_SRC ?= "git://source.codeaurora.org/external/imx/uboot-imx.git;protocol=https"
SRCBRANCH = "imx_v2019.04_4.19.35_1.0.0"
SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH}"
SRCREV = "85bdcc798163f72a7dfd723af4f0ef35d526ae09"

include compulab/imx8mq.inc

SRC_URI =+ "file://fw_env.config \
"

do_compile () {
	oe_runmake ${UBOOT_MACHINE}
	oe_runmake envtools
}

COMPATIBLE_MACHINE = "(cl-som-imx8)"
