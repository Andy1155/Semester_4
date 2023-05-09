create database ComputerDepartment;
use ComputerDepartment;
create table personal_information(roll_no int, name varchar(20),
 DOB date, address tinytext, marks_in_12 int, phone varchar(15));
create table paper_details(paper_code int, paper_name varchar(20));
create table academic_attendance(roll_no int, paper_code int,
 attendance int, marks_in_home int);
alter table academic_attendance 
 add constraint primary key(roll_no, paper_code);
desc academic_attendance;
alter table personal_information add constraint
 foreign key(roll_no) references academic_attendance(roll_no);
desc personal_information;
alter table paper_details add constraint
 foreign key(paper_code)
  references academic_attendance(paper_code);
desc paper_details;
insert into academic_attendance values(3500, 10, 80, 100);
insert into academic_attendance values(3500, 11, 92, 98);
insert into academic_attendance values(3500, 13, 70, 85);
insert into academic_attendance values(3510, 12, 100, 92);
insert into academic_attendance values(3510, 10, 85, 78);
insert into academic_attendance values(3513, 10, null, null);
insert into academic_attendance values(3555, 14, 50, 77); 
insert into academic_attendance values(3566, 14, 100, 100); 
select * from academic_attendance;
insert into personal_information 
 values(3500, 'Andy', '2002-10-26', 'delhi', 100, 8585916727);
insert into personal_information 
 values(3510, 'Arav', '2003-10-10', 'kerela', 95, 9955331144);
insert into personal_information 
 values(3513, 'Arvangurav', '2003-01-13', 'delhi', 93, 8855664422);
insert into personal_information 
 values(3555, 'tavintav', '2000-06-06', 'goa', 90, null);
insert into personal_information 
 values(3566, 'jaranzurgaa', '1999-06-06', 'delhi', null, 9876543210);
 select * from personal_information;
alter table personal_information add unique(roll_no);
alter table paper_details add unique(paper_code);
alter table paper_details add unique(paper_name);
insert into paper_details values(10, "DBMS"); 
insert into paper_details values(11, "Math"); 
insert into paper_details values(12, 'SE');
insert into paper_details values(13, 'R');
insert into paper_details values(14, 'DAA');
select * from paper_details;
select paper_details.*, personal_information.name
 from paper_details, personal_information, academic_attendance
 where academic_attendance.roll_no = personal_information.roll_no
 and academic_attendance.paper_code = paper_details.paper_code
 and academic_attendance.attendance>75 
 and academic_attendance.paper_code = 11
 and academic_attendance.marks_in_home>60;
select personal_information.name 
 from personal_information, academic_attendance
 where personal_information.roll_no = academic_attendance.roll_no
 and personal_information.address = 'delhi'
 and academic_attendance.paper_code = 10
 and academic_attendance.marks_in_home > 60;
select personal_information.name, 
 sum(attendance) total_attendance, sum(marks_in_home) total_marks
 from personal_information 
 inner join academic_attendance
 using(roll_no)
 group by name;
select name, max(marks_in_home) from personal_information
 inner join academic_attendance using(roll_no) 
 where paper_code=11
 group by name;
select * from personal_information 
 inner join (academic_attendance inner join paper_details using(paper_code)) 
 using(roll_no);