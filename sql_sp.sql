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


CREATE PROCEDURE Delete_productbyID   
@pid int  
AS  
BEGIN  
SET NOCOUNT ON;  
Delete from product
where pid = @pid  
END  
GO  


Create PROCEDURE usingexists_sp    
(    
      @pname VARCHAR(30)    
)    
AS    
DECLARE @ResultValue int    
BEGIN TRAN    
IF EXISTS    
    (    
          SELECT * FROM product    
          WHERE pname = @pname    
        )    
     BEGIN    
         SET  @ResultValue = -2    
     END    
ELSE    
      BEGIN    
           INSERT INTO product  
               (    
                   pname  
               )    
           VALUES    
           (    
                 @pname    
           )    
           set @ResultValue = @@ERROR    
     END    
IF @ResultValue <> 0    
     BEGIN    
            ROLLBACK TRAN    
      END    
ELSE    
      BEGIN    
            COMMIT TRAN    
      END    
RETURN @ResultValue    



