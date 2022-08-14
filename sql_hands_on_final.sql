CREATE database assignment1;
use assignment1;

#EXERCISE1
CREATE TABLE Trainer_info
(Trainer_Id Varchar(20) PRIMARY KEY,
Salutation Varchar(7),
Trainer_Name Varchar(30),
Trainer_Location Varchar(30),
Trainer_Track Varchar(15),
Trainer_Qualification Varchar(100),
Trainer_Experience Integer(11),
Trainer_Email Varchar(100),
Trainer_Password Varchar(20));

Select *from Trainer_info;

CREATE TABLE Batch_info
(Batch_id Varchar(20) PRIMARY KEY,
Batch_owner Varchar(30),
Batch_BU_Name Varchar(30));

SELECT *FROM Batch_info;

CREATE TABLE Module_info
(Module_Id Varchar(20) PRIMARY KEY,
Module_Name varchar(40),
Module_Duration Integer);

SELECT *FROM Module_info;

CREATE TABLE Associate_Info
(Associate_id Varchar(20) PRIMARY KEY,
Salutation Varchar(7),
Associate_Name Varchar(30),
Associate_Location Varchar(30),
Associate_Track Varchar(15),
Associate_Qualification Varchar(200),
Associate_Email Varchar(100),
Associate_Password Varchar(20));


CREATE TABLE Questions
(Question_Id Varchar(20) PRIMARY KEY,
Question_Text Varchar(900), 
Module_Id Varchar(20),
Constraint o_fk Foreign Key(Module_Id) REFERENCES Module_info(Module_Id));

CREATE TABLE Associate_Status
(Associate_id Varchar(20),
Module_id Varchar(20),
Start_Date date,
End_Date date,
AFeedbackGiven bool,
TFeedbackGiven bool,
PRIMARY KEY(Associate_id,Module_id),
FOREIGN KEY(associate_id) REFERENCES Associate_info(Associate_id),
FOREIGN KEY(module_id) REFERENCES Module_info(Module_id));

Alter table Associate_Status
Add batch_id Varchar(20);

Alter table Associate_Status
add Foreign key (Batch_id) REFERENCES batch_info(batch_id);

Alter table Associate_Status
Add Trainer_id Varchar(20);

Alter table Associate_Status
add Foreign key (trainer_id) REFERENCES trainer_info(trainer_id);

SELECT *from Associate_Status;

CREATE TABLE Trainer_Feedback
(Trainer_Id Varchar(20),
Question_Id Varchar(20),
Batch_Id Varchar(20),
Module_Id Varchar(20),
Trainer_Rating Integer,
FOREIGN KEY(Trainer_Id) REFERENCES Trainer_info(Trainer_Id),
FOREIGN KEY(Question_Id) REFERENCES Questions(Question_Id),
FOREIGN KEY(Batch_Id) REFERENCES Batch_info(Batch_Id),
FOREIGN KEY(Module_Id) REFERENCES Module_info(Module_Id));

CREATE TABLE Associate_Feedback
(Associate_id Varchar(20),
Question_id Varchar(20),
Module_id Varchar(20),
associate_rating integer,
FOREIGN KEY(Associate_id) REFERENCES Associate_info(Associate_id),
FOREIGN KEY(Question_Id) REFERENCES Questions(Question_Id),
FOREIGN KEY(Module_Id) REFERENCES Module_info(Module_Id));


CREATE TABLE Login_details
(User_Id Varchar(20),
user_Password Varchar(20));


#EXERCISE2
INSERT INTO Trainer_info VALUES ('F001','Mr.','PANKAJ GHOSH','Pune','Java','Bachelor of Technology',12,'Pankaj.Ghosh@alliance.com','fac1@123'),
('F002','Mr.','SANJAY RADHAKRISHNAN ','Bangalore','DotNet','Bachelor of Technology',12,'Sanjay.Radhakrishnan@alliance.com','fac2@123'), 
('F003','Mr.','VIJAY MATHUR','Chennai','Mainframe','Bachelor of Technology',10,'Vijay.Mathur@alliance.com','fac3@123'), 
('F004','Mrs.','NANDINI NAIR','KoIkata','Java','Master of Computer Applications',9,'Nandini.Nair@alliance.com','fac4@123'),
 ('F005','Miss.','ANITHA PAREKH','Hyderabad','Testing','Master of Computer Applications',6,'Anitha.Parekh@alliance.com','fac5@123'), 
 ('F006','Mr.','MANOJ AGRAWAL','Mumbai','Mainframe','Bachelor of Technology',9,'Manoj.Agrawal@alliance.com','fac6@123'), 
 ('F007','Ms.','MEENA KULKARNI','Coimbatore','Testing','Bachelor of Technology',5,'Meena.KuIkarni@alliance.com','fac7@123'),
('F009','Mr.','SAGAR MENON' ,'Mumbai','Java','Master of Science In Information Technology',12,'Sagar.Menon@alliance.com','fac8@123');

INSERT INTO Batch_Info VALUES ('B001','MRS.SWATI ROY','MSP'), ('B002','MRS.ARURNA K','HEALTHCARE'),
('B003','MR.RAJESH KRISHNAN','LIFE SCIENCES'), ('B004','MR.SACHIN SHETTY','BFS'), ('B005','MR.RAMESH PATEL','COMMUNICATION'),
('B006','MRS.SUSAN CHERIAN','RETAIL & HOSPITALITY'), ('B007','MRS.SAMPADA JAIN','MSP'),
('B008','MRS.KAVITA REGE','BPO'),
('B009','MR.RAVI SEJPAL','MSP');

SELECT *FROM Batch_Info;


INSERT INTO Module_Info VALUES ('O10SQL','OracIe 10g SQL' ,16), 
('O10PLSQL','OracIe 10g PL/ SQL' ,16), 
('J2SE','Core Java SE 1.6',288),
('J2EE','Advanced Java EE 1.6',80),
('JAVAFX','JavaFX 2.1',80),
('DOTNT4','Net Framework 4.0 ',50), 
('SQL2008','MS SQI Server 2008',120), 
('MSBI08','MS BI Studio 2008',158), 
('SHRPNT','MS Share Point' ,80),
('ANDRD4','Android 4.0',200),
('EM001','Instructor',0),
('EM002','Course MateriaI',0),
 ('EM003','Learning Effectiveness',0), 
 ('EM004','Environment',0),
('EM005','Job Impact',0),
('TM001','Attendees',0),
('TM002','Course MateriaI',0),
('TM003','Environment',0);

sELECT *FROM MODULE_INFO;


INSERT INTO Associate_Info VALUES
('A001','Miss.','GAYATHRI NARAYANAN','Gurgaon','Java','Bachelor of Technology','Gayathri.Narayanan@hp.com','tne1@123'),
('A002','Mrs.','RADHIKA MOHAN','KeraIa','Java','Bachelor of Engineering In Information Technology','Radhika.Mohan@cognizant.com','tne2@123'),
('A003','Mr.','KISHORE SRINIVAS','Chennai','Java','Bachelor of Engineering In Computers','Kishore.Srinivas@ibm.com','tne3@123'),
('A004','Mr.','ANAND RANGANATHAN','Mumbai','DotNet','Master of Computer Applications','Anand.Ranganathan@finoIex.com','tne4@123'),
('A005','Miss.','LEELA MENON','KeraIa','Mainframe','Bachelor of Engineering In Information Technology','LeeIa.Menon@microsoft.com','tne5@123'),
('A006','Mrs.','ARTI KRISHNAN','Pune','Testing','Master of Computer Applications','Arti.Krishnan@cognizant.com','tne6@123'),
 ('A007','Mr.','PRABHAKAR SHUNMUGHAM','Mumbai','Java','Bachelor of Technology','Prabhakar.Shunmugham@honda.com','tne7@123');

SELECT *FROM ASSOCIATE_INFO;


INSERT INTO Questions(QUESTION_ID,Module_id,Question_text) VALUES
('Q001','EM001','Instructor knowledgeable and able to handle all your queries'), 
('Q002','EM001','AII the topics in a particular course handled by the trainer without any gaps or slippages'),
('Q003','EM002','The course materials presentation, handson, etc. refered during the training are relevant and useful.'),
('Q004','EM002','The Hands on session adequate enough to grasp the understanding of the topic.'),
('Q005','EM002','The reference materials suggested for each module are adequate.'), 
('Q006','EM003','Knowledge and skills presented in this training are applicatible at your work'),
('Q007','EM003','This training increases my proficiency level'),
('Q008','EM004','The physical environment e.g. classroom space, air-conditioning was conducive to learning.'),
('Q009','EM004','The software/hardware environment provided was sufficient for the purpose of the training.'),
('Q010','EM005','This training will improve your job performance.'),
 ('Q011','EM005','This training align with the business priorities and goals.'), 
 ('Q012','TM001','Participants were receptive and had attitude towards learning.'), 
 ('Q013','TM001','AII participats gained the knowledge and the practical skills after this training.'),
('Q014','TM002','The course materials presentation, handson, etc. available for the session covers the entire objectives of the course.'),
('Q015','TM002','Complexity of the course is adequate for the particpate level.'),
 ('Q016','TM002','Case study and practical demos helpful in understanding of the topic'), 
 ('Q017','TM003','The physical environment e.g. classroom space, air-conditioning was conducive to learning.'),
('Q018','TM003','The software/hardware environment provided was adequate for the purpose of the training.');

SELECT *FROM questions;




INSERT INTO Associate_Status (Associate_id,Module_id,Batch_id,Trainer_id,Start_date,End_date)
VALUES ('A001','O10SQL','B001','F001','2000-12-15','2000-12-25'),
('A002','O10SQL','B001','F001','2000-12-15','2000-12-25'),
('A003','O10SQL','B001','F001','2000-12-15','2000-12-25'),
('A001','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
('A002','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
('A003','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
('A001','J2SE','B003','F003','2002-8-20','2002-10-25'),
('A002','J2SE','B003','F003','2002-8-20','2002-10-25'),
('A001','J2EE','B004','F004','2005-12-1','2005-12-25'),
 ('A002','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A003','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A004','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A005','JAVAFX','B005','F006','2005-12-4','2005-12-20'),
('A006','JAVAFX','B005','F006','2005-12-4','2005-12-20'),
('A006','SQL2008','B006','F007','2007-6-21','2007-6-28'),
('A007','SQL2008','B006','F007','2007-6-21','2007-6-28'),
('A002','MSBI08','B007','F006','2009-6-26','2009-6-29'),
('A003','MSBI08','B007','F006','2009-6-26','2009-6-29'),
('A004','MSBI08','B007','F006','2009-6-26','2009-6-29'),
('A002','ANDRD4','B008','F005','2010-6-5','2010-6-28'),
('A005','ANDRD4','B008','F005','2010-6-5','2010-6-28'),
('A003','ANDRD4','B009','F005','2011-8-1','2011-8-20'),
('A006','ANDRD4','B009','F005','2011-8-1','2011-8-20');

/#EXERCISE3(CHANGE PASSWORD)/
UPDATE Trainer_Info SET Trainer_Password='nn4@123' WHERE Trainer_Password='fac4@123';

#EXERCISE4
DELETE FROM Associate_status WHERE Associate_Id='A003' AND Module_Id='J2EE' 
AND Batch_Id='B004' AND Trainer_Id='F004' AND Start_Date='2005-12-1' AND End_Date='2005-12-25';
Select *from Associate_status;

/*#EXERCISE5:Fetch first five trainers who have max years of expereience and display there details*/
SELECT Trainer_Name, Trainer_Experience FROM trainer_info order by Trainer_Experience desc limit 5 ;

#EXERCISE6
START TRANSACTION;
INSERT INTO Login_details 
Values ('U001' ,'Admin1@ 123'), ('U002','Admin2@123');
SELECT *FROM Login_Details; #two rows got inserted
ROLLBACK;
SELECT *FROM Login_Details; #after performing rollback the rowsgot deleted.

#EXERCISE7
CREATE USER 'Soumeee'@'host' IDENTIFIED  BY 'password';
GRANT CREATE,SELECT ON assignment1 TO 'Soumee'@'host';
START TRANSACTION;
INSERT INTO Login_details 
Values ('U001' ,'Admin1@ 123'), ('U002','Admin2@123');
SELECT *FROM Login_Details; #two rows got inserted
ROLLBACK;
SELECT *FROM Login_Details; #after performing rollback the rowsgot deleted.
REVOKE CREATE,SELECT ON assignment1 FROM 'Soumee'@'host'

#EXERCISE8

DROP TABLE login_details;

#EXERCISE9
CREATE TABLE suppliers(supplier_id integer(10) NOT NULL PRIMARY KEY,
Supplier_Name varchar(50) NOT NULL,
address varchar(50),
city varchar(50),
state varchar(25),zip_code varchar(10));

#EXERCISE10-11
CREATE TABLE COURSE (Course_Code varchar(50) PRIMARY KEY, Base_fees Integer,
Special_fees Integer, Created_By varchar(100), Updated_By varchar(100));

CREATE TABLE course_fees( COURSE_CODE varchar(50) primary key, BASE_FEES Integer,
SPECIAL_FEES Integer, DISCOUNT Integer);

CREATE TABLE course_fees_history( COURSE_CODE varchar(50) primary key, BASE_FEES Integer,
SPECIAL_FEES Integer,
CREATED_BY varchar(50), Updated_By varchar(50));


INSERT INTO course_fees VALUES
('1',180,100,10),
('2',150,110,10),
('3',160,170,5),
('4',150,100,10),
('6',190,100,40);
SELECT *FROM course_fees;

INSERT INTO course_fees_history VALUES
('1',120,123,'Ram','Ramesh'),
('2',150,110,'Bala','Ram'),
('3',160,170,'Bala','Vinu'),
('4',170,235,'Ram','Ram'),
('6',190,100,'Vinod','Vinod' );
SELECT *FROM course_fees_history;

SELECT DISTINCT(COURSE_CODE) FROM COURSE_FEES UNION SELECT DISTINCT(COURSE_CODE) FROM COURSE_FEES_HISTORY;

SELECT COUNT(*) FROM course_fees_history;
SELECT count(DISTINCT(COURSE_CODE)) FROM COURSE_FEES_HISTORY;
SELECT count(DISTINCT(base_fees)) FROM COURSE_FEES_HISTORY;
SELECT count(DISTINCT(special_fees)) FROM COURSE_FEES_HISTORY;
SELECT COUNT(*) FROM course_fees;
SELECT count( DISTINCT(COURSE_CODE)) FROM COURSE_FEES;
SELECT count( DISTINCT(base_fees)) FROM COURSE_FEES;
SELECT count( DISTINCT(special_fees)) FROM COURSE_FEES;


#FUNCTIONS
#EXERCISE12
CREATE TABLE course_info ( COURSE_CODE varchar(10) PRIMARY KEY, COURSE_NAME varchar(20) NOT NULL, 
COURSE_DESCRIPTION varchar(25), COURSE_START_DATE Date , COURSE_DURATION int, NO_OF_PARTICIPANTS int, COURSE_TYPE Char(3));

CREATE TABLE student_info( STUDENT_ID varchar(10) PRIMARY KEY,
 FIRST_NAME varchar(20), LAST_NAME varchar(25), ADDRESS varchar(150));
 
alter table student_info
add course_code varchar(10);

Alter table student_info
add foreign key (course_code) references course_info(course_code);

SELECT *FROM course_fees;
INSERT INTO course_fees VALUES ('7',NULL,120,15);
 INSERT INTO course_fees VALUES ('8',NULL,200,50);
INSERT INTO course_fees VALUES ('9',300,200,50),('10',175,250,45);
SELECT * FROM course_fees;
SELECT MIN(IFNULL(base_fees,0)) AS MIN_FEES,MAX(base_fees) AS MAX_FEES FROM course_fees;


#EXERCISE13 -14
SELECT *FROM course_info;
select *from course_fees;
ALTER TABLE course_fees ADD infra_fees DECIMAL(5,3);
UPDATE course_fees SET infra_fees =45.751 WHERE course_code=1;
UPDATE course_fees SET infra_fees =43.453 WHERE course_code=2;
UPDATE course_fees SET infra_fees =46.751 WHERE course_code=3;
UPDATE course_fees SET infra_fees =47.751 WHERE course_code=4;
UPDATE course_fees SET infra_fees =25.453 WHERE course_code=5;
UPDATE course_fees SET infra_fees =42.751 WHERE course_code=6;
UPDATE course_fees SET infra_fees =72.751 WHERE course_code=7;
UPDATE course_fees SET infra_fees =95.751 WHERE course_code=8;
UPDATE course_fees SET infra_fees =44.751 WHERE course_code=9;
UPDATE course_fees SET infra_fees =37.791 WHERE course_code=10;

SELECT AVG(infra_fees) FROM course_fees INNER JOIN course_info ON course_fees.course_code=course_info.course_code;
SELECT ROUND(AVG(infra_fees),3) FROM course_fees;
SELECT  COURSE_NAME,DATEDIFF(curdate(),COURSE_START_DATE) AS no_of_days FROM course_info;

#EXERCISE15
SELECT CONCAT('<',course_name,'>','<',course_code,'>') FROM course_info;

#EXERCISE16
SELECT AVG(IFNULL(BASE_FEES,0)) as avg_base_fees FROM COURSE_FEES;


#EXERCISE17
ALTER TABLE course_info ADD message VARCHAR(100);
INSERT INTO Course_info(Course_Code,Course_Name,Course_Type,message) VALUES
(1,'ECONOMICS','CLR','Class Room'),(2,'DATA','EL','ELearning'),(3,'FINANCE','OF','Offline Reading');
SELECT * FROM course_info;
Select Course_Type, message from Course_info where Course_Type in ('CLR','EL','OF');


UPDATE Course_info SET course_start_date='2021-06-03'  where course_code=1;
UPDATE Course_info SET course_start_date='2021-04-06'  where course_code=2;
UPDATE Course_info SET course_start_date='2021-06-04'  where course_code=3;
UPDATE Course_info SET no_of_participants=20  where course_code=1;
UPDATE Course_info SET no_of_participants=21  where course_code=2;
UPDATE Course_info SET no_of_participants=22  where course_code=3;


#EXERCISE18
SELECT course_start_date, SUM(NO_OF_PARTICIPANTS) as NO_OF_PARTICIPANTS FROM course_info GROUP BY course_start_date;

#EXERCISE19
SELECT course_start_date, SUM(NO_OF_PARTICIPANTS) as NO_OF_STUDENTS FROM course_info WHERE COURSE_TYPE="CLR" GROUP BY course_start_date;


#EXERCISE20
SELECT course_start_date, SUM(NO_OF_PARTICIPANTS) as NO_OF_STUDENTS FROM course_info WHERE COURSE_TYPE="CLR"
 GROUP BY course_start_date HAVING NO_OF_STUDENTS>10 ;

#EXERCISE21
SELECT course_name,datediff(curdate(),course_start_date)as course_duration FROM course_info ORDER BY course_duration ASC;

#EXERCISE22
SELECT STUDENT_INFO.STUDENT_ID,STUDENT_INFO.FIRST_NAME,STUDENT_INFO.lAST_NAME, COURSE_INFO.COURSE_CODE
FROM Student_info INNER JOIN course_info ON student_info.course_code=course_info.course_code where course_info.course_code=167;

#EXERCISE23
SELECT *from course_fees;
SELECT *from course_info;
SELECT course_info.course_description,course_fees.discount 
FROM COURSE_INFO INNER JOIN course_fees ON course_info.course_code=course_fees.course_code;


#EXERCISE24
select *from student_info;
INSERT INTO student_info VALUES
(2211232,'Soumee','Ghosh','23 Kolkata, India',1),
(2211424,'Silvee','Das','12/24 Bangalore',2),
(2211436,'Sid','Malhotra','Delhi',3);

SELECT student_info.First_name, course_info.course_code FROM student_info 
LEFT JOIN course_info ON student_info.course_code=course_info.course_code;

SELECT student_info.First_name, course_info.course_code FROM student_info 
RIGHT JOIN course_info ON student_info.course_code=course_info.course_code;


#EXERCISE25
SELECT *FROM COURSE_INFO;
INSERT INTO COURSE_INFO (COURSE_CODE,COURSE_NAME) VALUES (4, 'STATISTICS'),(5,'PYTHON');
SELECT *FROM COURSE_FEES;
INSERT INTO COURSE_INFO (COURSE_CODE,COURSE_NAME) VALUES (11, 'SQL'),(12,'VBA');
SELECT *FROM STUDENT_INFO;
INSERT INTO COURSE_FEES VALUES (11,500,200,10,45.791),(12,600,300,5,42.123);
INSERT INTO student_info VALUES(2211746,'Zhan','Fernandez','Mumbai',11),(2211639,'Riddhi', 'Pal','Kolkata',12);

SELECT DISTINCT student_info.student_id FROM student_info INNER JOIN course_fees 
ON student_info.course_code=course_fees.course_code WHERE ((base_fees+special_fees+infra_fees)*(1-discount/100))<1500;

#EXERCISE26
SELECT DISTINCT student_info.student_id, Student_info.FIRST_NAME FROM student_info INNER JOIN course_fees 
ON student_info.course_code=course_fees.course_code WHERE ((base_fees+special_fees+infra_fees)*(1-discount/100))<1500;