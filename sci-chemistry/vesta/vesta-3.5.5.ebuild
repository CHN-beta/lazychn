# The script is 'stolen' from aur https://aur.archlinux.org/packages/vesta/

EAPI=7

inherit desktop xdg

DESCRIPTION="3D visualization program for structural models, volumetric data such as electron/nuclear densities, and crystal morphologies."
HOMEPAGE="https://jp-minerals.org/vesta"
SRC_URI="https://jp-minerals.org/vesta/archives/${PV}/VESTA-gtk3.tar.bz2 -> ${PN}-${PV}.tar.bz2"

LICENSE="VESTA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror strip"

DEPEND=""
RDEPEND="
	x11-libs/gtk+
	virtual/glu
	dev-util/desktop-file-utils
	x11-libs/libXtst
	virtual/jdk
	${DEPEND}"
BDEPEND=""

S="${WORKDIR}/VESTA-gtk3"

QA_PRESTRIPPED="*"

src_install() {
	insinto /opt/VESTA
	doins -r . VESTA
	fperms +x "/opt/VESTA/VESTA"
	fperms +x "/opt/VESTA/VESTA-gui"

	domenu "${FILESDIR}/VESTA.desktop"

	dosym "../../opt/VESTA/VESTA" "usr/bin/VESTA"
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
