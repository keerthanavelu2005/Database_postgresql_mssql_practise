create procedure get_product_desc
as
begin
set nocount on
select p.pid,p.pname,pd.p_description from
product p
inner join product_description pd on p.pid=pd.pid
end
go



create procedure product_description_withpara
(@pid int)
as 
begin
set nocount on
select p.pid,p.pname,pd.p_description from
product p
inner join product_description pd on p.pid=pd.pid
where p.pid=@pid
end
go

exec product_description_withpara 102
go

create procedure updateproduct
@pid int,
@pname varchar(50)
as
begin
set nocount on;
update product
set pname = @pname
where pid = @pid
end
go


declare @returnvalue int
exec @returnvalue = updateproduct
@pid = 102,
@pname = 'lays'
select 'return value' = @returnvalue
go

