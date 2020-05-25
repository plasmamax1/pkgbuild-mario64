# Maintainer: secret

pkgname=super-mario-64
pkgver=1.1
pkgrel=1
pkgdesc="Native Linux port of Super Mario 64"
arch=('x86_64')
url="https://github.com/sm64pc/sm64pc"
license=('none')
depends=(glfw-x11)
makedepends=(git python audiofile mips64-elf-binutils qemu-irix-git)
provides=()
conflicts=()
source=("git+https://github.com/sm64pc/sm64pc")
md5sums=('SKIP')

build() {
	cd ${srcdir}/sm64
	make PREFIX=/usr TARGET_N64=0 BETTERCAMERA=1 -j$(nproc)
}

package() {
	install -D -m755 \
		"${srcdir}/sm64/build/us_pc/sm64.us.f3dex2e"
		"${pkgdir}/usr/share/${pkgname}/sm64.us.f3dex2e"
}
