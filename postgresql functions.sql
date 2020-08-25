create function calculations(IN x int, IN y int, OUT sum int, OUT sub int, OUT mul BIGINT, OUT div float)
as $$
begin
sum = x+y;
sub = x-y;
mul = x*y;
div = X/y;
end;
$$ language  plpgsql;

select * from calculations(3,3);
 



create or replace function totalrecords()
returns integer as $total$
declare
total integer;
begin
select count(*) into total from sample;
return total;
end;
$total$ language plpgsql;

select * from totalrecords();
 
select * from sample;
 

