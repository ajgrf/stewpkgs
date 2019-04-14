name=markdownfmt
revision=3438a10682f5f5790da1e59ac7d6518c499d9a2f
version=20190409.$(gitver "$revision")
description="like gofmt but for Markdown"
gitrepo="https://github.com/shurcooL/markdownfmt@${revision}"

use go

unpack_phase() {
	gopathify github.com/shurcooL/markdownfmt
}

install_phase() {
	go get github.com/shurcooL/markdownfmt
}
