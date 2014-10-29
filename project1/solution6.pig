ords = load '/home/cloudera/rakesh/project1/output/customer-orders' using PigStorage('|') as (cid:int, cname:chararray, cemail:chararray, oid:int, oddate:chararray, oprice:float);
--describe ords;

fltrd = FILTER ords BY cid == $cid;
dump fltrd;
