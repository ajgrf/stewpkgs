name=zathura-pdf-mupdf
version=0.3.3
depends="mupdf zathura"
description="MuPDF plugin for zathura"
source="https://pwmt.org/projects/zathura-pdf-mupdf/download/zathura-pdf-mupdf-${version}.tar.xz"
sum=52b02ceee272a47f7ef9c2b73cc4f6fb480c02fdce0e7f6b7c8e93ad6ac46dfd

use meson

patch_phase() {
	sed -i "/install_dir/ s_.*_  install\_dir: '$pkgdir/lib/zathura'_" meson.build
}
