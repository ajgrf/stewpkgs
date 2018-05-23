name=plan9port
revision=03a8ec739af17bc4ba0a2e18ea59b33671c34f2b
version=20180327.$(gitver "$revision")
description="a port of Acme and many other Plan 9 programs to UNIX-likes"
aptdepends="libx11-dev libxext-dev libxt-dev"
gitrepo="https://github.com/9fans/plan9port@${revision}"

build_phase() {
	./INSTALL -r "$prefix/lib/plan9"
}

install_phase() {
	mkdir -p "$pkgdir/lib/plan9"
	cp -r * "$pkgdir/lib/plan9"
}
