name=restic
version=0.8.3
depends=(go)
source=("https://github.com/restic/restic/releases/download/v$version/restic-$version.tar.gz")
sum=(0cf697c88404b180d6d6ff2e7d2c27b2fcb9536da6dbdf15ad4d320af7e8f17c)

build_phase() {
	go run build.go
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$mandir/man1"
	cp restic "$pkgdir/bin"
	cp -t "$mandir/man1" doc/man/*.1
}
