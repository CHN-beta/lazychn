# this file is 'stolen' from stefantalpalaru overlay
# with bumped to newest version and disabled patch (which I do not know what it is used for)

EAPI=7

inherit autotools

MY_COMMIT="d0f5e95a87a4d3e0a1ed6c069b5dae7cbab3ed2a"

DESCRIPTION="A C library for producing symbolic backtraces"
HOMEPAGE="https://github.com/ianlancetaylor/libbacktrace"
SRC_URI="https://github.com/ianlancetaylor/libbacktrace/archive/${MY_COMMIT}.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"
RESTRICT="mirror"

RDEPEND="
	sys-libs/zlib
"
DEPEND="${RDEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${MY_COMMIT}"

src_configure() {
	econf --enable-shared $(use_enable static-libs static)
}
