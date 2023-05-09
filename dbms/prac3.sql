create database bicycleshop;
use bicycleshop;
create table bicycle(bicycle_id varchar(20), date_purchased date,
 color varchar(20), cust_id varchar(20), model_no int,
 primary key(bicycle_id, cust_id));
desc bicycle;
create table customer(cust_id varchar(20) references bicycle(cust_id),
 email varchar(30),
 name varchar(20), phone int, referrer_id varchar(20));
desc customer;
create table bicycleModel(model_no int primary key, 
 manufacturer varchar(20), style varchar(20));
desc bicyclemodel;
alter table bicycle add constraint 
 foreign key(model_no) references bicyclemodel(model_no);
create table service(start_date date,
 bicycle_id varchar(20) references bicycle(bicycle_id),
 end_date date);
insert into bicyclemodel values(1, 'Honda', 'big');
insert into bicyclemodel values(2, 'Honda', 'small');
insert into bicyclemodel values(3, 'Shimano', 'racing');
insert into bicyclemodel values(4, 'Modun', 'casual');

insert into bicycle values('b1', '2022-12-31', 'red', 'c1', 3);
insert into bicycle values('b2', '2022-12-21', 'black', 'c2', 1);
insert into bicycle values('b3', '2022-12-31', 'white', 'c3', 2);
insert into bicycle values('b4', '2010-10-31', 'red', 'c4', 1);
insert into bicycle values('b5', '2000-05-03', 'white', 'c1', 3);

insert into service values('2000-01-01', 'b1','2024-10-10');
insert into service values('2022-10-10', 'b2','2023-01-10');
insert into service values('2023-01-01', 'b3','2024-02-11');
insert into service values(null, 'b4',null);
insert into service values('2023-01-30', 'b5','2024-02-11');
select * from service;
ALTER TABLE service
 ADD CONSTRAINT end_date_later_than_start_date_CK    
 CHECK (start_date <= end_date);
desc service;

insert into customer
 values('c1', 'c1@gmail.com', 'John Cena', 986543210, null);
insert into customer
 values('c2', 'c2@gmail.com', 'im 2', null, 'c1');
insert into customer
 values('c3', 'c3@gmail.com', 'antony', 858585858, 'c1');
insert into customer
 values('c4', null, 'John Cena', 70707070, 'c3');
select * from customer;

select * from bicycle inner join customer using(cust_id)
 where referrer_id='c1';
 
select manufacturer from bicyclemodel
 inner join bicycle using(model_no)
 where color='red';
 
select model_no, manufacturer, style 
 from bicyclemodel inner join (
  bicycle inner join service using(bicycle_id)
  ) using(model_no) 
