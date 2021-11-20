# The script is directly 'stolen' from aur https://aur.archlinux.org/packages/copytranslator-appimage/, with nearly no change

EAPI=7
inherit desktop

DESCRIPTION="Foreign language reading and translation assistant based on copy and translate."
HOMEPAGE="https://copytranslator.github.io/"
SRC_URI="https://github.com/CopyTranslator/CopyTranslator/releases/download/v${PV}/copytranslator-${PV}.AppImage"

LICENSE=('GPLv2')
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror strip"

# python-kivy is needed in big picture mode
# missing python-cef

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PRESTRIPPED="*"

S="${WORKDIR}/Proton-${PV}-GE-$_ge_ver"

src_unpack() {
    cp "${DISTDIR}/copytranslator-${PV}.AppImage" "${WORKDIR}" || die
    chmod +x "${WORKDIR}/copytranslator-${PV}.AppImage" || die
    "${WORKDIR}/copytranslator-${PV}.AppImage" --appimage-extract || die
    S="${WORKDIR}/squashfs-root"
}

src_configure() {
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no /opt/copytranslator/copytranslator.AppImage+" copytranslator.desktop || die
    sed -i "s+/opt/copytranslator/resources/linux-icon/icon.png+copytranslator+" copytranslator.desktop || die
    sed -i "s+Name=copytranslator+Name=CopyTranslator+" copytranslator.desktop || die
	find "usr/share/icons/hicolor" -type d -exec chmod 755 {} \; || die
}

src_install() {
    install -dm755 "${D}/usr/share/icons" || die
    install -Dm755 "../copytranslator-${PV}.AppImage" "${D}/opt/copytranslator/copytranslator.AppImage" || die
    domenu copytranslator.desktop
    cp -R "${S}/usr/share/icons/hicolor" "${D}/usr/share/icons" || die
}
