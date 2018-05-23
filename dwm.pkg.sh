name=dwm
version=6.1
description="dynamic window manager"
aptdepends="libx11-dev libxinerama-dev libxft-dev libfreetype6-dev"
source="https://dl.suckless.org/dwm/dwm-$version.tar.gz
	https://dwm.suckless.org/patches/attachabove/dwm-attachabove-6.1.diff
	https://dwm.suckless.org/patches/push/dwm-push-6.1.diff
	https://dwm.suckless.org/patches/uselessgap/dwm-uselessgap-6.1.diff
	dwm.config.h"
sum="c2f6c56167f0acdbe3dc37cca9c1a19260c040f2d4800e3529a21ad7cce275fe
	b2a1118f0ea4c8f239323d072958f1aabd084f1caa48f4507559cdcea475b0a1
	1ccc71598762bcb5551024676a18405bf497339672e2caf55fa25ac566927c64
	502d3679bcb55109d43eaec5b62bcf1b20bdf4a7d0cb68018e9a4e5dfd568796
	11bcb95ef6506f25d30613a29490075397fe82e87254d9939d91dcc33c5029fd"

use suckless

build_phase() {
	make FREETYPEINC=/usr/include/freetype2 X11INC=/usr/include/X11 \
		X11LIB=/usr/lib/X11
}
