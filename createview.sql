create view emp_info
as
select d.did,d.budget,e.ename
from dept d,emp e
where d.managerId=e.eid

update emp_info
set budget=9500000
where did='Academic'


 Create view Emp_information
 as 
 select e.eid,e.ename,e.salary,sum(w.pct_time) as total_percentage_time
 from emp e,works w
 where e.eid=w.eid
 group by e.eid,e.ename,e.salary

select * from Emp_information

--We can't update aggregation values in update --
--advantage view is--
--1.maintain security--
--2.query simplicity--

--disadvantage of view --
--1.this is take time to compiling 
