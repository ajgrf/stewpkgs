name=trash-cli
version=0.17.1.14
description="trash can management tool"
aptdepends="python3-pip"

install_phase() {
	pip3 install --system --prefix "$pkgdir" trash-cli=="$version"
}
