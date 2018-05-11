aptdepends+=(lgogdownloader)

unpack_phase() {
	unzip *.sh || true
	cd ./data/noarch
}

patch_phase() {
	sed -i "/^CURRENT_DIR/ s#.*#CURRENT_DIR=$pkgdir/games/$name#" start.sh
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$pkgdir/games/$name/support"
	cp -R start.sh game/ "$pkgdir/games/$name"
	cp support/gog-system-report.sh support/gog_com.shlib support/icon.png \
		"$pkgdir/games/$name/support"
	ln -s "$pkgdir/games/$name/start.sh" "$pkgdir/bin/$name"

	mkdir -p "$pkgdir/share/applications"
	cat > "$pkgdir/share/applications/$name.desktop" <<-EOF
		[Desktop Entry]
		Name=${title:-$name}
		Icon=$pkgdir/games/$name/support/icon.png
		Exec=$name
		Type=Application
		Categories=Game;
	EOF
}
