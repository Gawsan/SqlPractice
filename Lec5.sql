create view emp_info
as
select d.did,d.budget,e.ename
from dept d,emp e
where d.managerId=e.eid

update emp_info
set budget=9500000
where did='Academic'

