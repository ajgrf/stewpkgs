name=skalibs
version=2.6.4.0
source=("https://github.com/skarnet/skalibs/archive/v$version.tar.gz>$name-$version.tar.gz")
sum=(842fac5df898434e8fb15ac03e0b97745eac689339bae1af62b8906d81f16107)

preconfigure_phase() {
	configureflags=("--prefix=$pkgdir" "--libdir=$pkgdir/lib"
		"--includedir=$pkgdir/include"
		"--sysdepdir=$pkgdir/lib/skalibs/sysdeps")
}
