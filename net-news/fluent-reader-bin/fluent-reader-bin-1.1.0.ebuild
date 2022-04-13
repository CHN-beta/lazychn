# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="fluent reader"
HOMEPAGE="https://github.com/yang991178/fluent-reader"
SRC_URI="https://github.com/yang991178/fluent-reader/releases/download/v${PV}/Fluent.Reader.${PV}.AppImage"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="strip"

src_unpack() {
	cp "${DISTDIR}/Fluent.Reader.${PV}.AppImage" "${WORKDIR}/fluent-reader-${PV}.AppImage" || die
	chmod +x "${WORKDIR}/fluent-reader-${PV}.AppImage" || die
	"./fluent-reader-${PV}.AppImage" --appimage-extract || die
	S="${WORKDIR}/squashfs-root"
}

src_install() {
	# modifying .desktop file
	sed -i -E "s|Exec=AppRun|Exec=/opt/bin/fluent-reader|" "fluent-reader.desktop" || die

	# Copy app files
	mkdir -p "${D}/opt/fluent-reader" || die
	cp -va * "${D}/opt/fluent-reader" || die

	# Fix permissions
	for d in locales resources; do
		chmod -v 755 "${D}/opt/fluent-reader/$d" || die
		find "${D}/opt/fluent-reader/$d" -type d -exec chmod -v 755 {} + || die
	done

	# Link entry point
	mkdir -p "${D}/opt/bin" || die
	ln -vsf "../fluent-reader/fluent-reader" "${D}/opt/bin/fluent-reader" || die

	# Copy icons files
	mkdir -p "${D}/usr/share/icons" || die
	find usr/share/icons -type d -exec chmod -v 755 {} + || die
	cp -va usr/share/icons/* "${D}/usr/share/icons" || die

	# Copy desktop file
	install -vDm 644 "fluent-reader.desktop" "${D}/usr/share/applications/fluent-reader.desktop" || die

	# Install LICENSE file
	# install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Remove unused files
	rm -vrf "${D}/opt/fluent-reader"/{usr,swiftshader,AppRun,fluent-reader.{desktop,png}} || die
	# rm -vrf "${pkgdir}/opt/${pkgname}"/{libGLESv2.so,libEGL.so,libvk_swiftshader.so,libvulkan.so.1}
	rm -vrf "${D}/opt/fluent-reader/LICENSE*" || die
}
