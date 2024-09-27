create table dbo.student(studentid int,studentname varchar(100),studentclass int)
insert into dbo.student values (1002,'Rahul',9)
insert into dbo.student values (1006,'Jyothi',9)
insert into dbo.student values (1010,'Natasha',9)

select * from dbo.student

create table dbo.scorecard (scorecardid int, studentid int,Quarter1 varchar(10),Engllish int,Maths int,Science int , Total int)
insert into dbo.scorecard values (100,1002,'Q1',99,86,88,273)
insert into dbo.scorecard values (101,1006,'Q1',86,89,90,274)
insert into dbo.scorecard values (102,1010,'Q1',90,99,98,287)
insert into dbo.scorecard values (103,1002,'Q2',78,88,65,231)
insert into dbo.scorecard values (104,1006,'Q2',90,99,98,287)
insert into dbo.scorecard values (105,1010,'Q2',88,96,90,274)

select * from dbo.scorecard

select studentname from dbo.student

select max(total) from dbo.scorecard where Quarter1 = 'Q2'

select studentname from dbo.student a where  exists (select max(total) from dbo.scorecard b where a.studentid = b.studentid and Quarter1 = 'Q2' and scorecardid = 104)

select studentname  from 
(select max(total)as maxtotal from dbo.scorecard  where  Quarter1 = 'Q2') sub
inner join scorecard a ON a.Total = sub.maxtotal
inner join student b ON a.studentid = b.studentid 
where  Quarter1 = 'Q2'


select studentname  from 
(select total ,studentid ,ROW_NUMBER () over (order by total desc) as Rankid from dbo.scorecard   where  Quarter1 = 'Q2') sub
INNER JOIN student a ON a.studentid  = sub.studentid
where rankid =1

select charindex ('sunil','S')

SELECT CHARINDEX('t', 'Customer') AS MatchPosition;

SELECT ISNULL(NULL, 'W3Schools.com');

select isnull (null,0)


create table dbo.Emp (id int,name varchar(10) ,salary int)

insert into dbo.Emp values (1,'sunil',1000)
insert into dbo.Emp values (1,'sunil',1000)
insert into dbo.Emp values (2,'anil',2000)
insert into dbo.Emp values (2,'anil',2000)
insert into dbo.Emp values (3,'ram',3000)

select * from dbo.Emp

;with cte 
as
(select id,name,salary, row_number () over(partition by id order by salary) ranid from dbo.Emp )
select * from cte where ranid = 1

select name,salary
from
(
select id,name,salary, row_number () over(partition by id order by salary) ranid from dbo.Emp
)sub
where sub.ranid = 1


delete sub
from
(
select id,name,salary, row_number () over(partition by id order by salary) ranid from dbo.Emp
)sub
where sub.ranid > 1

select @@VERSION

select @@SERVERNAME

create table dbo.empsalary (name varchar(10), salary int)

create table dbo.empsalfinal (name varchar(10), salary int)


select * from dbo.empsalary
select * from dbo.empsalfinal



update dbo.empsalary
set
salary = 25000
where name = 'DEVA'

insert into dbo.empsalary values ('Hari',8000)

insert into dbo.empsalary values ('Shashi',9000)


create unique clustered index ix_id on dbo.empsalary (name)


UPDATE STATISTICS [dbo].[empsalary] ([ix_id]);  


UPDATE STATISTICS [dbo].[scorecard] ([_WA_Sys_00000002_37A5467C])


Merge dbo.empsalfinal t
using dbo.empsalary s
on t.name = s.name
when  matched then 
update set t.salary = s.salary,t.name = s.name
when not matched then
insert (name,salary) values (s.name,s.salary)
when not matched BY Source
Then Delete;


;with CTE_Recursive (n)
As
(select 1 
UNION ALL
Select n+1 from CTE_Recursive where n <= 10
)
select * from CTE_Recursive 


create table dbo.identitytb (id int identity (1,1),name varchar(10))

insert into dbo.identitytb values ('Gaurav')

insert into dbo.identitytb values ('Sunil')

insert into dbo.identitytb values ('Sam')

insert into dbo.identitytb values ('Deva')

select * from dbo.identitytb 

delete from dbo.identitytb 

insert into dbo.identitytb values ('Sanjay')
insert into dbo.identitytb values ('Dada')


Truncate Table dbo.identitytb 

---------------------------------------------------------


drop table dbo.primarykey1
create table dbo.primarykey1 (id int not null ,name varchar(10))

insert into dbo.primarykey1 values (2,'Sanjay')
insert into dbo.primarykey1 values (3,'Dada')

insert into dbo.primarykey1 values (1,'Gaurav')

insert into dbo.primarykey1 values (4,'Sunil')

insert into dbo.primarykey1 values (6,'Sam')

insert into dbo.primarykey1 values (5,'Deva')

select * from dbo.primarykey1

create unique clustered index ix_id on dbo.primarykey1 (id)

drop index ix_id on dbo.primarykey1

create  clustered index ix_id on dbo.primarykey1 (id)

Truncate table dbo.primarykey1

alter table dbo.primarykey1 ADD CONSTRAINT PK_ID PRIMARY KEY CLUSTERED (ID);

insert into dbo.primarykey1 values (null,'Deva')

----------------------------------------------------------


