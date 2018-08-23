name=markdownfmt
revision=5ba28a0bf0048ea9b00cecd23688dcf6cfb23fe5
version=20180625.$(gitver "$revision")
description="like gofmt but for Markdown"
gitrepo="https://github.com/shurcooL/markdownfmt@${revision}"

use go

unpack_phase() {
	gopathify github.com/shurcooL/markdownfmt
}

install_phase() {
	go get github.com/shurcooL/markdownfmt
}
