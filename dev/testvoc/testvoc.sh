if [[ $1 = "spa-zho" ]]; then
echo "==Spanish->Chinese===========================";
bash inconsistency.sh spa-zho > /tmp/spa-zho.testvoc; bash inconsistency-summary.sh /tmp/spa-zho.testvoc spa-zho
echo ""

elif [[ $1 = "zho-spa" ]]; then
echo "==Chinese->Spanish===========================";
bash inconsistency.sh zho-spa > /tmp/zho-spa.testvoc; bash inconsistency-summary.sh /tmp/zho-spa.testvoc zho-spa

fi
