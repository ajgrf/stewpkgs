name=rust
version=1.25.0
source=("https://static.rust-lang.org/dist/rust-$version-x86_64-unknown-linux-gnu.tar.gz")
sum=(06fb45fb871330a2d1b32a27badfe9085847fe824c189ddc5204acbe27664f5e)

install_phase() {
	./install.sh --prefix="$pkgdir"
}
