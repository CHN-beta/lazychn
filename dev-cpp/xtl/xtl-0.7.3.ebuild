# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="The x template library"
HOMEPAGE="https://github.com/xtensor-stack/xtl"
SRC_URI="https://github.com/xtensor-stack/xtl/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="BSD 3-Clause"
SLOT="0"
KEYWORDS="~amd64"

# doc test should be add
IUSE=""
RESTRICT="mirror"
