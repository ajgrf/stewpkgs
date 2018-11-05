name=restic
version=0.9.3
description="backups done right"
source="https://github.com/restic/restic/releases/download/v$version/restic-$version.tar.gz"
sum=b95a258099aee9a56e620ccebcecabc246ee7f8390e3937ccedadd609c6d2dd0

use go

build_phase() {
	go run build.go
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$mandir/man1"
	cp restic "$pkgdir/bin"
	cp -t "$mandir/man1" doc/man/*.1
}
