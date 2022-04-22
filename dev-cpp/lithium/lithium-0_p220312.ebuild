EAPI=8

inherit cmake git-r3

DESCRIPTION="Easy to use C++17 HTTP Server with no compromise on performances."
HOMEPAGE="https://github.com/matt-42/lithium"
EGIT_REPO_URI="https://github.com/matt-42/lithium.git"
EGIT_COMMIT="0e07508"

HTTPD_VERSION_=2.4.53
SRC_URI="https://raw.githubusercontent.com/apache/httpd/${HTTPD_VERSION_}/docs/conf/mime.types -> ${PN}_mime.types"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
PATCHES=( "${FILESDIR}/${PN}-fix-cmake-build.patch"
	"${FILESDIR}/${PN}-do-not-download.patch" )
EGIT_SUBMODULES=( "-vcpkg" )

src_configure() {
	local mycmakeargs=(
		-DDISTDIR="${DISTDIR}"
	)
	cmake_src_configure
}