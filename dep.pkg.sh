name=dep
version=0.5.0
description="Go dependency management tool"
gitrepo="https://github.com/golang/dep@v${version}"

use go

unpack_phase() {
	gopathify github.com/golang/dep
}

install_phase() {
	mkdir -p "$pkgdir/bin"
	go install ./cmd/dep
}
