# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="open source HTML Renderer library"
HOMEPAGE="http://lexbor.com/"
SRC_URI="https://github.com/lexbor/lexbor/archive/refs/tags/v2.1.0.tar.gz -> lexbor-2.1.0.tar.gz"

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
