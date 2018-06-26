name=zathura-ps
version=0.2.6
aptdepends="libspectre-dev"
depends="zathura"
description="PostScript plugin for zathura"
source="https://pwmt.org/projects/zathura-ps/download/zathura-ps-${version}.tar.xz"
sum=7eb085b41fc88979f997310b4e703455e6a81b6ef1ae7db0b6324b6f13c2cf73

use meson

patch_phase() {
	sed -i "/install_dir/ s_.*_  install\_dir: '$pkgdir/lib/zathura'_" meson.build
}
