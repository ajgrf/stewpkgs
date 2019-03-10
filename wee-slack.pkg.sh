name=wee-slack
version=2.2.0
description="a WeeChat plugin for Slack.com"
aptdepends="python-websocket"
source="https://github.com/wee-slack/wee-slack/archive/v$version.tar.gz>wee-slack-$version.tar.gz"
sum=1d08387a301b63f07e74d2a40c5e5f8af54783ba0e3375b6f1fd5eba2fa4da68

install_phase() {
	mkdir -p "$pkgdir/share/weechat/python"
	cp wee_slack.py "$pkgdir/share/weechat/python"
}
