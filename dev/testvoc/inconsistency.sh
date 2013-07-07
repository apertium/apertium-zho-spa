TMPDIR=/tmp

DIR=$1

if [[ $DIR = "spa-zho" ]]; then

lt-expand ../../apertium-zho-spa.spa.dix | grep -v '<prn><enc>' | grep -v 'REGEX' | grep -v ':<:' | sed 's/:>:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/$DIR.tmp_testvoc1.txt |
        apertium-pretransfer|
	lt-proc -b ../../spa-zho.autobil.bin |  tee $TMPDIR/$DIR.tmp_testvoc2.txt |
        apertium-transfer -b ../../apertium-zho-spa.spa-zho.t1x  ../../spa-zho.t1x.bin |
        apertium-interchunk ../../apertium-zho-spa.spa-zho.t2x  ../../spa-zho.t2x.bin |
        apertium-postchunk ../../apertium-zho-spa.spa-zho.t3x  ../../spa-zho.t3x.bin  | tee $TMPDIR/$DIR.tmp_testvoc3.txt |
        lt-proc -d ../../spa-zho.autogen.bin > $TMPDIR/$DIR.tmp_testvoc4.txt
paste -d _ $TMPDIR/$DIR.tmp_testvoc1.txt $TMPDIR/$DIR.tmp_testvoc2.txt $TMPDIR/$DIR.tmp_testvoc3.txt $TMPDIR/$DIR.tmp_testvoc4.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'

elif [[ $DIR = "zho-spa" ]]; then

lt-expand ../../apertium-zho-spa.zho.dix | grep -v '<prn><enc>' | grep -v 'REGEX' | grep -v ':<:' | sed 's/:>:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/$DIR.tmp_testvoc1.txt |
        apertium-pretransfer|
	lt-proc -b ../../zho-spa.autobil.bin | tee $TMPDIR/$DIR.tmp_testvoc2.txt |
        apertium-transfer -b ../../apertium-zho-spa.zho-spa.t1x  ../../zho-spa.t1x.bin |
        apertium-interchunk ../../apertium-zho-spa.zho-spa.t2x  ../../zho-spa.t2x.bin |
        apertium-postchunk ../../apertium-zho-spa.zho-spa.t3x  ../../zho-spa.t3x.bin  | tee $TMPDIR/$DIR.tmp_testvoc3.txt |
        lt-proc -d ../../zho-spa.autogen.bin > $TMPDIR/$DIR.tmp_testvoc4.txt
paste -d _ $TMPDIR/$DIR.tmp_testvoc1.txt $TMPDIR/$DIR.tmp_testvoc2.txt $TMPDIR/$DIR.tmp_testvoc3.txt $TMPDIR/$DIR.tmp_testvoc4.txt| sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'


else
	echo "bash inconsistency.sh <direction>";
fi
