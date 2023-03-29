CREATE DATABASE [School]
GO

USE School
GO

CREATE TABLE Student
(
	student_id INT NOT NULL UNIQUE,
	student_fname VARCHAR(50) NOT NULL,
	student_lname VARCHAR(50) NOT NULL,
	student_email VARCHAR(50) NOT NULL,
	student_zipcode VARCHAR(50) NOT NULL,
	CONSTRAINT PK_student PRIMARY KEY (student_id)
);
GO

CREATE TABLE Instructor
(
	instructor_id INT NOT NULL UNIQUE,
	instructor_fname VARCHAR(50) NOT NULL,
	instructor_lname VARCHAR(50) NOT NULL,
	instructor_email VARCHAR(50) NOT NULL,
	instructor_rating INT NOT NULL,
	CONSTRAINT PK_Instructor PRIMARY KEY (instructor_id)
);
GO


CREATE TABLE Course
(
	course_id INT NOT NULL UNIQUE,
	student_id INT NOT NULL UNIQUE,
	course_name VARCHAR(50) NOT NULL,
	course_date DATE NOT NULL,
	course_price FLOAT NOT NULL,
	CONSTRAINT PK_Course PRIMARY KEY (course_id),
	CONSTRAINT FK_Shirt FOREIGN KEY (student_id) REFERENCES Student(student_id)
);
GO


CREATE TABLE Class
(
	class_id INT NOT NULL UNIQUE,
	course_id INT NOT NULL UNIQUE,
	class_name VARCHAR(50) NOT NULL,
	instructor_id INT NOT NULL UNIQUE,
	class_credits INT NOT NULL,
	CONSTRAINT PK_Class PRIMARY KEY (class_id),
	CONSTRAINT FK_Course FOREIGN KEY (course_id) REFERENCES Course(course_id),
	CONSTRAINT FK_Instructor FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);
GO