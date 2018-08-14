name=mandoc
version=1.14.4
description="UNIX manpage compiler toolset"
source="http://mdocml.bsd.lv/snapshots/mandoc-$version.tar.gz"
sum=24eb72103768987dcc63b53d27fdc085796330782f44b3b40c4660b1e1ee9b9c

configure_phase() {
	cat >configure.local <<-EOF
		PREFIX="$pkgdir"
		MANDIR="$mandir"
		MANPATH_DEFAULT="$prefix/share/man:/usr/local/man:/usr/local/share/man:/usr/share/man"
	EOF
	./configure
}
