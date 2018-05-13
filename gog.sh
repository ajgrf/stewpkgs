aptdepends+=(lgogdownloader)
description="${description:-$title}"

fetch() {
	local src dest
	src="${1%>*}"
	dest=$(destname "$1")
	if ! test -f "$dest"; then
		echo "fetching $dest" >&2
		case "$src" in
			gogdownloader://*)
				lgogdownloader --download-file "$src"
				;;
			*)
				curl -L "$src" > "$dest"
				;;
		esac
	fi
}

unpack_phase() {
	unzip *.sh || true
	cd ./data/noarch
}

patch_phase() {
	sed -i "/^CURRENT_DIR/ s#.*#CURRENT_DIR=$pkgdir/games/$name#" start.sh
}

install_phase() {
	mkdir -p "$pkgdir/bin" "$pkgdir/games/$name"
	cp -R * "$pkgdir/games/$name"
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
