name=go
version=1.11rc1
description="the Go programming language"
depends="go1.4-bootstrap"
source="https://storage.googleapis.com/golang/go$version.src.tar.gz"
sum=fcb8778ad5d1bb7f5bfd1564ba4107894011f1d65f69be9fa1e693f6b5143828

build_phase() {
	export GOROOT_BOOTSTRAP="$prefix/lib/go1.4-bootstrap"
	export GOROOT_FINAL="$prefix/lib/$name"
	(cd ./src && ./make.bash)
}

install_phase() {
	cd ..
	mkdir -p "$pkgdir/lib"
	cp -r go "$pkgdir/lib/$name"
	mv "$pkgdir/lib/$name/bin" "$pkgdir"
}
