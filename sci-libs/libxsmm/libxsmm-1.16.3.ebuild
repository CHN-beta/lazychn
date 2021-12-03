EAPI=7

DESCRIPTION="A library for small dense and small sparse matrix-matrix multiplications"
HOMEPAGE="https://github.com/hfp/libxsmm"
SRC_URI="https://github.com/hfp/libxsmm/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND="sys-devel/gcc[fortran]"
RDEPEND="${DEPEND}"
BDEPEND="dev-lang/python"

QA_PRESTRIPPED="*"

PATCHES=(
	"${FILESDIR}"/${PN}-install-into-lib64.patch
)

src_compile() {
    export STATIC=0
    export OMP=1
    export MKL=0
    export CTARGET="$CFLAGS"

    make
}

src_install() {
    cd "${S}"
    make PREFIX="${D}/usr" install
    cd "${D}/usr"
    # install -dm755 share/licenses/libxsmm
    # ln -sf share/libxsmm/LICENSE.md share/licenses/libxsmm
    # find . -name "*.pc" -exec sed -i "/prefix=/c prefix=\/usr" {} \;
    # find lib -name "libxsmm" -exec sed -i "s@${S}/${PN}-${PV}@/usr@g" {} \;
    # install -dm755 lib/pkgconfig
    # mv lib/*.pc lib/pkgconfig
}
