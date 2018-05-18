name=firefox
version=60.0.1
source="https://download-installer.cdn.mozilla.net/pub/firefox/releases/$version/linux-x86_64/en-US/firefox-$version.tar.bz2
	firefox.desktop"
sum="5e14345d77e72d43816b809a0db0a01c2c98dd196841b1c5bc07dc400af90ee8
	5bc512b747706793365da8ed51c9550804a7ee65e9073db84ac641149756c524"

install_phase() {
	mkdir -p "$pkgdir/lib/firefox" "$pkgdir/share/applications" "$pkgdir/bin"
	cp -r -t "$pkgdir/lib/firefox" *
	cp ../firefox.desktop "$pkgdir/share/applications/"
	ln -s ../lib/firefox/firefox "$pkgdir/bin/firefox"
}
