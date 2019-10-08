name=kmonad
version=0.2.0
source="https://github.com/david-janssen/kmonad/releases/download/$version/kmonad"
sum=12c79581e10e1ea8034f643e5912ae5abbaddd61da9d03f4c1df8eb2266f8838

install_phase() {
	install -Dm755 "$(destname "$source")" "$pkgdir/bin/kmonad"
}
