create table students(
stdid INT generated always as identity,
fname varchar(20) not null,
lname varchar(20) not null,
primary key(stdid)
);


create table students_track(
trid INT generated always as identity,
stdid int not null,
lname varchar(20) not null,
changed_on timestamp(5) not null
);


create or replace function track_lname_change()
returns trigger
language plpgsql
as $$
begin
if new.lname<>old.lname then
insert into students_track(stdid, lname,changed_on)
values(old.stdid,old.lname,now());
end if;
return new;
end$$
;


create trigger lname_change
before update
on students
for each row
execute procedure track_lname_change();


update students
set lname= 'c'
where stdid=2;


select * from students_track;
 