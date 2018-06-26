name=zathura
version=0.4.0
depends="libgirara"
aptdepends="libgtk-3-dev python3-sphinx"
description="highly customizable document viewer"
source="https://pwmt.org/projects/zathura/download/zathura-${version}.tar.xz"
sum=aa629259c6ac729e90abdda1b9b51854adaa6851192f08a55e63379500541ec8

use meson

patch_phase() {
	sed -i "/^plugindir/ s_.*_plugindir = '$prefix/lib/zathura'_" meson.build
}
