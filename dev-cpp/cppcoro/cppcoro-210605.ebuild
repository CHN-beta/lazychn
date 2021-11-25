# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="A library of C++ coroutine abstractions for the coroutines TS"
HOMEPAGE="https://github.com/Garcia6l20/cppcoro"
EGIT_REPO_URI="https://github.com/Garcia6l20/${PN}.git"
EGIT_COMMIT=e1d53e6

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

PATCHES=(
	"${FILESDIR}"/${PN}-ins-into-lib64.patch
)

src_configure() {
	mycmakeargs=(
		-DBUILD_TESTING=$(usex test ON OFF)
	)
	cmake_src_configure
}
