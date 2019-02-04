name=maildir-deduplicate
version=2.1.0
description="deduplicate mails from maildir folders"
aptdepends="python3-pip"

install_phase() {
	pip3 install --system --prefix "$pkgdir" "$name"=="$version"
}
