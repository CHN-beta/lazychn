EAPI=7

MY_PN="clFFT"

DOCS_BUILDER="doxygen"
DOCS_DIR="../docs"
DOCS_CONFIG_NAME="${MY_PN}.doxy"

inherit cmake docs

DESCRIPTION="Library containing FFT functions written in OpenCL"
HOMEPAGE="https://github.com/clMathLibraries/clFFT"
SRC_URI="https://github.com/clMathLibraries/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="callback_client +client test"

RDEPEND="
	virtual/opencl
	dev-libs/boost
"
DEPEND="${RDEPEND}"
BDEPEND="test? (
	dev-cpp/gtest
	sci-libs/fftw:3.0
)"

append-flags -fpermissive

# The tests only get compiled to an executable named Test, which is not recogniozed by cmake.
# Therefore src_test() won't execute any test.
RESTRICT="test"

S="${WORKDIR}/${MY_PN}-${PV}/src"

src_configure() {
	local mycmakeargs=(
		-DBUILD_CALLBACK_CLIENT="$(usex callback_client)"
		-DBUILD_CLIENT="$(usex client)"
		-DBUILD_TEST="$(usex test)"
		-DBoost_USE_STATIC_LIBS=OFF
	)
	cmake_src_configure
}

src_compile() {
	docs_compile
	cmake_src_compile
}
