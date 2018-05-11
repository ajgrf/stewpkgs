name=go
version=1.10.2
depends=(go1.4-bootstrap)
source=("https://storage.googleapis.com/golang/go$version.src.tar.gz")
sum=(6264609c6b9cd8ed8e02ca84605d727ce1898d74efa79841660b2e3e985a98bd)

build_phase() {
	export GOROOT_BOOTSTRAP="$prefix/lib/go1.4-bootstrap"
	export GOROOT_FINAL="$prefix/lib/$name"
	( cd ./src && ./make.bash )
}

install_phase() {
	cd ..
	mkdir -p "$pkgdir/lib"
	cp -r go "$pkgdir/lib/$name"
	mv "$pkgdir/lib/$name/bin" "$pkgdir"
}
