# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{8,9} )

inherit distutils-r1

DESCRIPTION="phonopy"
HOMEPAGE="https://phonopy.github.io/"
SRC_URI="https://github.com/phonopy/phonopy/archive/refs/tags/v${PV}.tar.gz -> phonopy-${PV}.tar.gz"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test mirror"
