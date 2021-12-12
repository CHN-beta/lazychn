# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Nameof operator for modern C++"
HOMEPAGE="https://github.com/Neargye/nameof"
SRC_URI="
	https://github.com/Neargye/nameof/releases/download/v${PV}/nameof.hpp -> nameof-${PV}.hpp
	doc? ( https://raw.githubusercontent.com/Neargye/nameof/v${PV}/doc/limitations.md -> nameof-limitations.md
	https://raw.githubusercontent.com/Neargye/nameof/v${PV}/doc/reference.md -> nameof-reference.md )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"
RESTRICT="mirror"
S="${WORKDIR}"

src_install() {
	mkdir -p "${D}/usr/include"
	cp "${DISTDIR}/nameof-${PV}.hpp" "${D}/usr/include/nameof.hpp"
	if use doc
	then
		mkdir -p "${D}/usr/share/doc/${P}"
		cp "${DISTDIR}/nameof-limitations.md" "${DISTDIR}/nameof-reference.md" "${D}/usr/share/doc/${P}"
	fi
}
