name=hugo
version=0.50
description="fast and flexible static site generator"
gitrepo="https://github.com/gohugoio/hugo@v${version}"

use go

unset -f postsetup_phase

build_phase() {
	go build
	./hugo gen man
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$mandir/man1"
	cp hugo "$pkgdir/bin"
	cp ./man/*.1 "$mandir/man1"
}
