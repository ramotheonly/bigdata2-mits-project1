cust = load '/home/cloudera/rakesh/project1/clean/customers' using PigStorage('|') as (id:int, name:chararray, email:chararray);
--describe cust;

trans = load '/home/cloudera/rakesh/project1/transactions.txt' using PigStorage('\t') as (cid:int, oid:int, oddate:chararray, oprice:float);

ctjoin = JOIN cust by id, trans by cid;

--dump ctjoin;
--describe ctjoin;

out = foreach ctjoin GENERATE cust::id as CID, cust::name as CNAME, cust::email as CEMAIL, trans::oid as OID, trans::oddate as ODDate, trans::oprice as OPrice;

--dump out;
rmf /home/cloudera/rakesh/project1/output/customer-orders;
store out into '/home/cloudera/rakesh/project1/output/customer-orders' using PigStorage('|'); 

describe out;

outgrp = GROUP out ALL;
outcount = foreach outgrp GENERATE COUNT($1);
--dump outcount; 
rmf /home/cloudera/rakesh/project1/output/customer-orders-count;
store outcount into '/home/cloudera/rakesh/project1/output/customer-orders-count' using PigStorage('|'); 
