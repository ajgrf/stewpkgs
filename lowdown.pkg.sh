name=lowdown
version=0.4.3
description="simple Markdown translator"
source="https://kristaps.bsd.lv/lowdown/snapshots/lowdown-${version}.tar.gz"
sum=25d272edd47724e6892d4f401bc8404e892d5336a8c2cc42b166312d3865ddbe

configure_phase() {
	./configure PREFIX="$pkgdir" MANDIR="$mandir" LDFLAGS="-L$prefix/lib"
}
