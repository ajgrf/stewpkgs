name=maildir-deduplicate
version=git
description="deduplicate mails from maildir folders"
aptdepends="python3-pip"

install_phase() {
	pip3 install --system --prefix "$pkgdir" git+https://github.com/baip/maildir-deduplicate
}
