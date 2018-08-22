name=racket
version=7.0
description="a programmable Scheme-like programming language"
aptdepends="libffi-dev libfreetype6-dev libjpeg-dev libpango1.0-dev libpng-dev
	libssl-dev libxaw7-dev xbitmaps libxft-dev libgl1-mesa-dev
	libglu1-mesa-dev libx11-dev libcairo2-dev sqlite3"
source="https://mirror.racket-lang.org/installers/$version/racket-$version-src.tgz"
sum=67bb624f5ae810b4ebf85e8f3acfaeda9c95d66e

preconfigure_phase() {
	mkdir src/build
	cd src/build
}

configure_phase() {
	../configure --prefix="$pkgdir"
}
