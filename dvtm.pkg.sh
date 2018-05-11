name=dvtm
revision=b73aba5c17b10eb9bbfaea6abe0de9802225573d
version=20161211.$(gitver "$revision")
gitrepo=("https://github.com/martanne/dvtm@${revision}")
source=(dvtm.config.h)
sum=(86e185e30b9451f6cb948bb002963973bed88e9ae0a9a4b52ba9d2a53afd3711)

install_phase() {
	export TERMINFO="$pkgdir/share/terminfo"
	mkdir -p "$TERMINFO"
	autosudo make PREFIX="$pkgdir" install
}
