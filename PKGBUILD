# Maintainer: secret

pkgname=super-mario-64
pkgver=1.0
pkgrel=1
pkgdesc="Native Linux port of Super Mario 64"
arch=('x86-64')
url="https://github.com/n64decomp/sm64"
license=('none')
depends=(glfw-x11)
makedepends=(git python audiofile mips64-elf-binutils qemu-irix-git)
provides=()
conflicts=()
source=("git+https://github.com/n64decomp/sm64"
        "mario64.patch")
md5sums=('SKIP'
	 'SKIP')

prepare() {
	cd ${srcdir}/${pkgname}
	patch -p1 -f -i ../mario64.patch
}

build() {
	make PREFIX=/usr TARGET_N64=0 -j$(nproc)
}

package() {
	install -D -m755 \
		"${srcdir}/build/us_pc/sm64.us.f3dex2e"
		"${pkgdir}/usr/share/${pkgname}/sm64.us.f3dex2e"
}
