A = load '/home/cloudera/rakesh/project1/customers.pipe' using PigStorage('|');

--Using PIG eliminate empty rows
A = distinct A;
--Using PIG eliminate duplicate data
A = filter A by $0 is not null;

rmf /home/cloudera/rakesh/project1/clean/customers

store A into '/home/cloudera/rakesh/project1/clean/customers' using PigStorage('|');

-- READ the Sanitized Data

cust1 = load '/home/cloudera/rakesh/project1/clean/customers' using PigStorage('|');
--dump cust1;

--1) GET CUSTOMER RECORD COUNT
cust_grp1 = group cust1 all;
--desc cust_grp1;

cust_count1 = foreach cust_grp1 generate COUNT(cust1);
--dump cust_count1;

rmf /home/cloudera/rakesh/project1/output/cust_count;
store cust_count1 into '/home/cloudera/rakesh/project1/output/cust_count';

