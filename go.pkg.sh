name=go
version=1.11rc2
description="the Go programming language"
depends="go1.4-bootstrap"
source="https://storage.googleapis.com/golang/go$version.src.tar.gz"
sum=5947695c5289ddb6ddc22d01d498b94ddb86bb6775593d772156c4e72a482516

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
