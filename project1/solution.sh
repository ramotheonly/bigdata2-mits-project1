clear
echo '========== BIG DATA Project solution by Rakesh Mohan ========='
echo '==========  START: RAW Customer File (customers.txt)  ========='
cat customers.txt
echo '========================================'
echo 'Next Step: make file PIPE delimited (ENTER to continue)'
read $dummy
echo 'Executing change-format.sh (using sed): (please wait) ...'
./change_format.sh > customers.pipe
echo '==========  STEP 1: Pipe delimited Customer File (customers.pipe)  ========='
cat customers.pipe
echo '========================================'
echo 'COUNT(# Records) = '`cat customers.pipe | wc -l`
echo '========================================'
echo 'Next Step: Sanitize the data file - Dedup, Remove Blanks & Count (ENTER to continue)'
read $dummy
echo 'Executing solution2.pig: (please wait) ...'
pig -x local -f solution2.pig 1>nul 2>solution2.log
echo '==========  STEP 2: Sanitized data file (clean/customers)  ========='
cat clean/customers/*
echo '========================================'
echo 'COUNT(# Records) = '`cat output/cust_count/*`
echo '========================================'
#pig -x local -f solution3.pig 1>nul
echo 'Next Step: Count of unique customers with orders (ENTER to continue)'
read $dummy
echo 'Executing solution3.pig: (please wait) ...'
pig -x local -f solution3.pig 1>nul 2>solution3.log
echo '==========  STEP 3: Unique Customers with Orders  ========='
#cat output/customer-emails/*
echo '========================================'
echo 'COUNT(# Records) = '`cat output/cust_with_orders_count/*`
echo '========================================'
echo 'Next Step: Unique customers with correct email address (ENTER to continue)'
read $dummy
echo 'Executing solution4.pig: (please wait) ...'
pig -x local -f solution4.pig 1>nul 2>solution4.log
echo '==========  STEP 4: Customers with good email addresses  ========='
cat output/customer-emails/*
echo '========================================'
echo 'COUNT(# Records) = '`cat output/cust_with_emails_count/*`
echo '========================================'
echo 'Next Step: Customer Orders JOIN (ENTER to continue)'
read $dummy
echo 'Executing solution5.pig: (please wait) ...'
pig -x local -f solution5.pig 2>solution5.log
echo '==========  STEP 5: Customer Orders JOIN  ========='
cat output/customer-orders/*
echo '========================================'
echo 'COUNT(# Records) = '`cat output/customer-orders-count/*`
echo '========================================'
./solution6.sh
echo 'Next Step: Move file to HDFS, create Hive table and query (ENTER to continue)'
read $dummy
./solution7.sh
