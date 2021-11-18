EAPI=7

DESCRIPTION="A date and time library based on the C++11/14/17 <chrono> header"
HOMEPAGE="https://github.com/HowardHinnant/date"
SRC_URI="https://github.com/HowardHinnant/${PN}/archive/refs/tags/v${PV}.zip -> ${PN}-${PV}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

src_install() {
    mkdir -p "${D}/usr/include"
    cp -r include/date "${D}/usr/include"
}