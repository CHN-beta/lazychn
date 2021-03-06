# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# not usable currently, need a minor patch

EAPI=8

inherit cmake git-r3 flag-o-matic

DESCRIPTION="Interactive C++ interpreter, built on the top of LLVM and Clang libraries"
HOMEPAGE="https://root.cern/cling/"

EGIT_OVERRIDE_REPO_LLVM_CLING="http://root.cern/git/llvm.git"
EGIT_OVERRIDE_BRANCH_LLVM_CLING="cling-patches"
EGIT_OVERRIDE_COMMIT_LLVM_CLING="c41338"
EGIT_OVERRIDE_REPO_CLING="http://root.cern/git/cling.git"
EGIT_OVERRIDE_COMMIT_CLING="a6e426"
EGIT_OVERRIDE_REPO_CLANG_CLING="http://root.cern/git/clang.git"
EGIT_OVERRIDE_BRANCH_CLANG_CLING="cling-patches"
EGIT_OVERRIDE_COMMIT_CLANG_CLING="535acc"

LICENSE="Apache-2.0" # more
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
PATCHES=( "${FILESDIR}/cling-disable-cling-demo.patch" 
	"${FILESDIR}/cling-add-missing-header.patch" )

pkg_pretend() {
	einfo "A lot of memory is required at linking stage."
	einfo "For me, 40G of RAM and 16G of swap is sufficient for make -j4."
	einfo "Be careful to reduce the threads used appropriately."
}

src_unpack() {
	git-r3_fetch llvm-cling
	git-r3_checkout llvm-cling "${WORKDIR}/${P}"
	git-r3_fetch cling
	git-r3_checkout cling "${WORKDIR}/${P}/tools/cling"
	git-r3_fetch clang-cling
	git-r3_checkout clang-cling "${WORKDIR}/${P}/tools/clang"
}

src_configure() {
	local mycmakeargs=(
		-Wno-dev
		-DCMAKE_INSTALL_PREFIX="/opt/cling"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	if [ -d "${D}/usr" ]
	then
		rm -r "${D}/usr" || die
	fi
	dosym ../cling/bin/cling "/opt/bin/cling"
}
