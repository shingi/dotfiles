#!/bin/sh
#
#T1=`tempfile -p 'tml1.' -d 'tmpdif' -s ".${1:-txt}"`
mkdir -p /tmp/tmpdif
T1=`gmktemp --tmpdir="/tmp/tmpdif" "1.XXXXXXXXXXXXXXXXXXXX.${1:-txt}"`
T2=`gmktemp --tmpdir="/tmp/tmpdif" "2.XXXXXXXXXXXXXXXXXXXX.${1:-txt}"`
echo "idea diff $T1 $T2"
idea diff $T1 $T2
rm $T1 $T2
