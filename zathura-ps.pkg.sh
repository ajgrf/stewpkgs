name=zathura-ps
version=0.2.6
aptdepends="libspectre-dev"
depends="zathura"
description="PostScript plugin for zathura"
source="https://github.com/pwmt/zathura-ps/archive/${version}.tar.gz>zathura-ps-${version}.tar.gz"
sum=08c1927bfb8a40e201fa3638f9523d4b6d70e3444ef070bd4aa8a869b6574567

use meson

patch_phase() {
	sed -i "/install_dir/ s_.*_  install\_dir: '$pkgdir/lib/zathura'_" meson.build
}
