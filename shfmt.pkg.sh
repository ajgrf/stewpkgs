name=shfmt
version=2.6.4
description="like gofmt but for shell scripts"
gitrepo="https://github.com/mvdan/sh@v${version}"

use go

unpack_phase() {
	gopathify mvdan.cc/sh
}

install_phase() {
	go install mvdan.cc/sh/cmd/shfmt
}
