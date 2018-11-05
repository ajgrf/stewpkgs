name=newsboat
version=2.12
description="text mode feed reader with podcast support"
aptdepends="gettext libncursesw5-dev libxml2-dev libstfl-dev libsqlite3-dev
	perl pkg-config libcurl4-gnutls-dev libjson-c-dev asciidoc
	libxml2-utils xsltproc docbook-xml docbook-xsl"
source="https://newsboat.org/releases/$version/newsboat-$version.tar.xz"
sum=9bbdbc2bca9e0c75a75588d89de3862f72e3fcb41c5d7db6210e2b491ffd43f4

install_phase() {
	autosudo make prefix="$pkgdir" install
}
