drop table if exists year1999;
drop table if exists year2000;
drop table if exists year2001;

show tables;

create external table year1999 like CustTransaction location '/user/cloudera/Project/year1999';
create external table year2000 like CustTransaction location '/user/cloudera/Project/year2000';
create external table year2001 like CustTransaction location '/user/cloudera/Project/year2001';

insert overwrite table year1999 select * from CustTransaction where oddate like '%1999';
insert overwrite table year2000 select * from CustTransaction where oddate like '%2000';
insert overwrite table year2001 select * from CustTransaction where oddate like '%2001';

show tables 'year*';
