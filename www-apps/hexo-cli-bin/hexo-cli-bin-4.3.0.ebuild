# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A fast, simple & powerful blog framework"
HOMEPAGE="https://hexo.io/"

LICENSE=MIT
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror strip network-sandbox"

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"

S="${WORKDIR}"

src_unpack() {
	:
}

src_install() {
	npm install --prefix "${D}/usr" hexo-cli@$PV -g || die

	find "$D/usr" -type d -exec chmod 755 {} + || die
}
