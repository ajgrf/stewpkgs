name=wee-slack
version=2.0.0
description="a WeeChat plugin for Slack.com"
aptdepends="python-websocket"
source="https://github.com/wee-slack/wee-slack/archive/v$version.tar.gz>wee-slack-$version.tar.gz"
sum=1090f667d9e52e977940f7d071fc88a4fd860bb9421dd0f703315886e4f57d67

install_phase() {
	mkdir -p "$pkgdir/share/weechat/python"
	cp wee_slack.py "$pkgdir/share/weechat/python"
}
