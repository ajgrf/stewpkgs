name=chicken
version=4.13.0
source="https://code.call-cc.org/releases/$version/chicken-$version.tar.gz"
sum=add549619a31363d6608b39e0cf0e68b9d5e6ff2a719b5691ddeba57229c6c43

configure_phase() {
	makevars="PLATFORM=linux PREFIX=$pkgdir"
}

build_phase() {
	make $makevars
}

test_phase() {
	make $makevars check
}

install_phase() {
	make $makevars install
}
