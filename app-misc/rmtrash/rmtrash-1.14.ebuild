EAPI=7

DESCRIPTION="trash-put made compatible to GNUs rm and rmdir"
HOMEPAGE="https://github.com/PhrozenByte/rmtrash"
SRC_URI="https://github.com/PhrozenByte/rmtrash/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND="
	app-misc/trash-cli
	${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/bin
	insopts -m755
	doins rmtrash
	doins rmdirtrash
}
