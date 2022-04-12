# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="matlab"
SRC_URI="${PN}-${PV}.tar ${PN}-${PV}.lic ${PN}-${PV}.fik"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""

RESTRICT="fetch strip"
QA_PREBUILT="*"

src_install() {
	# modify installer settings
	local _fik="$(grep -o '[0-9-]*' "${DISTDIR}/${PN}-${PV}.fik")" || die
	sed -i "s|^# destinationFolder=|destinationFolder=${D}/opt/${PN}/${PV}|" installer_input.txt || die
	sed -i "s|^# fileInstallationKey=|fileInstallationKey=${_fik}|" installer_input.txt || die
	sed -i "s|^# agreeToLicense=|agreeToLicense=yes|" installer_input.txt || die
	sed -i "s|^# licensePath=|licensePath=${DISTDIR}/${PN}-{PV}.lic|" installer_input.txt || die

	# create destination folder
	mkdir -p "${D}/opt/${PN}-${PV}" || die

	# install with original installer
	./install -inputFile ./installer_input.txt || die

	# disable write permission except root
	chmod -R o-w "${D}/opt/${PN}/${PV}" || die
}