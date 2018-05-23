name=fonts-comic-neue
version=2.3
description="font that fixes the shortcomings of Comic Sans"
source="http://comicneue.com/comic-neue-$version.zip"
sum=f3a7500eb477d03a865249dd3fa5ecff516d12d11d5d8494c8164fd4ee842599

use font

preinstall_phase() {
	cd ../OTF
}
