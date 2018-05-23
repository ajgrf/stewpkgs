name=ripgrep
version=0.8.1
description="recursively search directories for a regex"
depends="rust"
aptdepends="asciidoc"
source="https://github.com/BurntSushi/ripgrep/archive/${version}.tar.gz>rust-${version}.tar.gz"
sum=7035379fce0c1e32552e8ee528b92c3d01b8d3935ea31d26c51a73287be74bb3

build_phase() {
	cargo build --release
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$mandir/man1"
	cp target/release/rg "$pkgdir/bin"
	cp target/release/build/ripgrep-*/out/rg.1 "$mandir/man1"
}
