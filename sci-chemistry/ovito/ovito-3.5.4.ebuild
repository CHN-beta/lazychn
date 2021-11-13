# The script is 'stolen' from aur https://aur.archlinux.org/packages/ovito/

EAPI=7

inherit cmake desktop xdg

DESCRIPTION="Open Visualization Tool"
HOMEPAGE="https://www.ovito.org/"
SRC_URI="https://gitlab.com/stuko/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.bz2
    https://www.ovito.org/wp-content/uploads/logo_rgb-768x737.png -> ovito.png"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

RESTRICT="mirror"

DEPEND="sci-libs/fftw dev-lang/python sci-libs/netcdf media-video/ffmpeg dev-qt/qtcore:5"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/cmake dev-libs/boost x11-libs/qscintilla dev-qt/qtsvg dev-libs/libxslt dev-vcs/git
	doc? ( dev-python/sphinx_rtd_theme )"

S="${WORKDIR}/${PN}-v${PV}"

src_prepare() {
	cp "${FILESDIR}/ovito.desktop" "${S}"
	sed -i 's/Mathematics;//' "${S}/ovito.desktop"
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DOpenGL_GL_PREFERENCE=GLVND
		-DOVITO_BUILD_DOCUMENTATION=$(usex doc ON OFF)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	
	insinto /usr/share/pixmaps
	insopts -m644
	doins "${DISTDIR}/ovito.png"

	domenu "${S}/ovito.desktop"
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
