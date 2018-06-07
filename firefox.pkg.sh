name=firefox
version=60.0.2
description="Mozilla Firefox web browser (binary)"
source="https://download-installer.cdn.mozilla.net/pub/firefox/releases/$version/linux-x86_64/en-US/firefox-$version.tar.bz2
	firefox.desktop"
sum="90e5d4c106ae1756e6834593b357925f48a4e60c539e5f95f4bc323b5b7f4196
	5bc512b747706793365da8ed51c9550804a7ee65e9073db84ac641149756c524"

install_phase() {
	mkdir -p "$pkgdir/lib/firefox" "$pkgdir/share/applications" "$pkgdir/bin"
	cp -r -t "$pkgdir/lib/firefox" *
	cp ../firefox.desktop "$pkgdir/share/applications/"
	ln -s ../lib/firefox/firefox "$pkgdir/bin/firefox"
}
