name=restic
version=0.9.0
description="backups done right"
source="https://github.com/restic/restic/releases/download/v$version/restic-$version.tar.gz"
sum=5b46612254dcaec09a6f7ddae70e116f77c0f87ac7988dc379b34d0fd4bbc4c4

use go

build_phase() {
	go run build.go
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$mandir/man1"
	cp restic "$pkgdir/bin"
	cp -t "$mandir/man1" doc/man/*.1
}
