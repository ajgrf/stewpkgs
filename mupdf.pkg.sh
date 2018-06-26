name=mupdf
version=1.13.0
description="framework for PDF, XPS, and E-book documents"
aptdepends="libfreetype6-dev pkg-config libjpeg-dev libjbig2dec0-dev
	libopenjp2-7-dev zlib1g-dev"
source="https://mupdf.com/downloads/mupdf-${version}-source.tar.xz"
sum=7dd17ba51ae44e7e4614252aa5d3f3d615a26215

build_phase() {
	export CFLAGS="$CFLAGS -fPIC"
	make HAVE_X11=no HAVE_GLUT=no prefix="$pkgdir"
}

install_phase() {
	autosudo make HAVE_X11=no HAVE_GLUT=no prefix="$pkgdir" install
}
