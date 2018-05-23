name=youtube-dl
version=2018.05.18
description="download videos from YouTube.com and other sites"

install_phase() {
	pip3 install --system --prefix "$pkgdir" youtube-dl=="$version"
}
