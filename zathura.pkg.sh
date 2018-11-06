name=zathura
version=0.4.1
depends="libgirara"
aptdepends="libgtk-3-dev python3-sphinx"
description="highly customizable document viewer"
source="https://github.com/pwmt/zathura/archive/${version}.tar.gz>zathura-${version}.tar.gz"
sum=a659042c64f65188d5806b8ed4109e6ec5c582836c099c437333b85b06f2eb4c

use meson

patch_phase() {
	sed -i "/^plugindir/ s_.*_plugindir = '$prefix/lib/zathura'_" meson.build
}
