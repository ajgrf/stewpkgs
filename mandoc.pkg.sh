name=mandoc
version=1.14.5
description="UNIX manpage compiler toolset"
source="http://mdocml.bsd.lv/snapshots/mandoc-$version.tar.gz"
sum=8219b42cb56fc07b2aa660574e6211ac38eefdbf21f41b698d3348793ba5d8f7

configure_phase() {
	cat >configure.local <<-EOF
		PREFIX="$pkgdir"
		MANDIR="$mandir"
		MANPATH_DEFAULT="$prefix/share/man:/usr/local/man:/usr/local/share/man:/usr/share/man"
	EOF
	./configure
}
