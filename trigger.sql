create trigger test
--view or table name--
on emp
--we can use for ,instead of and after 
for insert ,update ,delete 
as 
begin
--trigger body---
 
end

create table Account(
id int not null identity(1,1) ,
accountNo int primary key,
balance real,
date date)



create table AccountLog(
id int not null identity(1,1),
accountNo int,
date date,
balance real,
FOREIGN KEY (accountNo) REFERENCES Account(accountNo))


create trigger addLogEntery
on Account
instead of insert,update
as 
begin
declare @acno int,@balance real
select @acno=accountNo,@balance=balance
from inserted
insert into AccountLog(accountNo,balance,date)values(@acno,@balance,getdate())
end

drop trigger addLogentery

insert into account (accountNo,balance,date) values(1002,75000,'2020-10-03')
select * from accountlog
select * from account

update account 
set balance=850000
where id=1

create trigger CheckDepartmentNum
on works
for insert,update
as 
begin
declare @eid int
declare @total int 
select @eid=eid from inserted
select @total=count(*) from works where eid=@eid
if @total>2
begin
print 'You cannot work more than 2 department'
rollback transaction
end
end

insert into works values(1000,'Academic',20)

delete from works
where eid=1000 and did='Academic'

drop trigger CheckDepartmentNum
select * from works

create trigger DurationCheck
on works
for insert,update
as
begin
declare @total int ,@eid int
select @eid=eid from inserted
select @total=sum(pct_time) from works where eid=@eid
if @total>100
begin	
	print 'You can not work more than 100 hours'
	rollback transaction
end
end


--Check the trigger--
update works
set pct_time=100
where eid=1000 and did='Admin'



create table CustomerActivity(
tid int not null identity(1,1) primary key,
accountNo int,
type varchar(20),
amount real,
date date,
Constraint Fk_trasaction foreign key (accountNo) references account(accountNo)
)


create trigger limitWithdraw
on CustomerActivity
for insert,update
as
begin
declare @accno int,@date date,@total real
select @accno=accountNo, @date=date from inserted 
select  @total=sum(amount) from CustomerActivity where accountNo=@accno and date=@date and type='debit'
if(@total>40000)
begin
	print 'Your withdrawal limit reached 40000 you cannot withdraw money '
	rollback transaction
end
end

--check trigger--
insert into CustomerActivity(accountno,type,amount,date) values(1002,'debit',25000,getdate())

--create employee table--



create table Department(
dno int primary key,
dname varchar(20) ,
mgrNic varchar(12))

create table Employee(
nic varchar(12) primary key,
name varchar(50),
salary real,
dno int,
Constraint Fk_Employee_Department foreign key (dno) references department(dno))


Alter table Department
Add constraint Fk_Department_Employee foreign key(mgrnic) references Employee(Nic)

--check salary trigger--

create trigger CheckSalary
on Employee
for insert,update
as
begin
declare @dno int,@salary real,@mgrsal real
select @dno=dno,@salary=salary from inserted 
select @mgrsal=e.salary from employee e,Department d where d.dno=e.dno and d.mgrnic=e.nic
if @salary>@mgrsal
begin
print 'Salary exceed from managers salary'
rollback transaction
end
end
insert into employee(nic,name,salary) values('9811222257v','gawsan',75000)
insert into department (dno,dname,mgrnic) values(1111,'Admin','9811222257v')

insert into employee values('9811222427v','danu',65000,1111)

--check the trigger--
insert into employee values('9811222418v','Ak',85000,1111)


