name=go-tools
description="development tools supporting the Go programming language"
gitrepo="https://go.googlesource.com/tools"

use go

unpack_phase() {
	gopathify golang.org/x/tools
}

install_phase() {
	go get golang.org/x/tools/cmd/...
}
