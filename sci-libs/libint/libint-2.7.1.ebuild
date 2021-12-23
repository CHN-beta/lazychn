# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Matrix elements (integrals) evaluation over Cartesian Gaussian functions"
HOMEPAGE="https://github.com/evaleev/libint"
SRC_URI="https://github.com/evaleev/libint/releases/download/v${PV}/libint-${PV}.tgz -> ${P}.tar.gz"

SLOT="2"
LICENSE="GPL-2"
KEYWORDS="~amd64"
IUSE=""

PATCHES=("${FILESDIR}/${PN}-ins-into-lib64.patch")


src_configure() {
	mycmakeargs=(
		-DENABLE_FORTRAN=ON
		-DENABLE_MPFR=ON
	)
	cmake_src_configure
}
