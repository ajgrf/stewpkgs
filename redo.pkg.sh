name=redo
version=1.3
source=("https://jdebp.eu/Repository/freebsd/redo-$version.tar.gz")
sum=(191cc99f24c450710fe4ea6dd2bea4a6ed6afab2eb870c4d0232009d4ab3a7fb)

build_phase() {
	cd ..
	package/compile
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$mandir/man1"
	for i in redo redo-ifcreate redo-ifchange cubehash; do
		cp "command/$i"  "$pkgdir/bin/$i"
		cp "manual/$i.1" "$mandir/man1/$i.1"
	done
}
