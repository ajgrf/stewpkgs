name=vgo
gitrepo=("https://go.googlesource.com/vgo")
depends=(go)

unpack_phase() {
	gopathify golang.org/x/vgo
}

install_phase() {
	go get golang.org/x/vgo
}
