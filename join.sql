use schooldb;
drop database schooldb;
create database schooldb;
use schooldb;

create table class(
	classId int not null primary key,
    className varchar(20),
    sections varchar(20)
);

create table Users(
	userId int Not null Primary key,
    First_name varchar(30),
    Last_name varchar(30),
    usertype varchar(20),
    class_id int,
    Foreign key (class_id) references class(classId)
);


create table Subjects (
	subjectId int not null primary key,
    SubjectName varchar(50),
    subject_teacher_id int,
    foreign key(subject_teacher_id) references users(userID)
);

create table Marks(
	marks_id int not null primary key,
    student_id int,
    subject_id int,
    total_marks double,
	foreign key(student_id) references users(userId),
    foreign key(subject_id) references subjects(subjectId)
);
select * from users;

select * from class;
select * from users where class_id=4 and usertype ='student';

select c.className, count(u.userId)
from users u
inner join class c on c.classId = u.class_Id 
where usertype ='student'
group by c.className;


select * from users order by Last_Name DESC;

select count(u.userId)
from users u
inner join class c on c.classId = u.class_Id 
where usertype ='student' and className = 'VI(six)';

select u.userId, u.First_Name, u.Last_Name, c.className, c.sections
from Users u
inner join class c on c.classId = u.class_id
where u.usertype='teacher' and c.className= 'VII(Seven)' and c.sections ='A'; 

select * from users where usertype = 'student' and class_id =5;

select u.First_name, u.Last_name
from subjects s
inner join users u on u.userID = s.Subject_teacher_Id 
where subjectName='Maths';

select * from users where usertype = 'student';
desc marks;
desc subjects;

select * from users;
select * from marks;
update marks set student_id= 10 where marks_id = 20;

insert into marks values(35,12,5,41);

select u.first_Name,u.Last_name,c.className,c.sections,m.subject_id,m.subject_marks
from Users u
inner join class c on c.classId = u.class_id
inner join marks m on m.student_id = u.userID
where u.usertype = 'student' and c.className = 'V(Five)' and sections = 'A';


