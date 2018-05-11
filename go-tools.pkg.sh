name=go-tools
depends=(go)
gitrepo=("https://go.googlesource.com/tools")

unpack_phase() {
	gopathify golang.org/x/tools
}

install_phase() {
	go get golang.org/x/tools/cmd/...
}
