name=go
version=1.10.3
description="the Go programming language"
depends="go1.4-bootstrap"
source="https://storage.googleapis.com/golang/go$version.src.tar.gz"
sum=567b1cc66c9704d1c019c50bef946272e911ec6baf244310f87f4e678be155f2

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
