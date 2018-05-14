name=lowdown
version=0.3.2
source=("https://kristaps.bsd.lv/lowdown/snapshots/lowdown-${version}.tar.gz")
sum=(740cf6025c43ceaae9bcc1ffc3e94986aa62d65d91ef8173d444a1977c562094)

preconfigure_phase() {
	configureflags=(PREFIX="$pkgdir" MANDIR="$mandir")
}
