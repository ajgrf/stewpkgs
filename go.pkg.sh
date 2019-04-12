name=go
version=1.12.4
description="the Go programming language"
depends="go1.4-bootstrap"
source="https://storage.googleapis.com/golang/go$version.src.tar.gz"
sum=4affc3e610cd8182c47abbc5b0c0e4e3c6a2b945b55aaa2ba952964ad9df1467

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
