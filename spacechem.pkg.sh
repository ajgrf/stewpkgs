name=spacechem
title="Spacechem"
version=2.0.0.6
aptdepends=(libc6:i386 libasound2:i386 libasound2-data libasound2-plugins:i386
	libcaca0:i386 libjpeg62-turbo:i386 libpng16-16:i386 libtiff5:i386
	libncurses5:i386 libsqlite3-0:i386 libsdl1.2debian:i386
	libsdl-mixer1.2:i386 libsdl-image1.2:i386 libgdiplus:i386)
source=("gogdownloader://spacechem/en3installer2>gog_spacechem_${version}.sh")
sum=(da01f995671322f73164cefd12b9c35cbd39bfe2dee631db678731af1f2afbf2)

use gog
