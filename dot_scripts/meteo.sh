curl -s "https://wttr.in/Nancy?Q2&lang=fr" | sed '1,5d' | sed -e :a -e '$d;N;2,2ba' -e 'P;D'
