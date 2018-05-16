name=huniepop
title="HuniePop"
version=2.0.0.3
aptdepends="libc6:i386 libasound2:i386 libasound2-data libasound2-plugins:i386 libstdc++6:i386 libx11-6:i386 libxau6:i386 libxcb1:i386 libxcursor1:i386 libxdmcp6:i386 libxext6:i386 libxfixes3:i386 libxinerama1:i386 libxrandr2:i386 libxrender1:i386 libglu1-mesa:i386"
source=("gogdownloader://huniepop/en3installer2>gog_huniepop_${version}.sh")
sum=(7e7af4a846e2a9e3ef890acbf91445a56cbaebe5205372388770ffdede90c99e)

use gog

postpatch_phase() {
	touch ./game/huniepop_uncensored_patch.game
}
