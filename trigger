1> create trigger afterinsert on Employee
2> for insert
3> as
4> declare @empid int;
5> declare @empname varchar(20);
6> declare @empsal decimal(10,2);
7> declare @changes_made varchar(50);
8> select @empid = i.empid from insert i;
9> select @empname = i.empname from insert i;
10> select @empsal = i.empsal from insert i;
11> set @changes_made ='insert a record after insert event';
12> insert into Employee
13> (empid,empname,empsal,changes_made,changes_timestamp)
14> values(@empid, @empname, @empsal, @changes_made,getdate());
15> print 'after insert trigger invoked'
16> go
