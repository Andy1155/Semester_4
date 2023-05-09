create database prac5;
use prac5;

create table suppliers(SNo int primary key,
 Sname varchar(20), status int, SCity varchar(20));
create table parts(pno int primary key, pname varchar(20),
 color varchar(20), weight int, city varchar(20));
create table project(jno int primary key,
 jname varchar(20), jcity varchar(20));
create table shipment(sno int, pno int, jno int, quantity int,
 foreign key(sno) references suppliers(sno), 
 foreign key(pno) references parts(pno),
 foreign key(jno) references project(jno));

 
insert into suppliers values(1, 's1', 30, 'paris');
insert into suppliers values(2, 's2', 45, 'paris');
insert into suppliers values(3, 's3', 10, 'delhi');
insert into suppliers values(4, 's4', 60, 'delhi');
insert into suppliers values(5, 's5', 20, 'london');

insert into parts values(1, 'p1', 'red', 20, 'delhi');
insert into parts values(2, 'p2', 'blue', 25, 'paris');
insert into parts values(3, 'p3', 'red', 10, null);
insert into parts values(4, 'p4', 'green', 25, 'beijing');
insert into parts values(5, 'p5', 'blue', 5, 'ulaanbaatar');
insert into parts values(10, 'p1', 'red', 20, 'delhi');

insert into project values(1, 'j1', 'ulaanbaatar');
insert into project values(2, 'j2', 'delhi');
insert into project values(3, 'j3', 'london');
insert into project values(4, 'j4', 'ulaanbaatar');
insert into project values(5, 'j5', 'beijing');
insert into project values(6, 'j6', 'delhi');

insert into shipment values(1, 2, 4, 500);
insert into shipment values(2, 1, 3, 200);
insert into shipment values(3, 3, 1, 1500);
insert into shipment values(3, 2, 6, 300);
insert into shipment values(5, 4, 2, 500);
insert into shipment values(5, 5, 4, 1200);
insert into shipment values(1, 1, 3, 210);

select sno from suppliers where scity='paris' and status>20;

select sno, sname, status, scity from suppliers 
 inner join (parts inner join shipment using(pno))
 using(sno) where pname = 'p2'
 order by sno;
select sname from suppliers 
 where sno not in (select sno from suppliers
 inner join (parts inner join shipment using(pno))
 using(sno) where pname = 'p2');
 
select sno, pno, jno, quantity, weight*quantity as total_weight
 from shipment inner join parts using(pno);
 
select * from shipment where quantity between 300 and 750;

select distinct pno from parts
 inner join (suppliers inner join shipment using(sno))
 using(pno) 
 where (weight>16 or sname = 's2');

-- h problem is to select citys has more than 5 red parts
select city, count(city) as number_of_red from parts
 where color = 'red' group by city having count(city)>=2 ;
-- h
select * from parts;
select scity, pno, pname, color, weight, city from parts join (suppliers join shipment
 using(sno)) using(pno)
 where scity = 'london';

select pno from parts join(
 suppliers join (project
  join shipment using(jno)) using(sno)) 
 using(pno) 
 where scity = 'london' and jcity = 'london';
 
select count(jno) from shipment join suppliers using(sno) 
 where sname='s1'
 group by jno;
 
select sum(quantity) 
 from (shipment join suppliers using(sno)) join parts using(pno)
 where sname = 's1' and pname = 'p1';