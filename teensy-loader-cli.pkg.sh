name=teensy-loader-cli
version=2.1
aptdepends="libusb-dev"
description="Load programs on Teensy USB development boards"
source="https://github.com/PaulStoffregen/teensy_loader_cli/archive/$version.tar.gz>teensy_loader_cli-$version.tar.gz"
sum=5c36fe45b9a3a71ac38848b076cd692bf7ca8826a69941c249daac3a1d95e388

install_phase() {
	mkdir -p "$pkgdir/bin"
	cp teensy_loader_cli "$pkgdir/bin"
}
