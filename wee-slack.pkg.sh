name=wee-slack
version=2.1.1
description="a WeeChat plugin for Slack.com"
aptdepends="python-websocket"
source="https://github.com/wee-slack/wee-slack/archive/v$version.tar.gz>wee-slack-$version.tar.gz"
sum=8c0d5c1635b1e8e0440a7f27290ce3e3a1fd1ae9c682e0d898d2f2ba4dfd2f19

install_phase() {
	mkdir -p "$pkgdir/share/weechat/python"
	cp wee_slack.py "$pkgdir/share/weechat/python"
}
