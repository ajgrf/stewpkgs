name=youtube-dl
version=2018.05.18

install_phase() {
	pip3 install --system --prefix "$pkgdir" youtube-dl=="$version"
}
