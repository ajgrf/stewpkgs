name=st
version=0.8.1
description="a simple terminal implementation for X"
aptdepends="libx11-dev libxft-dev x11proto-core-dev"
source="http://dl.suckless.org/st/st-$version.tar.gz
	https://st.suckless.org/patches/solarized/st-no_bold_colors-0.8.1.diff
	https://st.suckless.org/patches/scrollback/st-scrollback-0.8.diff"
sum="c4fb0fe2b8d2d3bd5e72763e80a8ae05b7d44dbac8f8e3bb18ef0161c7266926
	5a6e2b745c7746228e0ee4e84214e3ac7054e6d451bc5843364e878bb2011e3b
	8279d347c70bc9b36f450ba15e1fd9ff62eedf49ce9258c35d7f1cfe38cca226"

use suckless

postsetup_phase() {
	export TERMINFO="$pkgdir/share/terminfo"
}

postinstall_phase() {
	mkdir -p "$pkgdir/share/applications"
	cat >"$pkgdir/share/applications/st.desktop" <<-EOF
		[Desktop Entry]
		Name=st simple terminal
		Type=Application
		Categories=System;TerminalEmulator;
		Icon=utilities-terminal
		StartupWMClass=st-256color
		TryExec=st
		Exec=st
	EOF
}
