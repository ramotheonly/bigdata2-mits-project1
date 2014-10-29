cust = load '/home/cloudera/rakesh/project1/clean/customers' using PigStorage('|') as (id:int, name:chararray, email:chararray);
--describe cust;
--cust_flt = FILTER cust BY (email matches 'w+@w+.w+');
cust_flt = FILTER cust BY (email matches '^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z]{2,})$');
--dump cust_flt;
--describe cust_flt;
rmf /home/cloudera/rakesh/project1/output/customer-emails;
store cust_flt into '/home/cloudera/rakesh/project1/output/customer-emails' using PigStorage('|'); 

--2) GET UNIQUE CUSTOMER COUNT
cust_grp = group cust_flt all;
--desc cust_grp;

cust_count = foreach cust_grp generate COUNT(cust_flt);
--dump cust_count;

rmf /home/cloudera/rakesh/project1/output/cust_with_emails_count;
store cust_count into '/home/cloudera/rakesh/project1/output/cust_with_emails_count'; 
--dump cust;
