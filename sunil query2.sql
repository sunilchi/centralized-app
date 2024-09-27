create table dbo.temp (id int, name varchar(10))

insert into dbo.temp values (1,'sunil')

Begin Tran
Truncate table dbo.temp
Rollback Tran

select * from dbo.temp

delete from dbo.temp

drop table dbo.test

create table dbo.test (id int)

insert into dbo.test values (1)
insert into dbo.test values (1)
insert into dbo.test values (1)
insert into dbo.test values (2)
insert into dbo.test values (2)
insert into dbo.test values (3)
insert into dbo.test values (4)


create table dbo.test1 (id int)

insert into dbo.test1 values (1)
insert into dbo.test1 values (1)
insert into dbo.test1 values (2)
insert into dbo.test1 values (3)
insert into dbo.test1 values (4)
insert into dbo.test1 values (5)
insert into dbo.test1 values (5)
insert into dbo.test1 values (6)
insert into dbo.test1 values (7)

select * from dbo.test1
select * from dbo.test

select a.id ,b.id from dbo.test a right join dbo.test1 b on a.id = b.id where a.id is null

 exec sp_who2

 dbcc inputbuffer (69)
 dbcc indexdfrag ('sunilc','dbo.test')

 dbcc useroptions

 select nullif(17,25)

select isnull(null,0)

select * from test1 a
full outer join
 test b ON a.id = b.id
 select @@SPID
 exec sp_who2

 dbcc inputbuffer (48)

 