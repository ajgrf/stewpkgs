name=racket
version=6.12
aptdepends="libffi-dev libfreetype6-dev libjpeg-dev libpango1.0-dev libpng-dev
	libssl-dev libxaw7-dev xbitmaps libxft-dev libgl1-mesa-dev
	libglu1-mesa-dev libx11-dev libcairo2-dev sqlite3"
source="https://mirror.racket-lang.org/installers/$version/racket-$version-src.tgz"
sum=655e052847c53e7c64ab9ad2247860c7b9abe2c4b0966474f0375127fff58c33

preconfigure_phase() {
	mkdir src/build
	cd src/build
}

configure_phase() {
	../configure --prefix="$pkgdir"
}
