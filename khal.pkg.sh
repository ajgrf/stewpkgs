name=khal
version=0.9.8

install_phase() {
	pip3 install --system --prefix "$pkgdir" khal=="$version"
}
