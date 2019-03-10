name=zathura
version=0.4.3
depends="libgirara"
aptdepends="libgtk-3-dev python3-sphinx"
description="highly customizable document viewer"
source="https://pwmt.org/projects/zathura/download/zathura-${version}.tar.xz"
sum=7e12194426d709670e0f4b0b107c80dd21322881b57d4a0bf9a09998402ffd41

use meson

patch_phase() {
	sed -i "/^plugindir/ s_.*_plugindir = '$prefix/lib/zathura'_" meson.build
}
