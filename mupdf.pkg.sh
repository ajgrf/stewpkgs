name=mupdf
version=1.14.0
description="framework for PDF, XPS, and E-book documents"
aptdepends="libfreetype6-dev pkg-config libjpeg-dev libjbig2dec0-dev
	libopenjp2-7-dev zlib1g-dev"
source="https://mupdf.com/downloads/archive/mupdf-${version}-source.tar.xz"
sum=b682828373fb1ff9911de08a2b2af7178eb78dc1

build_phase() {
	export CFLAGS="$CFLAGS -fPIC"
	make HAVE_X11=no HAVE_GLUT=no prefix="$pkgdir"
}

install_phase() {
	autosudo make HAVE_X11=no HAVE_GLUT=no prefix="$pkgdir" install
}
