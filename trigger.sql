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
id int ,
accountNo int primary key,
balance real,
A_date date)

insert into Account values(1,1001,250000,'2021-04-21'),
(2,1002,75000,'2021-04-21'),(3,1003,70000,'2021-04-21')

create table AccountLog(

accountNo int,
T_date date,
balance real,
FOREIGN KEY (accountNo) REFERENCES Account(accountNo))


create trigger addLogEntery
on Account
for insert,update
as 
begin
declare @acno int,@balance real
select @acno=accountNo,@balance=balance
from inserted
insert into AccountLog(accountNo,balance,T_date)values(@acno,@balance,getdate())
end

insert into Account values(1,1007,250000,'2021-04-21')


