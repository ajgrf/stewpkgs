name=restic
version=0.9.2
description="backups done right"
source="https://github.com/restic/restic/releases/download/v$version/restic-$version.tar.gz"
sum=8f8eee3e9651b9f7384a323ba3c26a5667a6388ab2ef8e6d869d3cd69b9f7c95

use go

build_phase() {
	go run build.go
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$mandir/man1"
	cp restic "$pkgdir/bin"
	cp -t "$mandir/man1" doc/man/*.1
}
