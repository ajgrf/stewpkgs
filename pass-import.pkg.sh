name=pass-import
version=2.4
aptdepends="pass python3-defusedxml"
description="Pass extension for importing from most other password managers"
source="https://github.com/roddhjav/pass-import/releases/download/v$version/pass-import-$version.tar.gz"
sum=ab9f75fb40e757f1327d9f91748f9bfdea87e2f85f7b2c4aa62f03d2715bc747

install_phase() {
	autosudo make PREFIX="$pkgdir" BASHCOMPDIR="$pkgdir/share/bash-completion/completions" install
}

poststow_phase() {
	echo "You need to set a couple environment variables for pass-import to work:"
	echo "export PASSWORD_STORE_ENABLE_EXTENSIONS=true"
	echo "export PASSWORD_STORE_EXTENSIONS_DIR=$STEWPREFIX/lib/password-store/extensions"
}
