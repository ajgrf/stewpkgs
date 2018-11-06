name=zathura-djvu
version=0.2.8
aptdepends="libdjvulibre-dev"
depends="zathura"
description="DjVu plugin for zathura"
source="https://github.com/pwmt/zathura-djvu/archive/${version}.tar.gz>zathura-djvu-${version}.tar.gz"
sum=58325958b5aecc4f7cd8281b564aadeea151fafd1de84e4fa269932f96a3a776

use meson

patch_phase() {
	sed -i "/install_dir/ s_.*_  install\_dir: '$pkgdir/lib/zathura'_" meson.build
}
