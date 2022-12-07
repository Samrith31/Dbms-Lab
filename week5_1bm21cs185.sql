create database employee_Samrith;
use employee_Samrith;

create table Department(
Dept_no int,
D_name varchar(20),
Dloc varchar(10),
primary key (dept_no));

select * from Department;
create table project(
p_no int,
ploc varchar(20),
p_name varchar(20),
primary key (p_no));

select *from project;


create table employee(
empno int,
ename varchar(20),
Mgr_no int,
Hiredate date,
Sal int,
Dept_no int,
primary key (empno),
foreign key (Dept_no) references Department (Dept_no));

select * from employee;

create table incentives(
empno int,
incentive_Date date,
incentive_Amount int,
primary key (empno,incentive_Date),
foreign key (empno) references employee(empno));

select * from incentives;

create table assignedto(
empno int,
p_no int,
job_role varchar(20),
primary key(empno,p_no),
foreign key(empno) references employee(empno),
foreign key(p_no) references project(p_no));

select * from assignedto;

insert into Department values(1,'Finance','Bangalore');
insert into Department values(2,'WebDesign','Chennai');
insert into Department values(3,'AppDevelopment','Bangalore');
insert into Department values(4,'CustomerService','Mumbai');
insert into Department values(6,'Marketing','Mysuru');

select * from Department;

insert into project values(01,'Bangalore','Bridgebuild_project');
insert into project values(02,'chennai','AI_Project');
insert into project values(03,'Mumbai','MultiServer_project');
insert into project values(04,'delhi','MultiNetwork_project');
insert into project values(05,'Bangalore','cybercrimecontrol');

select * from project;

insert into employee values(111,'Samrith',1001,'2022-10-09',56000,1);
insert into employee values(112,'Mrudhula',1002,'2022-10-09',36000,1);
insert into employee values(113,'Ajith',1003,'2022-10-09',67000,3);
insert into employee values(114,'Sanjay',1004,'2022-10-09',70000,4);
insert into employee values(115,'Nikitha',1005,'2022-10-09',66000,5);
insert into employee values(116,'Yuvan',1006,'2022-10-09',98000,5);

select * from employee;

insert into assignedto values(111,01,'WebDesign');
insert into assignedto values(112,02,'AppDevelopment');
insert into assignedto values(113,03,'Marketing');
insert into assignedto values(114,04,'CustomerService');
insert into assignedto values(115,05,'Finance');

select *  from assignedto ;

insert into incentives values(111,'2022-10-01',5000);
insert into incentives values(112,'2022-10-02',6000);
insert into incentives values(113,'2022-10-03',7000);
insert into incentives values(114,'2022-10-04',8000);
insert into incentives values(115,'2022-10-05',9000);
select *  from incentives ;


select a.empno
from assignedto a, project p
where a.p_no = p.p_no and p.ploc in ('Hyderabad','Mysuru','Bangalore');



select e.empno
from employee e
where e.empno not in (select empno from incentives);

select e.ename, e.empno, d.D_name, a.job_role, d.Dloc, p.ploc
from department d, employee e, assignedto a, project p
where e.empno = a.empno and a.p_no = p.p_no and e.dept_no = d.dept_no and d.dloc = p.ploc;