CREATE DATABASE EduSchema;
USE EduSchema;
CREATE TABLE Courses ( CID int auto_increment primary key, CourseName varchar(100) not null, Content text, Duration int);
INSERT INTO Courses (CourseName, Content, Duration) VALUES
('Machine Learning', 'An in-depth look at machine learning algorithms and applications.', 14),
('Introduction to Psychology', 'Basic principles of psychology.', 12),
('Data Structures and Algorithms', 'Core concepts in data structures and algorithm design.', 16),
('Environmental Science', 'Study of the environment and solutions to environmental issues.', 10),
('Sociology', 'The study of social behavior and society.', 9);
CREATE TABLE Instructors (InstructorID int auto_increment primary key, Iname varchar(100) not null, email varchar(100) not null unique);
INSERT INTO Instructors (Iname, email) VALUES
('Sophia Green', 'sophia.green@example.com'),
('Daniel White', 'daniel.white@example.com'),
('Isabella Taylor', 'isabella.taylor@example.com'),
('James Anderson', 'james.anderson@example.com'),
('Ava Thomas', 'ava.thomas@example.com');
CREATE TABLE Students (SID int auto_increment primary key, StudentName varchar(100) not null, email varchar(100) not null unique);
INSERT INTO Students (StudentName, email) VALUES
('Sophia White', 'sophia.white@example.com'),
('Jackson King', 'jackson.king@example.com'),
('Mia Scott', 'mia.scott@example.com'),
('Ethan Young', 'ethan.young@example.com'),
('Amelia Walker', 'amelia.walker@example.com');
CREATE TABLE Enrollments (EID int auto_increment primary key, SID int, CID int, EDate date, foreign key (SID) references Students(SID),foreign key (CID) references Courses(CID));
INSERT INTO Enrollments (SID, CID, EDate) VALUES
(1, 2, '2024-02-10'),
(2, 3, '2024-02-11'),
(3, 4, '2024-02-12'),
(4, 5, '2024-02-13'),
(5, 1, '2024-02-14');
CREATE TABLE Assessments (AID int auto_increment primary key, CID int, AName varchar(100) not null, DueDate date, foreign key (CID) references Courses(CID));
INSERT INTO Assessments (CID, AName, DueDate) VALUES
(1, 'Final Exam', '2024-05-01'),
(2, 'Research Paper', '2024-04-15'),
(3, 'Homework Assignment', '2024-03-20'),
(4, 'Quiz', '2024-04-05'),
(5, 'Group Project', '2024-03-25');
CREATE TABLE Grades (GID int auto_increment primary key, AID int, SID int, Grade decimal(5,2), foreign key (AID) references Assessments(AID), foreign key (SID) references Students(SID));
INSERT INTO Grades (AID, SID, Grade) VALUES
(1, 3, 92.50),
(2, 4, 89.00),
(3, 5, 84.75),
(4, 1, 95.00),
(5, 2, 90.25);
CREATE TABLE Courses_Archive (CID int auto_increment primary key, CourseName varchar(255) not null, Content text, Duration varchar(50));
CREATE TABLE Instructors_Archive (InstructorID int auto_increment primary key, Iname VARCHAR(255), email VARCHAR(255));
CREATE TABLE Students_Archive (SID INT PRIMARY KEY, SName VARCHAR(255), email VARCHAR(255));
CREATE TABLE Assessments_Archive (AID INT PRIMARY KEY, CID INT, AssessmentName VARCHAR(255), DueDate DATE);
CREATE TABLE Grades_Archive (GradeID INT PRIMARY KEY, AID INT, SID INT, Grade VARCHAR(10));
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Students;
SELECT * FROM Enrollments;
SELECT * FROM Grades;
SELECT * FROM Assessments;
SELECT * FROM Instructors_Archive;