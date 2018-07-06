name=anki
version=2.0.52
description="powerful, intelligent flash cards (binary)"
source="https://apps.ankiweb.net/downloads/current/anki-${version}-amd64.tar.bz2"
sum=0304869bcc9e966839e3b3408048748be57d645ed0227fbaf0abebe8c18726d0

install_phase() {
	make PREFIX="$pkgdir" install
}
