#!/bin/sh
#
#T1=`tempfile -p 'tml1.' -d 'tmpmeld' -s ".${1:-txt}"`
mkdir -p /tmp/tmpmeld
T1=`gmktemp --tmpdir="/tmp/tmpmeld" "1.XXXXXXXXXXXXXXXXXXXX.${1:-txt}"`
T2=`gmktemp --tmpdir="/tmp/tmpmeld" "2.XXXXXXXXXXXXXXXXXXXX.${1:-txt}"`
echo "meld $T1 $T2"
meld -Lleft -Lright $T1 $T2
rm $T1 $T2
