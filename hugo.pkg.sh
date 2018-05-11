name=hugo
version=0.40.1
depends=(go dep)
gitrepo=("https://github.com/gohugoio/hugo@v${version}")

unpack_phase() {
	gopathify github.com/gohugoio/hugo
}

build_phase() {
	dep ensure
	go build
	./hugo gen man
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$mandir/man1"
	cp hugo "$pkgdir/bin"
	cp ./man/*.1 "$mandir/man1"
}
