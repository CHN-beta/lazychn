# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# converted and modified from AUR proton-ge-custom-bin 601fc5f2

EAPI=8

DESCRIPTION="A fancy custom distribution of Valves Proton with various patches"
HOMEPAGE="https://github.com/GloriousEggroll/proton-ge-custom"
SRC_URI="https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton7-7/GE-Proton7-7.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')

SLOT="0"
KEYWORDS="~amd64"
IUSE="kde gnome"

RESTRICT="mirror strip"

# python-kivy is missing

# python
# vulkan-icd-loader
# lib32-libusb
# lib32-openal
# lib32-libva
# ffmpeg4.4
# lib32-speex
# lib32-libtheora
# lib32-libvdpau
# gst-plugins-bad-libs
# lib32-gst-plugins-base
# libjpeg-turbo lib32-libjpeg-turbo
# lib32-libgudev
# lib32-flac
# lib32-mpg123
DEPEND=""
RDEPEND="
	dev-lang/python
	media-libs/vulkan-loader[abi_x86_32]
	dev-libs/libusb[abi_x86_32]
	media-libs/openal[abi_x86_32]
	x11-libs/libva[abi_x86_32]
	media-video/ffmpeg
	media-libs/speex[abi_x86_32]
	media-libs/libtheora[abi_x86_32]
	x11-libs/libvdpau[abi_x86_32]
	media-libs/gst-plugins-bad
	media-libs/gst-plugins-base[abi_x86_32]
	media-libs/libjpeg-turbo[abi_x86_32]
	dev-libs/libgudev[abi_x86_32]
	media-libs/flac[abi_x86_32]
	media-sound/mpg123[abi_x86_32]

	kde? ( kde-apps/kdialog )
	gnome? ( gnome-extra/zenity )

	app-emulation/winetricks[abi_x86_32]
	virtual/wine[abi_x86_32]

	media-libs/mesa[vulkan]"
QA_PREBUILT="*"

S="${WORKDIR}/GE-Proton7-7"

src_configure() {
	default
	sed -i -r 's|"Proton-.*"|"Proton-GE"|' ${S}/compatibilitytool.vdf
}

src_install() {
	# install licenses
	_licensedir="usr/share/licenses/proton-ge-custom"
	dodir "${_licensedir}"
	mv LICENSE "${D}/${_licensedir}/license" || die
	mv LICENSE.OFL "${D}/${_licensedir}/license_OFL" || die
	mv PATENTS.AV1 "${D}/${_licensedir}/license_AV1" || die
	mv protonfixes/LICENSE "${D}/${_licensedir}/license_protonfixes" || die

	# install other files
	_installdir=usr/share/steam/compatibilitytools.d/proton-ge-custom
	dodir $(dirname "${_installdir}")
	cp -r "${S}" "${D}/${_installdir}" || die
	install -m775 "${FILESDIR}/user_settings.py"  "${D}/${_installdir}" || die
	dobin "${FILESDIR}/proton"
}
