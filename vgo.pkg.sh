name=vgo
description="versioned go command"
gitrepo="https://go.googlesource.com/vgo"

use go

unpack_phase() {
	gopathify golang.org/x/vgo
}

install_phase() {
	go get golang.org/x/vgo
}
