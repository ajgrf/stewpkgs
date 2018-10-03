name=pass-import
version=2.3
aptdepends="pass python3-defusedxml"
description="Pass extension for importing from most other password managers"
source="https://github.com/roddhjav/pass-import/releases/download/v$version/pass-import-$version.tar.gz"
sum=7120b8e98c3acad397f0a579246ca32126b99b31b5cd5e662f01788dac717c30

poststow_phase() {
	echo "You need to set a couple environment variables for pass-import to work:"
	echo "export PASSWORD_STORE_ENABLE_EXTENSIONS=true"
	echo "export PASSWORD_STORE_EXTENSIONS_DIR=$STEWPREFIX/lib/password-store/extensions"
}
