create index idx_person_name on person (upper(name));

SET ENABLE_SEQSCAN TO off;

explain analyze select name
from person
where upper(name) = 'KATE';