EAPI=7

inherit cmake

DESCRIPTION="Distributed Communication-Optimal Matrix-Matrix Multiplication Algorithm"
HOMEPAGE="https://github.com/eth-cscs/COSMA"
SRC_URI="https://github.com/eth-cscs/COSMA/archive/refs/tags/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/COSMA-${PV}"

RESTRICT="mirror"

DEPEND="sys-cluster/openmpi sci-libs/costa"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/cmake"

PATCHES=(
    "${FILESDIR}"/${PN}-external-costa.patch
)

src_configure() {
    mycmakeargs=(
        -DBUILD_SHARED_LIBS=ON
        -DCOSMA_BLAS=CUSTOM
        -DCOSMA_SCALAPACK=CUSTOM
        -DSCALAPACK_BLAS=CUSTOM
        -DCOSMA_WITH_TESTS=OFF
        -DCOSMA_WITH_APPS=OFF
        -DCOSMA_WITH_BENCHMARKS=OFF
    )
    cmake_src_configure
}