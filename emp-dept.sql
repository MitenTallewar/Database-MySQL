create database empdb;

use empdb;

create table Department(
	id int not null primary key,
    dept_name varchar(40)
);

create table Employee(
	id int not null primary key,
    emp_name varchar(60),
    emp_age int,
    emp_salary double,
    dept_id int,
    foreign key(dept_id) references Department(id)
);

insert into department (id,dept_name) values (1,'Engineering'),
											 (2,'Production'),
                                             (3,'QA'),
                                             (4,'HR');
                                             
insert into employee (id,emp_name,emp_age,emp_salary,dept_id) values(1,'Holmes',28,60000,1),
																	(2,'Micheal',29,65000,1),
                                                                    (3,'Albert',38,130000,1),
                                                                    (4,'Ravindran',22,30000,1),
                                                                    (5,'Stuart',25,45000,2),
                                                                    (6,'Sasikant',48,160000,2),
                                                                    (7,'Ramanathan',32,70000,2),
                                                                    (8,'Avinash',40,135000,2),
                                                                    (9,'Karl',37,120000,2),
                                                                    (10,'Ramesh',30,75000,2),
                                                                    (11,'Venkatpati',21,45000,2),
                                                                    (12,'Sundariya',33,71000,2),
                                                                    (13,'Karolina',41,70000,2),
                                                                    (14,'Charles',37,78000,2),
                                                                    (15,'Martin',37,78000,3),
                                                                    (16,'paul',37,78000,3),
                                                                    (17,'Charlie',37,78000,3),
                                                                    (18,'Will',37,78000,3),
                                                                    (19,'Jonathan',37,78000,3),
                                                                    (20,'Chris',37,78000,4),
                                                                    (21,'Robert',37,78000,4);
																
select * from Employee;
select d.dept_name,count(d.id)
from employee e
inner join department d on d.id = e.dept_id
group by (dept_name);

select e.emp_name,max(e.emp_salary), d.dept_name
from employee e
inner join department d on d.id = e.dept_id
group by d.dept_name;



                                                                    