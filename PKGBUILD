# Maintainer: kaptoxic
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Aeternus Atterratio <atterratio (at) Gmail.com>
# Contributor: Aleksy Grabowski <hurufu@gmail.com>

origname=drakon-editor
origver=1.31
reponame='repo.git'

pkgname=${origname}-ada-git
pkgver=1.31.r27.g5ffd89c
pkgrel=1
pkgdesc="A free cross-platform editor for the DRAKON visual language"
arch=('any')
url="http://drakon-editor.sourceforge.net/"
license=('custom:public_domain')
depends=('sqlite-tcl'
         'tcllib'
         'tk'
         'tkimg'
)
makedepends=('git'
             'zip'
             'unzip'
)
conflicts=("${origname}")
provides=("${origname}")
source=("${reponame}::git+https://github.com/hurufu/drakon-editor.git#branch=ada"
        "${origname}.png"
        "${origname}.desktop"
        "${origname}.sh"
        "drakon-gen.sh"
        "LICENSE"
)
md5sums=('SKIP'
         'fff9a96ac0e38d735452e935207d2892'
         'eadc8e1b7c72f2f6fb438c254fe556e5'
         'SKIP'
         'SKIP'
         '155472d3f6036fc8ea0eacabbf442ec4'
)

build() {
    cd "${srcdir}/${reponame}"
    ./make_release.sh
}

package() {
    destdir="${pkgdir}/opt/${origname}/${pkgver}"
    zipname="drakon_editor${origver}.zip"

    cd "${srcdir}"

    # Install program files
    mkdir -p "${destdir}"
    unzip "./${reponame}/${zipname}" -d "${destdir}"

    # Install launchers
    bin=${pkgdir}/usr/bin
    install -Dm755 "drakon-editor.sh" "${bin}/drakon-editor"
    install -Dm755 "drakon-gen.sh" "${bin}/drakon-gen"

    # Install a desktop entry
    install -Dm644 "${origname}.png" "${pkgdir}/usr/share/pixmaps/${origname}.png"
    install -Dm644 "${origname}.desktop" "${pkgdir}/usr/share/applications/${origname}.desktop"

    # Install a license file
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${origname}/LICENSE"
}

check() {
    # FIXME: Unit test aren't passing in the latest code and unittest.tcl
    # doesn't report error with return code
    cd "${srcdir}/${reponame}/unittest"
    ./unittest.tcl
}
