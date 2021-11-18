# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="C++ library for Telegram bot API"
HOMEPAGE="https://github.com/reo7sp/tgbot-cpp"
EGIT_REPO_URI="https://github.com/reo7sp/${PN}.git"
EGIT_COMMIT=814ac07

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

mycmakeargs=( -DBUILD_SHARED_LIBS=OFF )
