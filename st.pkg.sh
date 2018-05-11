name=st
version=0.8.1
aptdepends=(libx11-dev libxft-dev x11proto-core-dev)
source=("http://dl.suckless.org/st/st-$version.tar.gz" \
	st.config.h \
	st.desktop \
	"https://st.suckless.org/patches/solarized/st-no_bold_colors-0.8.1.diff" \
	"https://st.suckless.org/patches/scrollback/st-scrollback-0.8.diff")
sum=(c4fb0fe2b8d2d3bd5e72763e80a8ae05b7d44dbac8f8e3bb18ef0161c7266926 \
	7abc3b6985516299f0e132c7a102c4ca42d37e508621ca55b3d591966b6a8c0d \
	515fa9786825e2369093e8c8978ffeffc2a2a4763e83ae140084fe28c53946c5 \
	5a6e2b745c7746228e0ee4e84214e3ac7054e6d451bc5843364e878bb2011e3b \
	8279d347c70bc9b36f450ba15e1fd9ff62eedf49ce9258c35d7f1cfe38cca226)

patch_phase() {
	patch -p1 < "$builddir/${source[3]##*/}"
	patch -p1 < "$builddir/${source[4]##*/}"
}

install_phase() {
	export TERMINFO="$pkgdir/share/terminfo"
	mkdir -p "$TERMINFO"
	autosudo make PREFIX="$pkgdir" install

	mkdir -p "$pkgdir/share/applications"
	cp ../st.desktop "$pkgdir/share/applications"
}
