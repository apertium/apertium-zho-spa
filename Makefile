all:
	lt-comp lr apertium-zho-spa.zho.dix zho-spa.automorf.bin
	lt-comp lr apertium-zho-spa.zho-spa.dix zho-spa.autobil.bin
	apertium-preprocess-transfer apertium-zho-spa.zho-spa.t1x zho-spa.t1x.bin
	lt-comp rl apertium-zho-spa.zho-spa.spa.dix zho-spa.autogen.bin
