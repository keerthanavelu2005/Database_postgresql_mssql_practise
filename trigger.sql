create trigger afterinsert on Employee
for insert
as
declare @empid int;
declare @empname varchar(20);
declare @empsal decimal(10,2);
declare @changes_made varchar(50);
select @empid = i.empid from insert i;
select @empname = i.empname from insert i;
select @empsal = i.empsal from insert i;
set @changes_made ='insert a record after insert event';
insert into Employee
(empid,empname,empsal,changes_made,changes_timestamp)
values(@empid, @empname, @empsal, @changes_made,getdate());
print 'after insert trigger invoked'
go
