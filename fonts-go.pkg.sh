name=fonts-go
revision=f03a046406d4d7fbfd4ed29f554da8f6114049fc
version=20170330.$(gitver "$revision")
description="the Go font family"
gitrepo="https://go.googlesource.com/image@${revision}"

use font

configure_phase() {
	cd ./font/gofont/ttfs
}
