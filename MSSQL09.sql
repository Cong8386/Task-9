CREATE TABLE Class
(
    ClassCode varchar (10) PRIMARY KEY,
    HeadTeacher varchar (30),
    Room varchar(30),
    Timeslot char,
    CloseDate datetime
);INSERT INTO Class (ClassCode, HeadTeacher,Room,Timeslot,CloseDate)
VALUES ('T203M','Dang Kim Thy','class 1','M','2022/09/10')

INSERT INTO Class (ClassCode, HeadTeacher,Room,Timeslot,CloseDate)
VALUES ('M365F','Tran Quang Dong','class 3','I','2022/08/12')

INSERT INTO Class (ClassCode, HeadTeacher,Room,Timeslot,CloseDate)
VALUES ('T203F','Nguyen Huu Tuan','class 2','G','2022/10/11')

INSERT INTO Class (ClassCode, HeadTeacher,Room,Timeslot,CloseDate)
VALUES ('D1003A','Nguyen Thi Thuy','class 4','H','2022/09/12')


INSERT INTO Class (ClassCode, HeadTeacher,Room,Timeslot,CloseDate)
VALUES ('T1003A','Nguyen Thuy Hang','class 5','F','2022/12/10')

CREATE TABLE Student
 ( 
 RollNo varchar(10) Primay Key,
ClassCode varchar(10), 
FullName varchar(30),
 Male bit,
 BirthDate datetime,
Address varchar(30),
Provice char(2),
 Email varchar(30), 
 CONSTRAINT PK1 FOREIGN KEY (ClassCode) REFERENCES Class(ClassCode)
  ); 
  
  INSERT INTO Student (RollNo,ClassCode,FullName,Male,BirthDate,Provice,Email)
VALUES ('A1003','T203M','Ngo Doan Cong',1,'1994/08/01','HN','Ngodoancong@gmail.com')

INSERT INTO Student (RollNo,ClassCode,FullName,Male,BirthDate,Provice,Email)
VALUES ('A1002','T203F','Tran Van Tiep',1,'1994/10/09','HN','TranVanTiep@gmail.com')

INSERT INTO Student (RollNo,ClassCode,FullName,Male,BirthDate,Provice,Email)
VALUES ('A1001','T1003A','Nguyen thi Van',0,'1997/06/09','HP','Nguyenthivan@gmail.com')
  
INSERT INTO Student (RollNo,ClassCode,FullName,Male,BirthDate,Provice,Email)
VALUES ('A1004','M365A','Nguyen Thuy H',0,'1996/06/09','HP','NguyenthiH@gmail.com')

INSERT INTO Student (RollNo,ClassCode,FullName,Male,BirthDate,Provice,Email)
VALUES ('A1005','D1003A','Nguyen Quang Huy',1,'1998/06/10','ND','NguyenQuangHuy@gmail.com')

INSERT INTO Subject (SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per)
VALUES ('BS ','BosStrap',0,1,'100','100')


  CREATE TABLE  Subject
(
    SubjectCode varchar(10) PRIMARY Key,
    SubjectName varchar(40),
    WMark bit ,
    PMark bit ,ang
    WTest_per int,
    PTest_per int
);

INSERT INTO Subject (SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per)
VALUES ('html','Hypertext Markup Language',1,1,'100','100')

INSERT INTO Subject (SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per)
VALUES ('CSS','Cascading Style Sheet language',0,1,'100','100')

INSERT INTO Subject (SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per)
VALUES ('JS','javascript ',0,1,'100','100')

INSERT INTO Subject (SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per)
VALUES ('SQl ','Structured Query Language ',1,1,'100','100')


CREATE TABLE Mark
(
    RollNo varchar(10),
    SubjectCode varchar(10),
    WMark float,
    PMark float,
    Mark float ,
    CONSTRAINT PK01 FOREIGN KEY (RollNo) REFERENCES Student(RollNo),
    CONSTRAINT PK02F FOREIGN KEY (SubjectCode) REFERENCES Subject(SubjectCode)
);
INSERT INTO Mark (RollNo,SubjectCode,WMark,PMark,Mark)
VALUES('A1001','BS','60','80','70')

NSERT INTO Mark (RollNo,SubjectCode,PMark,Mark)
VALUES('A1002','CSS','35','35')


INSERT INTO Mark (RollNo,SubjectCode,WMark,PMark,Mark)
VALUES('A1003','html','40','30','35')

INSERT INTO Mark (RollNo,SubjectCode,PMark,Mark)
VALUES('A1004','JS','30','30')

INSERT INTO Mark (RollNo,SubjectCode,WMark,PMark,Mark)
VALUES('A1005','SQL','70','50','60')

~~~~Tạo một khung nhìn chứa danh sách các sinh viên đã có ít nhất 2 bài thi (2 môn học khác nhau).
CREATE  VIEW Student_V AS
SELECT Student.RollNo,Student.FullName,Student.ClassCode,Mark.SubjectCode
FROM Student INNER JOIN Mark
ON Student.RollNo = Mark.RollNo


~~~~Tạo một khung nhìn chứa danh sách tất cả các sinh viên đã bị trượt ít nhất là một môn.
CREATE VIEW Student06_V AS SELECT Student.RollNo,Student.FullName,Mark.Mark,Mark.SubjectCode
FROM Student INNER JOIN Mark 
ON Student.RollNo = Mark.RollNo WHERE (Mark<40); 

~~~~Tạo một khung nhìn chứa danh sách các sinh viên đang học ở TimeSlot G.

CREATE VIEW Student07_V AS 
SELECT Student.RollNo,Student.FullName,Class.Timeslot,Class.ClassCode
FROM Student INNER JOIN Class
ON Student.ClassCode = Class.ClassCode
WHERE Timeslot='G'; 


~~~~~Tạo một khung nhìn chứa danh sách các giáo viên có ít nhất 3 học sinh thi trượt ở bất cứ môn nào.

CREATE VIEW Student_View3 AS
SELECT Class.HeadTeacher,Class.ClassCode,Student.RollNo,Mark.SubjectCode,Mark.Mark
FROM ((Student
INNER JOIN Class ON Class.ClassCode = Student.ClassCode)
INNER JOIN Mark ON Student.RollNo = Mark.RollNo)
WHERE (Mark <40)

