# Maintainer: @zstg <zestig@duck.com>
pkgname=stratos-fish-config
pkgver=1.0
pkgrel=3
pkgdesc="Fish configuration for StratOS"
arch=('any')
license=('GPL3')
depends=(
    'fish'
    'starship'
    'eza' 'ripgrep' 'fd' 'bat'
)
source=()
optdepends=('stratos-starship-config: Starship configuration'
            'ttf-jetbrains-mono-nerd: Default nerd font')
install=stratos-fish-config.install
prepare() {
    cp -r "$startdir/.config/" "$srcdir/"
}
package() {
    install -d "$pkgdir/etc/skel/.config"
    cp -r "$srcdir/.config/fish/" "$pkgdir/etc/skel/.config/"
}
