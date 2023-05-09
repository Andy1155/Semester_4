create database laborlist;
use laborlist;
create table employee(person_name varchar(20) primary key, 
 street varchar(20), 
 city varchar(20));
create table company(company_name varchar(20) primary key,
 city varchar(20));
create table works(person_name varchar(20) references employee(person_name),
 company_name varchar(20) references company(company_name),
 salary int);
create table manages(person_name varchar(20), 
 manager_name varchar(20),
 foreign key(person_name) references employee(person_name),
 foreign key(manager_name) references employee(person_name)
);
 
insert into employee values('p1', 's1', 'c1');
insert into employee values('p2', 's3', 'c1');
insert into employee values('p3', 's1', 'c2');
insert into employee values('p4', 's2', 'c3');
insert into employee values('p5', 's4', 'c4');
insert into employee values('p6', 's5', 'c2');

insert into company values('Andy\'s edu', 'c1');
insert into company values('AP', 'c1');
insert into company values('XacBank', 'c2');
insert into company values('toktok', 'c3');
insert into company values('BBB', 'c1');
insert into company values('SambaBank', 'c3');
insert into company values('NCB Bank', 'c2');

alter table works add constraint foreign key(company_name) references company(company_name);

insert into works values('p1', 'SambaBank', 11000);
insert into works values('p1', 'NCB Bank', 13000);
insert into works values('p2', 'SambaBank', 5000);
insert into works values('p3', 'Andy\'s edu', 30000);
insert into works values('p1', 'AP', 15000);
insert into works values('p4', 'toktok', 9000);
insert into works values('p5', 'BBB', null);
insert into works values('p6', null, 99000);

insert into manages values('p1', 'p6');
insert into manages values('p2', 'p6');
insert into manages values('p3', 'p2');
insert into manages values('p4', 'p6');
insert into manages values('p5', null);
insert into manages values('p6', null);

alter table employee add column email varchar(20);

select works0.person_name from works as works0,works as works1, manages
where works0.company_name = "SambaBank" and
 works1.company_name = "NCB Bank" and works0.person_name = works1.person_name 
 and manages.manager_name = works0.person_name;
 
select * from employee inner join works using(person_name)
 where company_name='SambaBank' and salary > 10000;
 
select employee.person_name from employee, works, company
 where employee.person_name = works.person_name
 and works.company_name = company.company_name 
 and employee.city = company.city;
 
select company_name, max(salary), min(salary), avg(salary) 
 from works group by company_name;
 
select company_name, sum(salary), count(company_name) as employees 
 from works where company_name is not null
 group by company_name;
 
select company_name, salary from works
 where salary = (select max(salary) from works where company_name is not null);