name=go
version=1.12
description="the Go programming language"
depends="go1.4-bootstrap"
source="https://storage.googleapis.com/golang/go$version.src.tar.gz"
sum=09c43d3336743866f2985f566db0520b36f4992aea2b4b2fd9f52f17049e88f2

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
