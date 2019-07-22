name=restic
version=0.9.5
description="backups done right"
source="https://github.com/restic/restic/releases/download/v$version/restic-$version.tar.gz"
sum=e22208e946ede07f56ef60c1c89de817b453967663ce4867628dff77761bd429

use go

build_phase() {
	go run build.go
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$mandir/man1"
	cp restic "$pkgdir/bin"
	cp -t "$mandir/man1" doc/man/*.1
}
