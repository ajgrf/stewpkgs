name=firefox
version=60.0
source=("https://download-installer.cdn.mozilla.net/pub/firefox/releases/$version/linux-x86_64/en-US/firefox-$version.tar.bz2" firefox.desktop)
sum=(185808361d70600150f3f63047fa214d86218df0ba6f3a3611f8fb23cd28b8b1
	5bc512b747706793365da8ed51c9550804a7ee65e9073db84ac641149756c524)

install_phase() {
	mkdir -p "$pkgdir/lib/firefox" "$pkgdir/share/applications" "$pkgdir/bin"
	cp -r -t "$pkgdir/lib/firefox" *
	cp ../firefox.desktop "$pkgdir/share/applications/"
	ln -s ../lib/firefox/firefox "$pkgdir/bin/firefox"
}
