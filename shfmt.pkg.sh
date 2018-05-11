name=shfmt
version=2.3.0
depends=(go)
gitrepo=("https://github.com/mvdan/sh@v${version}")

unpack_phase() {
	gopathify mvdan.cc/sh
}

install_phase() {
	go install mvdan.cc/sh/cmd/shfmt
}
