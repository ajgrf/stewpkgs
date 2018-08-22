name=anki
version=2.1.2
description="powerful, intelligent flash cards (binary)"
source="https://apps.ankiweb.net/downloads/current/anki-${version}-linux-amd64.tar.bz2"
sum=e020d1b01c2075573f118fd6a0fa86d468a93ef43f3b72e9c6a9484bfd140b03

install_phase() {
	make PREFIX="$pkgdir" install
}
