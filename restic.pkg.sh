name=restic
version=0.9.4
description="backups done right"
source="https://github.com/restic/restic/releases/download/v$version/restic-$version.tar.gz"
sum=c7dca90fb6fd83cee8b9f6a2776f5839794341af1953d251bf06a91870be7a8e

use go

build_phase() {
	go run build.go
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$mandir/man1"
	cp restic "$pkgdir/bin"
	cp -t "$mandir/man1" doc/man/*.1
}
