name=shfmt
version=2.3.0
gitrepo="https://github.com/mvdan/sh@v${version}"

use go

unpack_phase() {
	gopathify mvdan.cc/sh
}

install_phase() {
	go install mvdan.cc/sh/cmd/shfmt
}
