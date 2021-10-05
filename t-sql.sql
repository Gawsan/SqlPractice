--sever side logic--

declare @eid int
set @eid=1000
declare @sal real
select @sal=salary from emp where eid=@eid
print @sal

declare @sal real
select @sal=salary from emp 
if(@sal>50000)
begin
print 'Inside the if condition '
print 'salary greateer than 50000'
end
else 
print 'salary is less than or equal 50000'

