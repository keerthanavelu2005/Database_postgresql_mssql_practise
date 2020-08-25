create table ticket_sales(
concert_id int not null PRIMARY KEY,
available boolean not null
 ) ;


create or replace procedure tickets(concert_id integer , available boolean)
language plpgsql
as $$
begin
insert into ticket_sales(concert_id, available)
values (concert_id , available);
end $$
 ;

select * from ticket_sales;
 

create table character_datatypes(
id serial primary key,
name char(10),
destination varchar(20),
message text
);


insert into character_datatypes(name, destination,message)
values('DD', 'software engineer', 'hii hello how are u? how was your day?');


select * from character_datatypes;
 

create table employee_sal(
name varchar(20),
paybyhalf integer[],
schedule text[][]
);


insert into employee_sal
values('keer', '{1000,1100,1200,1300,1400,1500}',
 '{{"meeting", "presentation"}, {"training", "end of speech"}}')
select * from employee_sal;




