1> create procedure get_product_desc
2> as
3> begin
4> set nocount on
5> select p.pid,p.pname,pd.p_description from
6> product p
7> inneer join product_description pd on p.pid=pd.pid
8> end
9> go

--------------------------------------------


> create procedure product_description_withpara
2> (@pid int)
3> as 
4> begin
5> set nocount on
6> select p.pid,p.pname,pd.p_description from
7> product p
8> inner join product_description pd on p.pid=pd.pid
9> where p.pid=@pid
10> end
11> go
1> exec product_description_withpara 102
2> go

---------------------------------------------------
1> create procedure updateproduct
2> @pid int,
3> @pname varchar(50)
4> as
5> begin
6> set nocount on;
7> update product
8> set pname = @pname
9> where pid = @pid
10> end
11> go


1> declare @returnvalue int
2> exec @returnvalue = updateproduct
3> @pid = 102,
4> @pname = 'lays'
5> select 'return value' = @returnvalue
6> go

