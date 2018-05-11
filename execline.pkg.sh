name=execline
version=2.5.0.0
depends=(skalibs)
source=("https://github.com/skarnet/execline/archive/v$version.tar.gz>$name-$version.tar.gz")
sum=(2c705c2ccbfee05e464b107dd6343fcf82a9ab917f0ad4259c98beff41d53bad)

preconfigure_phase() {
	configureflags=("--prefix=$pkgdir" "--with-lib=$prefix/lib"
		"--with-lib=$prefix/lib/execline"
		"--with-dynlib=$prefix/lib/execline"
		"--with-dynlib=$prefix/lib"
		"--with-sysdeps=$prefix/lib/skalibs/sysdeps")
}
