create table country(
	id int primary key,
    country_name varchar(20)
);

create table state(
	id int primary key,
    state_name varchar(20),
	country_id int,
    foreign key(country_id) references country(id)
);

create table city(
	id int primary key,
    city_name varchar(20),
    state_id int,
    foreign key(state_id) references state(id)
);

create table customer(
	id int primary key,
    cust_name varchar(20),
    city_id int,
    foreign key (city_id) references city(id)
);

insert into country (id,country_name) values(1,'India'),(2,'America');
select * from country;
insert into state(id,state_name,country_id) values(1,'Gujarat',1),
													(2,'Maharashtra',1),
                                                    (3,'New York',2),
                                                    (4,'California',2);
select * from state;
insert into city(id,city_name,state_id) values(1,'Surat',1),
													(2,'Ahmedabad',1),
                                                    (3,'Mumbai',2),
                                                    (4,'Pune',2),
                                                    (5,'New York City',3),
                                                    (6,'New Jersey',3),
                                                    (7,'San Francisco',4),
                                                    (8,'Los Angeles',4);
select * from city;

insert into customer (id,cust_name,city_id) values (1,'miten',1),(2,'pranav',1),
												   (3,'Jay',2),(4,'pooja',2),
												   (5,'Ramesh',3),(6,'Suresh',3),
												   (7,'Ajay',4),(8,'Vijay',4),
 												   (9,'jayesh',5),(10,'jignesh',5),
												   (11,'Hitesh',6),(12,'Mitesh',6),
												   (13,'John',7),(14,'Ron',7),
												   (15,'jack',8),(16,'Paul',8);
                                            
select * from customer;

select c.country_name,count(cm.id)
from country c
inner join state s on s.country_id = c.id
inner join city ct on ct.state_id = s.id 
inner join customer cm on cm.city_id = ct.id
group by country_name;

select cm.cust_name,ct.city_name,s.state_name,c.country_name
from country c
inner join state s on s.country_id = c.id
inner join city ct on ct.state_id = s.id 
inner join customer cm on cm.city_id = ct.id;


select c.country_name, count(ct.city_name)
from country c
inner join state s on s.country_id = c.id
inner join city ct on ct.state_id = s.id 
group by c.country_name;

select c.country_name, count(s.id)
from country c
inner join state s on s.country_id = c.id
group by c.country_name;
