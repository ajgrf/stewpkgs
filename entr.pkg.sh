name=entr
version=4.0
source=("http://entrproject.org/code/entr-$version.tar.gz")
sum=(4ad4fe9108b179199951cfc78a581a8a69602b073dae59bcae4b810f6e1f6c8b)

configure_phase() {
	./configure
}
