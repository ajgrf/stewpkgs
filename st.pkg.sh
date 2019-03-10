name=st
version=0.8.2
description="a simple terminal implementation for X"
aptdepends="libx11-dev libxft-dev x11proto-core-dev"
source="http://dl.suckless.org/st/st-$version.tar.gz
	st-scrollback-0.8.2.diff
	https://st.suckless.org/patches/solarized/st-no_bold_colors-0.8.1.diff"
sum="aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35
	33f0e43be7dc78db13c940fdf11a93475120761d97c0e8f5bcc37fdeacda1c42
	5a6e2b745c7746228e0ee4e84214e3ac7054e6d451bc5843364e878bb2011e3b"

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
