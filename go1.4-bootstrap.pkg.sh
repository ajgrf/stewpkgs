name=go1.4-bootstrap
version=20171003
source=("https://storage.googleapis.com/golang/go1.4-bootstrap-$version.tar.gz")
sum=(f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52)

build_phase() {
	export GOBIN=""
	export GOROOT_FINAL="$prefix/lib/$name"
	( cd ./src && ./make.bash )
}

install_phase() {
	cd ..
	mkdir -p "$pkgdir/lib"
	cp -r go "$pkgdir/lib/$name"
}
