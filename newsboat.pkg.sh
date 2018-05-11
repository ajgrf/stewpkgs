name=newsboat
version=2.11.1
aptdepends=(libncursesw5-dev libxml2-dev libstfl-dev libsqlite3-dev \
	perl pkg-config libcurl4-gnutls-dev libjson-c-dev asciidoc  \
	libxml2-utils xsltproc docbook-xml docbook-xsl)
source=("https://newsboat.org/releases/$version/newsboat-$version.tar.xz")
sum=(aab67dcd386a3512812e1af0fddb8e1f4dce08d2a106946fe5ad405210ed37cf)

install_phase() {
	autosudo make prefix="$pkgdir" install
}
