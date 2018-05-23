name=dwm
version=6.1
aptdepends="libx11-dev libxinerama-dev libxft-dev libfreetype6-dev
	libx11-xcb-dev libxcb-res0-dev"
source="https://dl.suckless.org/dwm/dwm-$version.tar.gz
	https://dwm.suckless.org/patches/attachabove/dwm-attachabove-6.1.diff
	https://dwm.suckless.org/patches/push/dwm-push-6.1.diff
	https://dwm.suckless.org/patches/swallow/dwm-swallow-6.1.diff
	https://dwm.suckless.org/patches/uselessgap/dwm-uselessgap-6.1.diff
	dwm.config.h"
sum="c2f6c56167f0acdbe3dc37cca9c1a19260c040f2d4800e3529a21ad7cce275fe
	b2a1118f0ea4c8f239323d072958f1aabd084f1caa48f4507559cdcea475b0a1
	1ccc71598762bcb5551024676a18405bf497339672e2caf55fa25ac566927c64
	7161a158056746e6c319fe14b55c3de84808ec3cdcde288607ecd6d9e511e533
	502d3679bcb55109d43eaec5b62bcf1b20bdf4a7d0cb68018e9a4e5dfd568796
	6badfbdfb490bb4dcebc944971b63bafe7892ca1e80b7d1c9fca5eb63153526c"

use suckless

patch_phase() {
	patch -p1 <"$builddir/$(basename $(field 2 $source))"
	patch -p1 <"$builddir/$(basename $(field 3 $source))"
	patch -p1 <"$builddir/$(basename $(field 4 $source))"
	patch -p1 <"$builddir/$(basename $(field 5 $source))"
}

build_phase() {
	make FREETYPEINC=/usr/include/freetype2 X11INC=/usr/include/X11 \
		X11LIB=/usr/lib/X11
}

install_phase() {
	autosudo make PREFIX="$pkgdir" install
}
