name=libdiff
version=0.1.0
source=https://kristaps.bsd.lv/libdiff/snapshots/libdiff-$version.tar.gz
sum=2012d2eae9ecaf9717c77ecefd9bdff4e38f485d8b9ad8f916cff1fdf1151512

configure_phase() {
	./configure PREFIX="$pkgdir" MANDIR="$mandir"
}
