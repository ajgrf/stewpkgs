name=firefox
version=60.1.0esr
description="Mozilla Firefox web browser (binary)"
source="https://download-installer.cdn.mozilla.net/pub/firefox/releases/$version/linux-x86_64/en-US/firefox-$version.tar.bz2
	firefox.desktop"
sum="5b1420be9136a3a0ea01d4d9253bb65ecea8114d809222c4c2786a7ab077fd57
	5bc512b747706793365da8ed51c9550804a7ee65e9073db84ac641149756c524"

install_phase() {
	mkdir -p "$pkgdir/lib/firefox" "$pkgdir/share/applications" "$pkgdir/bin"
	cp -r -t "$pkgdir/lib/firefox" *
	cp ../firefox.desktop "$pkgdir/share/applications/"
	ln -s ../lib/firefox/firefox "$pkgdir/bin/firefox"
}
