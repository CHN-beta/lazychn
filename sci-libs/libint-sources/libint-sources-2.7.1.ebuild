# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="high-performance library for computing Gaussian integrals in quantum mechanics"
HOMEPAGE="https://github.com/evaleev/libint"
SRC_URI="https://github.com/evaleev/libint/archive/refs/tags/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

SLOT="${PV}"
LICENSE="GPL-2"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

PATCHES=("${FILESDIR}/${PN}-ins-into-lib64.patch")
DEPEND="
	dev-libs/boost
	dev-libs/gmp[cxx(+)]"
S="${WORKDIR}/libint-${PV}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	einfo "using LIBINT_CONF_OPTS=${LIBINT_CONF_OPTS}"
	econf ${LIBINT_CONF_OPTS}
}

src_compile() {
	emake export
}

src_install() {
	mkdir -p "${D}/usr/src" || die
	tar -xvf "${S}/libint-${PV}.tgz" -C "${D}/usr/src" || die
}

pkg_pretend() {
	einfo "This package only install generated sources."
	einfo "To actually install libint, you need to install sci-libs/libint."
	einfo
	einfo "The generator of libint shipped with a lot of options, makes it troublesome"
	einfo "to implement them as use flags. This package keep all of options as default,"
	einfo "but you could change as you needed by LIBINT_CONF_OPTS variable. For example:"
	einfo "   echo LIBINT_CONF_OPTS=\"--enable-eri=2 --enable-eri2=2\" > /etc/portage/env/libint-sources.conf"
	einfo "   echo \"sci-libs/libint-sources libint-sources.conf\" >> /etc/portage/package.env/custom"
	einfo "Although under default options generating sources takes only a minute, it could also spend"
	einfo "several hours depending on LIBINT_CONF_OPTS you set."
}
