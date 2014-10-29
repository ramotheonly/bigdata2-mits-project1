echo 'Next Step: Query Orders for Customer ID'
custid=""
while [ "$custid" != "q" -a "$custid" != "Q" ]
do
	echo 'Enter a Customer ID ("q" to quit):'
	read custid
	if [ "$custid" != "q" -a "$custid" != "Q" -a "$custid" != "" ]
	then
	  echo 'executing solution6.pig, please wait ...';
	  pig -x local -param cid=$custid solution6.pig 2>solution6.log
	fi
done


