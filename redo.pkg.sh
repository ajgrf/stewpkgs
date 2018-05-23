name=redo
version=1.4
description="a simple build system, make alternative"
source="https://jdebp.eu/Repository/freebsd/redo-$version.tar.gz"
sum=5b9289f1228eee2f22ab96f7dd4f9b43e3a6d24f75c1f9d1e18eec7360c90fb1

build_phase() {
	cd ..
	package/compile
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$mandir/man1"
	for i in redo redo-ifcreate redo-ifchange cubehash; do
		cp "command/$i" "$pkgdir/bin/$i"
		cp "manual/$i.1" "$mandir/man1/$i.1"
	done
}
