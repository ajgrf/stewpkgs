name=lowdown
version=0.4.0
description="simple Markdown translator"
depends=libdiff
source="https://kristaps.bsd.lv/lowdown/snapshots/lowdown-${version}.tar.gz"
sum=d075ddb3c1fb9908d1b72c395429a0faebd3940f9c995e817eb2e93923c9ccaa

configure_phase() {
	./configure PREFIX="$pkgdir" MANDIR="$mandir" LDFLAGS="-L$prefix/lib"
}
