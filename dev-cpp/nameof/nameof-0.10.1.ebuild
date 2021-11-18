EAPI=7

DESCRIPTION="Nameof operator for modern C++, simply obtain the name of a variable, type, function, macro, and enum"
HOMEPAGE="https://github.com/Neargye/nameof"
SRC_URI="https://github.com/Neargye/nameof/releases/download/v${PV}/nameof.hpp -> nameof-${PV}.hpp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
S="${WORKDIR}"

src_install() {
    mkdir -p "${D}/usr/include"
    cp "${DISTDIR}/nameof-${PV}.hpp" "${D}/usr/include/nameof.hpp"
}
