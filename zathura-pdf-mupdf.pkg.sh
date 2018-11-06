name=zathura-pdf-mupdf
version=0.3.4
depends="mupdf zathura"
description="MuPDF plugin for zathura"
source="https://github.com/pwmt/zathura-pdf-mupdf/archive/${version}.tar.gz>zathura-pdf-mupdf-${version}.tar.gz"
sum=16417f3d259322ea7e6ec7106d519f5750f67079ff6b18fa879e75c1ded6f95e

use meson

patch_phase() {
	sed -i "/install_dir/ s_.*_  install\_dir: '$pkgdir/lib/zathura'_" meson.build
}
