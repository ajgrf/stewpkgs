name=ripgrep
version=0.8.1
depends=(rust)

install_phase() {
	cargo install --root "$pkgdir" --vers "$version" ripgrep
}
