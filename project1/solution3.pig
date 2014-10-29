trans = load '/home/cloudera/rakesh/project1/transactions.txt' using PigStorage('\t') as (cid:int, oid:int, odate:chararray, amount:float);
--describe trans;
--dump trans;

trans_custs = foreach trans GENERATE cid;
--dump trans_custs;

distinct_custs = DISTINCT trans_custs;
--dump distinct_custs;

--2) GET UNIQUE CUSTOMER COUNT
cust_grp = group distinct_custs all;
describe cust_grp;

cust_count = foreach cust_grp generate COUNT(distinct_custs);
--dump cust_count;

rmf /home/cloudera/rakesh/project1/output/cust_with_orders_count;
store cust_count into '/home/cloudera/rakesh/project1/output/cust_with_orders_count'; 
