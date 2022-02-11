# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="open source HTML Renderer library"
HOMEPAGE="http://lexbor.com/"
EGIT_REPO_URI="https://github.com/lexbor/lexbor.git"
EGIT_COMMIT="44db846"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+shared-libs static-libs separately examples test utils debug"
RESTRICT="mirror"
REQUIRED_USE="|| ( shared-libs static-libs )"

src_configure() {
	local mycmakeargs=(
		-DLEXBOR_BUILD_SHARED=$(usex shared-libs ON OFF)
		-DLEXBOR_BUILD_STATIC=$(usex static-libs ON OFF)
		-DLEXBOR_BUILD_SEPARATELY=$(usex separately ON OFF)
		-DLEXBOR_BUILD_EXAMPLES=$(usex examples ON OFF)
		-DLEXBOR_BUILD_TESTS=$(usex test ON OFF)
		-DLEXBOR_BUILD_TESTS_CPP=$(usex test ON OFF)
		-DLEXBOR_BUILD_UTILS=$(usex utils ON OFF)
		-DLEXBOR_BUILD_WITH_ASAN=$(usex debug ON OFF)
	)
	cmake_src_configure
}
