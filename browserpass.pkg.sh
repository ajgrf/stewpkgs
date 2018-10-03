name=browserpass
version=2.0.22
description="Host application for pass browser extension"
depends="dep"
source="https://github.com/browserpass/browserpass/releases/download/$version/browserpass-src.tar.gz>browserpass-$version.tar.gz"
sum=0624f2e3b0a98a2ccfa2307002d55048f471ff9c8c61e29a48b753d63da838c2

use go

postunpack_phase() {
	cd ..
	gopathify github.com/browserpass/browserpass
}

build_phase() {
	dep ensure
}

install_phase() {
	libdir="$pkgdir/lib/browserpass"
	mkdir -p "$libdir"
	cp -t "$libdir" install.sh chrome-host.json chrome-policy.json firefox-host.json
	GOBIN="$libdir" go install ./cmd/browserpass
}
