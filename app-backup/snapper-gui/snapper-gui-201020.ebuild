# This file is 'stolen' from zyrenth overlay https://github.com/gentoo-mirror/zyrenth
# I just do some fix

EAPI=6

PYTHON_COMPAT=( python3_{8,9} )
inherit distutils-r1 git-r3

DESCRIPTION="GUI for snapper, a tool for Linux filesystem snapshot management"
HOMEPAGE="https://github.com/ricardomv/snapper-gui"
KEYWORDS="~amd64"
EGIT_REPO_URI="https://github.com/ricardomv/${PN}.git"
EGIT_COMMIT=f0c67ab

LICENSE="GPL-2+"
SLOT="0"
IUSE=""

DEPEND="${PYTHON_DEPEND}"
RDEPEND="
	${DEPEND}
	app-backup/snapper
	dev-python/dbus-python
	dev-python/pygobject
	x11-libs/gtksourceview:3.0
"

src_prepare() {
	sed -i 's/Utilities;/Utility;/' ${S}/snapper-gui.desktop
	default
}