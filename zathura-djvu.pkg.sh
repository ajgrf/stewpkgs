name=zathura-djvu
version=0.2.8
aptdepends="libdjvulibre-dev"
depends="zathura"
description="DjVu plugin for zathura"
source="https://pwmt.org/projects/zathura-djvu/download/zathura-djvu-${version}.tar.xz"
sum=d0e664d5312bdc0674fdf8cc6e259c9ee1365714172bc809f9c0f69659d8b32b

use meson

patch_phase() {
	sed -i "/install_dir/ s_.*_  install\_dir: '$pkgdir/lib/zathura'_" meson.build
}
