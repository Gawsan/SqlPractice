create function getEmpcunt(@did varchar(15))returns int
as
begin
declare @cnt int 
select @cnt=count(*)
from works
where did=@did
return @cnt
end
declare @out int
exec @out=getEmpcunt 'admin'
print @out

create function totalWorkHours(@eid int)returns int
as 
begin
declare @total int
select @total=sum(pct_time)
from works
where eid=@eid
return @total
end

declare @time int
exec @time=totalWorkHours 1000
print @time

create procedure bonusSalary(@pct int)
as 
begin
update emp 
set salary=salary+salary*@pct/100
end

exec bonusSalary 10


create procedure get_sats(@did varchar(12),@maxm real output,@minm real output)
as 
begin
select @maxm=max(e.salary),@minm=min(e.salary)
from works w,emp e
where w.eid=e.eid and w.did=@did
--group by e.salary
end


declare @max int,@min int
exec get_sats 'Admin' ,@max output,@min output
print @max
print @min


create procedure getmanagerName(@did varchar(15),@name varchar(100) output ,@salary real output)
as
begin
select @name=e.ename,@salary=e.salary
from emp e,dept d
where e.eid=d.managerId and d.did=@did
end

drop procedure getmanagerName

declare @nam varchar(100),@sal real
exec  getmanagerName 'Admin' ,@nam output,@sal output
print @nam
print @sal




select * from dept
select * from emp





