# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="A minimal Electron application to use ryzenAdj through a friendly interface"
HOMEPAGE="https://gitlab.com/ryzen-controller-team/ryzen-controller"
SRC_URI="https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/1710820449/artifacts/raw/dist/deb/ryzen-controller_2.5.4_amd64.deb"

LICENSE="CC0 1.0 Universal"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND="
	x11-libs/gtk+:3
	sys-power/RyzenAdj"
BDEPEND=""

QA_PREBUILT="*"

src_unpack() {
	default
	unpack "${WORKDIR}"/data.tar.xz
	S="${WORKDIR}"
}

src_install() {
	mv "${S}/usr" "${S}/opt" "${D}" || die


	pushd "${D}/usr/share/doc" > /dev/null || die
	mv ryzen-controller ${P} || die
	gzip -d ${P}/changelog.gz || die
	popd > /dev/null || die
}

pkg_postinst() {
	update-desktop-database
}
