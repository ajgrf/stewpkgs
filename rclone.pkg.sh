name=rclone
version=1.44
description="rsync for cloud storage"
gitrepo="https://github.com/ncw/rclone@v${version}"

use go

unset -f postsetup_phase

build_phase() {
	go build
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$mandir/man1"
	cp rclone "$pkgdir/bin"
	cp rclone.1 "$mandir/man1"
}
