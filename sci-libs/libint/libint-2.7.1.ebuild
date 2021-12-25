# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Matrix elements (integrals) evaluation over Cartesian Gaussian functions"
HOMEPAGE="https://github.com/evaleev/libint"
SRC_URI=""

SLOT="2"
LICENSE="GPL-2"
KEYWORDS="~amd64"
IUSE="static-libs +cxx fortran"

RESTRICT="mirror"

DEPEND="
	dev-libs/boost
	dev-libs/gmp[cxx(+)]
	cxx? ( dev-cpp/eigen )
	fortran? (
		dev-lang/python 
		sys-devel/gcc[fortran] )"
BDEPEND="~dev-libs/libint-sources-${PV}"
RDEPEND="${DEPEND}"

src_unpack() {
	cp -r "/usr/src/${P}" "${WORKDIR}" || die
	default
}

src_configure() {
	local mycmakeargs=(
		-DREQUIRE_CXX_API=$(usex cxx ON OFF)
		-DENABLE_FORTRAN=$(usex fortran ON OFF)
		-DLIBINT2_BUILD_SHARED_AND_STATIC_LIBS=$(usex static-libs ON OFF)
	)
	cmake_src_configure
}
