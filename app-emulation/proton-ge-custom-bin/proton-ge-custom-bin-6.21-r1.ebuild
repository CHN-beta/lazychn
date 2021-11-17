# The script is directly 'stolen' from aur https://aur.archlinux.org/packages/proton-ge-custom-bin/, with nearly no change

EAPI=7

_ge_ver=2

DESCRIPTION="A fancy custom distribution of Valves Proton with various patches"
HOMEPAGE="https://github.com/GloriousEggroll/proton-ge-custom"
SRC_URI="https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${PV}-GE-$_ge_ver/Proton-${PV}-GE-$_ge_ver.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
SLOT="0"
KEYWORDS="~amd64"
IUSE="kde gnome"

RESTRICT="mirror strip"

# python-kivy is needed in big picture mode
# missing python-cef

DEPEND=""
RDEPEND="
    dev-lang/python
    media-libs/vulkan-loader
    kde? ( kde-apps/kdialog )
    gnome? ( gnome-extra/zenity )
    app-emulation/winetricks
    virtual/wine
	media-libs/vulkan-loader
	media-libs/mesa[vulkan]
	${DEPEND}"
BDEPEND=""

# QA_PRESTRIPPED="*"
QA_TEXTRELS="usr/share/steam/compatibilitytools.d/proton-ge-custom/files/lib"

S="${WORKDIR}/Proton-${PV}-GE-$_ge_ver"

src_configure() {
	default
	sed -i -r 's|"Proton-.*"|"Proton-GE"|' ${S}/compatibilitytool.vdf
}

src_install() {
	_pkgname=${PN//-bin/}
	_pkgver=${PV}-GE-$_ge_ver
	_srcdir=Proton-${_pkgver}

	_protondir=usr/share/steam/compatibilitytools.d/${_pkgname}
	_licensedir=usr/share/licenses/${_pkgname}
	_execfile=usr/bin/proton
	_protoncfg=${_protondir}/user_settings.py

	mkdir -p /${D}/${_protondir}/
	mkdir -p /${D}/${_licensedir}/
	mkdir -p /${D}/$(dirname ${_execfile})/

	## licenses
	mv LICENSE /${D}/${_licensedir}/license
	mv LICENSE.OFL /${D}/${_licensedir}/license_OFL
	mv protonfixes/LICENSE /${D}/${_licensedir}/license_protonfixes
	## config files
	install --mode=0775 --group=games ${FILESDIR}/user_settings.py /${D}/${_protoncfg}
	## executables
	mv * /${D}/${_protondir}
	install --mode=0755 ${FILESDIR}/proton.sh /${D}/${_execfile}
}
