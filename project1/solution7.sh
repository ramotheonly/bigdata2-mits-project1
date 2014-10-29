echo '******* Deleting HDFS/~/Project/CustTransaction'
hadoop fs -rmr Project/CustTransaction 2>solution7.log
echo '******* Copying customer-orders as HDFS/~/Project/CustTransaction'
hadoop fs -put output/customer-orders Project/CustTransaction 2>>solution7.log
echo '******* Creating Hive Table executing solution7.create.sql ... '
hive -f solution7.create.sql 2>>solution7.log
echo '******* Listing ALL Rows, executing sql, please wait ... '
hive -e 'select * from CustTransaction;' 2>>solution7.log
echo '******* Listing Purchase Amount by CustomerID, executing sql, please wait ... '
hive -e 'select cid, cname, cemail, sum(oprice) from CustTransaction group by cid, cname, cemail;' 2>>solution7.log


echo '******* Generating Yearly Data Tables, executing solution7.yearly.sql, please wait ... '
hive -f solution7.yearly.sql 2>>solution7.log
echo '******* Selecting year1999 data, executing sql, please wait ... '
hive -e 'select * from year1999;' 2>>solution7.log
echo '******* Selecting year2000 data, executing sql, please wait ... '
hive -e 'select * from year2000;' 2>>solution7.log
echo '******* Selecting year2001 data, executing sql, please wait ... '
hive -e 'select * from year2001;' 2>>solution7.log

echo '***** physical file for year1999 on HDFS'
hadoop fs -ls /user/cloudera/Project/year1999

echo '***** content of the physical file for year1999 on HDFS'
hadoop fs -cat /user/cloudera/Project/year1999/*
