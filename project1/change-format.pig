A = load '/home/cloudera/rakesh/project1/customers.txt' using PigStorage('\t');
store A into '/home/cloudera/rakesh/project1/customers.pipe' using PigStorage('|');
