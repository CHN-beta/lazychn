# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Define what default functions to run
ETYPE="sources"

# No 'experimental' USE flag provided, but we still want to use genpatches
K_EXP_GENPATCHES_NOUSE="1"

# Just get basic genpatches, -xanmod patch set already includes main updates
K_GENPATCHES_VER="2"

# -xanmod-hybrid already sets EXTRAVERSION to kernel Makefile
K_NOSETEXTRAVERSION="1"

# Not supported by the Gentoo security team
K_SECURITY_UNSUPPORTED="1"

# We want the very basic patches from gentoo-sources, experimental patch is
# already included in xanmod-hybrid
K_WANT_GENPATCHES="base	extras"

# Default enable Xanmod, You have to choose one of them.
# Both of them will make some errors
# IUSE="+xanmod cacule"
IUSE=""
# REQUIRED_USE="^^ ( xanmod cacule )"

# If you have been enable src_prepare-overlay
# please unmerge sys-kernel/xanmod-sources
RDEPEND="
	!sys-kernel/xanmod-sources:${PV}
	!sys-kernel/xanmod-rt:${PV}
"
DEPEND="app-arch/cpio"

inherit kernel-2
detect_version

DESCRIPTION="Xanmod patchset for main kernel tree"
HOMEPAGE="https://github.com/HougeLangley/customkernel"
# LICENSE+=" CDDL"

SRC_URI="
${KERNEL_BASE_URI}/linux-5.16.tar.xz
${GENPATCHES_URI}
https://github.com/HougeLangley/customkernel/releases/download/v5.16-patch/patch-${PV}-xanmod1"
KEYWORDS="~amd64"

S="${WORKDIR}/linux-${PV}-xanmod"

K_EXTRAEINFO="For more info on xanmod-hybrid and details on how to report problems,	see: ${HOMEPAGE}."

PATCHES=( "${DISTDIR}/patch-${PV}-xanmod1" )

src_prepare() {
	eapply "${DISTDIR}/patch-${PV}-xanmod1"	||	die
	kernel-2_src_prepare
}

pkg_setup() {
	ewarn ""
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the ${HOMEPAGE} directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn ""

	kernel-2_pkg_setup
}

pkg_postinst() {
	elog "MICROCODES"
	elog "Use xanmod-hybrid with microcodes"
	elog "Read https://wiki.gentoo.org/wiki/Intel_microcode"
}
