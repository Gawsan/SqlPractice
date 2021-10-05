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
id int not null identity(1,1),
accountNo int primary key,
balance real,
A_date date)

insert into Account(accountNo,balance,A_date) values(1001,250000,'2021-04-21'),
(1002,75000,'2021-04-21'),(1003,70000,'2021-04-21')

create table AccountLog(
id int not null identity(1,1),
accountNo int,
balance real,
date date,
FOREIGN KEY (accountNo) REFERENCES Account(accountNo))


create trigger addLogEntery
on Account
for insert,update
as 
begin
declare @acno int,@balance real
select @acno=accountNo,@balance=balance
from inserted
insert into AccountLog(accountNo,balance,date)values(@acno,@balance,getdate())
end

insert into Account(accountNo,balance,A_date) values(1004,250000,'2021-04-21')

--instead of key word doesen't change the base table --







