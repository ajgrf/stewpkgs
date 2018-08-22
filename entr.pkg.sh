name=entr
version=4.1
description="run arbitrary commands when files change"
source="http://entrproject.org/code/entr-$version.tar.gz"
sum=c503c93ccffc1e6b2da979cdcb88c5a686e261103501eede7077fa089cdfef78

configure_phase() {
	./configure
}
