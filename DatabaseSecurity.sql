create login gawsan
with password ='gawsan',
default_database=master,default_language=us_english;

--fix permisson using fix saver roles--
alter server role dbcreator add member gawsan
alter server role securityadmin add member gawsan

--Remove the server role--
alter server role dbcreator drop member gawsan
alter server role securityadmin drop member gawsan

--user define server level
create server role seniorDBA
grant create any database ,alter any database,alter any login to SeniorDBA
alter server role seniorDBA add member gawsan

--create login for danu--
create login Danu
with password='danu',
default_database=master,default_language=us_english;

--create login for abi--
create login abi
with password='abi',
default_database=master,default_language=us_english;

