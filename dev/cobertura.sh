if [[ $1 == "" ]]; then
	echo "bash cobertura.sh <fitxer>";
	exit;
fi
CORP=$1
OUT=`tempfile`
cat $CORP |  apertium -d ../ zho-spa-biltrans | sed 's/\$/$\n/g' | sed 's/\^/\n^/g' | grep -v '^ *$' > $OUT;

KNOWN=`cat $OUT | grep '<' | grep -v '@'  | wc -l`;
TOTAL=`cat $OUT | wc -l`;

echo "($KNOWN/$TOTAL)*100" | bc -l | sed 's/\([0-9][0-9]\?\)\([0-9]\+\)$/\1%/g'
