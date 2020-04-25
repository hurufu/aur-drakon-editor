# Maintainer: kaptoxic
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Aeternus Atterratio <atterratio (at) Gmail.com>
# Contributor: Aleksy Grabowski <hurufu@gmail.com>

origname=drakon-editor
origver=1.31
reponame='repo.git'

pkgname=${origname}-git
pkgver=${origver}.r9.g435a4ce
pkgrel=1
pkgdesc="A free cross-platform editor for the DRAKON visual language"
arch=('any')
url="http://drakon-editor.sourceforge.net/"
license=('custom:public_domain')
depends=('sqlite-tcl'
         'tcllib'
         'tk'
         'tkimg'
         'tcllauncher'
)
makedepends=('git'
             'zip'
             'unzip'
)
conflicts=("${origname}")
source=("${reponame}::git+git://github.com/stepan-mitkin/drakon_editor.git"
        "${origname}.png"
        "${origname}.desktop"
        "${origname}.sh"
        "LICENSE"
)
md5sums=('SKIP'
         'fff9a96ac0e38d735452e935207d2892'
         'eadc8e1b7c72f2f6fb438c254fe556e5'
         'SKIP'
         '155472d3f6036fc8ea0eacabbf442ec4'
)

build() {
    cd "${srcdir}/${reponame}"
    ./make_release.sh
}

package() {
    destdir="${pkgdir}/opt/${origname}"
    zipname="drakon_editor${origver}.zip"

    cd "${srcdir}"

    # Install program files
    mkdir -p "${destdir}"
    unzip "./${reponame}/${zipname}" -d "${destdir}"
    ln -s $(which tcllauncher) "${destdir}/drakon_editor"

    # Install launcher
    install -Dm755 "${origname}.sh" "${pkgdir}/usr/bin/${origname}"

    # Install a desktop entry
    install -Dm644 "${origname}.png" "${pkgdir}/usr/share/pixmaps/${origname}.png"
    install -Dm644 "${origname}.desktop" "${pkgdir}/usr/share/applications/${origname}.desktop"

    # Install a license file
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${origname}/LICENSE"
}
