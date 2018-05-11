name=anki
version=2.0.50
source=("https://apps.ankiweb.net/downloads/current/anki-${version}-amd64.tar.bz2")
sum=(9a246a7598bc0332de64704cb75db51f27e6f941051f82b43e8cf168a22eba08)

install_phase() {
	make PREFIX="$pkgdir" install
}
