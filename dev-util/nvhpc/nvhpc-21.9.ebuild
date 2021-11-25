# This script is stolen from aur https://aur.archlinux.org/packages/nvhpc/

EAPI=7

_REL_YEAR=2021
_CUDA_VER=11.4

DESCRIPTION="NVIDIA HPC SDK"
HOMEPAGE="https://developer.nvidia.com/hpc-sdk"
SRC_URI="https://developer.download.nvidia.com/hpc-sdk/${PV}/${PN}_${_REL_YEAR}_${PV//.}_Linux_x86_64_cuda_${_CUDA_VER}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE=EULA
SLOT=${PV//.//}
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror strip"

DEPEND="sys-process/numactl virtual/jre sys-cluster/modules"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"

S="${WORKDIR}/${PN}_${_REL_YEAR}_${PV//.}_Linux_x86_64_cuda_${_CUDA_VER}"

src_configure() {
	default
    sed -i "s/en_US\.UTF\-8/C/g" "install_components/Linux_x86_64/${PV}/compilers/bin/makelocalrc"
}

src_install() {
    NVHPC_SILENT=true \
    NVHPC_INSTALL_DIR="${D}/opt/nvidia" \
    bash ./install

    # Remove references to $pkgdir from module files
    cd "${D}/opt/nvidia/modulefiles"
    find . -type f -exec sed -i "s@${D}@@g" {} \;

    # Install license
    cd "${S}/install_components/Linux_x86_64/${PV}/compilers/license"
    install -Dm644 LICENSE.txt "${D}/usr/share/licenses/${P}/LICENSE.txt"

    # Install script to set path
    install -Dm755 "${FILESDIR}/${PN}.sh" "${D}/etc/profile.d/${P}.sh"
}
