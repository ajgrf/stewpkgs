name=lowdown
version=0.4.2
description="simple Markdown translator"
source="https://kristaps.bsd.lv/lowdown/snapshots/lowdown-${version}.tar.gz"
sum=2a9d318a4f0898dd6cb65a46ad5cdf23d85660fcbbcebe19aa4828a4ca2f5c04

configure_phase() {
	./configure PREFIX="$pkgdir" MANDIR="$mandir" LDFLAGS="-L$prefix/lib"
}
