-- drop table
drop table CustTransaction;

-- creating table
create external table CustTransaction
(
cid int,
cname string,
cemail string,
oid int,
oddate string,
oprice float
) row format delimited fields terminated by '|'
location '/user/cloudera/Project/CustTransaction';

describe CustTransaction;
-- describe extended CustTransaction;
