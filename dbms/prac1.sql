create database library;
use library;
create table LibraryBooks(accessionNumber int, title tinytext,
author varchar(20), department varchar(20), purchaseDate date,
price int);
create table IssuedBooks(accessionNumber int, borrower varchar(20));
-- primaty key is accesionNumber in librarybooks;
-- foreigh key is accesionNumber in issuedbooks;
-- insert values into library books;
insert into librarybooks values(1, "sophie's world", "Jostein Gaarder",
"philosophy", '2022-10-31', 440);
insert into librarybooks values(2, "death", "Sadh Guru",
"philosophy", '2022-11-20', 330);
insert into librarybooks values(3, "fuck you money", "Iderbat",
"economy", '2023-01-12', 440);
insert into librarybooks values(4, "nogoon nuden lam", "Oyungerel",
"literature", '2019-05-30', 670);
insert into librarybooks values(5, "Database System Concepts", "Manju",
"Computer Science", '2023-01-24', 200);
insert into librarybooks values(6, "Discrete Maths", "Aarti", 
"Computer Science", '2023-01-02', 300);
insert into librarybooks values(7, "im Navathe", "Navathe", 
"literature", '2000-05-05', 290);
insert into librarybooks values(8, "nothing is everything", "Candy", 
"Life", '2002-10-26', 699);
insert into librarybooks values(9, "nothing is everything", "Candy", 
"Life", '2002-10-26', 699);
select * from librarybooks;
-- insert values into issued books;
insert into issuedbooks values(1, 'Candy');
insert into issuedbooks values(2, 'Arjun');
insert into issuedbooks values(4, 'Sandy');
insert into issuedbooks values(8, 'Panda');
insert into issuedbooks values(5, 'Rock');
insert into issuedbooks values(6, 'MR A');
select * from issuedbooks;
delete from librarybooks where title = 'Database System Concepts';
select * from librarybooks;
update librarybooks set department = 'CS' where title = 'Discrete Maths';
select * from librarybooks where department = 'CS';
select * from librarybooks where department = 'CS' and author = 'Navathe';
alter table librarybooks add constraint primary key(accessionNumber);
desc librarybooks;
alter table issuedbooks add constraint 
foreign key(accessionNumber) references librarybooks(accessionNumber);
desc issuedbooks;
select * from librarybooks where department = 'CS';
select accessionNumber from issuedbooks;
select * from librarybooks, issuedbooks 
where librarybooks.accessionNumber = issuedbooks.accessionNumber 
and librarybooks.department = 'CS';
select * from librarybooks where price < 500 
and purchaseDate > '1999-01-01' and purchaseDate < '2004-01-01';