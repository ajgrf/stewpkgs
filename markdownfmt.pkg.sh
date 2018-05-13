name=markdownfmt
revision=10aae0a270abfb5d929ae6ca59c4b0ac0fa8f237
version=20170214.$(gitver "$revision")
depends=(go)
gitrepo=("https://github.com/shurcooL/markdownfmt@${revision}")

unpack_phase() {
	gopathify github.com/shurcooL/markdownfmt
}

install_phase() {
	go get github.com/shurcooL/markdownfmt
}
