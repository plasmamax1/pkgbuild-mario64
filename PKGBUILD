# Maintainer: secret

pkgname=super-mario-64
pkgver=1.0
pkgrel=1
pkgdesc="Native Linux port of Super Mario 64"
arch=('x86_64')
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
	cd ${srcdir}/sm64
	patch --forward --strip=1 --input="${srcdir}/mario64.patch"
}

build() {
	cd ${srcdir}/sm64
	make PREFIX=/usr TARGET_N64=0 -j$(nproc)
}

package() {
	install -D -m755 \
		"${srcdir}/sm64/build/us_pc/sm64.us.f3dex2e"
		"${pkgdir}/usr/share/${pkgname}/sm64.us.f3dex2e"
}
