name=browserpass-native
version=3.0.6
description="Host application for pass browser extension"
depends="go"
source="https://github.com/browserpass/browserpass-native/archive/$version.tar.gz>browserpass-native-$version.tar.gz"
sum=6a2442192aad8fae3642b925d1ff04368eef3a390043e6164c8eb2fd2a438ceb

postsetup_phase() {
	unset LDFLAGS
	export CGO_ENABLED=0
}

configure_phase() {
	make PREFIX="$pkgdir" configure
}
