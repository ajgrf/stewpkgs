name=dep
version=0.4.1
depends=(go)
gitrepo=("https://github.com/golang/dep@v${version}")

unpack_phase() {
	gopathify github.com/golang/dep
}

install_phase() {
	mkdir -p "$pkgdir/bin"
	go install ./cmd/dep
}
