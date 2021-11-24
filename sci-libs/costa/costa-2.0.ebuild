EAPI=7

inherit cmake

DESCRIPTION="Distributed Communication-Optimal Shuffle and Transpose Algorithm"
HOMEPAGE="https://github.com/eth-cscs/COSTA"
SRC_URI="https://github.com/eth-cscs/COSTA/releases/download/v${PV}/COSTA-v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/COSTA-v2.0"

RESTRICT="mirror"

DEPEND="sys-cluster/openmpi sys-devel/gcc[openmp] sci-libs/scalapack"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/cmake"
