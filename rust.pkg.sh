name=rust
version=1.26.0
description="the Rust programming language (binary)"
source="https://static.rust-lang.org/dist/rust-$version-x86_64-unknown-linux-gnu.tar.gz"
sum=13691d7782577fc9f110924b26603ade1990de0b691a3ce2dc324b4a72a64a68

install_phase() {
	./install.sh --prefix="$pkgdir"
}
