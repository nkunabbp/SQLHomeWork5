USE [master]

GO

CREATE DATABASE  [TEACHERS]

GO

USE [TEACHERS]

GO

--Tables

CREATE TABLE [Post]
(
[Id] int IDENTITY(1, 1) NOT NULL,
[Name] NVARCHAR(20) NOT NULL,

CONSTRAINT PK_Post PRIMARY KEY([Id]),
CONSTRAINT CK_Post_Name CHECK([Name] != N'')
)

GO

CREATE TABLE [Teacher]
(
[Id] int IDENTITY(1, 1) NOT NULL,
[SurName] NVARCHAR(15) NOT NULL,
[Code] CHAR(10) NULL,
[IdPost] Int NOT NULL,
[Tel] CHAR(7) NOT NULL,
[Salary] Int NOT NULL,
[Rise] NUMERIC(6,2) NOT NULL,
[HireDate] DATETIME NOT NULL,


CONSTRAINT PK_Teacher PRIMARY KEY([Id]),
CONSTRAINT CK_Teacher_Name CHECK([SurName] != N''),
CONSTRAINT UQ_Teacher_IdPost UNIQUE([IdPost]),
CONSTRAINT FK_Teacher_Post FOREIGN KEY([IdPost]) REFERENCES [Post]([Id])
)

----------
GO

-- 2
ALTER TABLE [Teacher]
DROP CONSTRAINT FK_Teacher_Post

GO

DROP TABLE [Post]

GO 

-- 3
-- clucayno sozdala unique dlya IdPost poetomu udalayu tut
ALTER TABLE [Teacher]
DROP CONSTRAINT UQ_Teacher_IdPost

GO

ALTER TABLE [Teacher]
DROP COLUMN [IdPost]

GO

-- 4
ALTER TABLE [Teacher]
ADD CONSTRAINT CK_Teacher_HireDate CHECK([HireDate] >= '19900101')

GO 

-- 5
ALTER TABLE [Teacher]
ADD CONSTRAINT UQ_Teacher_Code UNIQUE([Code])

GO

-- 6
ALTER TABLE [Teacher]
ALTER COLUMN [Salary] NUMERIC(6,2)

GO

-- 7
ALTER TABLE [Teacher]
ADD CONSTRAINT CK_Teacher_Salary CHECK([Salary] BETWEEN 1000 AND 5000)

GO

-- 8
ALTER TABLE [Teacher]
DROP COLUMN [Tel] 

GO

ALTER TABLE [Teacher] 
ADD [PhoneNumber] CHAR(7)  NULL

GO

-- 9 
ALTER TABLE [Teacher]
ALTER COLUMN [PhoneNumber] CHAR(11)

GO

-- 10

CREATE TABLE [Post](
[Id] int IDENTITY(1, 1) NOT NULL,
[Name] NVARCHAR(15) NOT NULL

CONSTRAINT PK_Post PRIMARY KEY([Id]),
CONSTRAINT CK_Post_Name CHECK([Name] != N''),
)

GO

-- 11 
ALTER TABLE [Post]
ADD CONSTRAINT CK_Post_NameAllow CHECK([Name] IN(N'Professor' , N'AssociateProf' , 'Teacher' , 'Assistant'))

GO

-- 12
ALTER TABLE [Teacher]
ADD CONSTRAINT CK_Teacher_NameAllow CHECK([SurName] NOT LIKE N'%[0-9]%' )

GO

-- 13
ALTER TABLE [Teacher]
ADD [IdPost] Int  NOT NULL

GO

-- 14
ALTER TABLE [Teacher]
ADD CONSTRAINT FK_Teacher_Posts FOREIGN KEY([IdPost]) REFERENCES [Post]([Id])
   ON DELETE CASCADE
   ON UPDATE CASCADE
GO

-- 15
SET IDENTITY_INSERT Post ON
INSERT INTO post(Id,Name) VALUES(1,N'Professor');
INSERT INTO post(Id,Name) VALUES(2,N'AssociateProf');
INSERT INTO post(Id,Name) VALUES(3,N'Teacher');
INSERT INTO post(Id,Name) VALUES(4,N'Assistant');
SET IDENTITY_INSERT Post OFF


SET IDENTITY_INSERT TEACHER ON
INSERT INTO TEACHER (Id, SurName, Code, IdPost, PhoneNumber, Salary, Rise, HireDate)
VALUES (1 , N'Sidorov','0123456789', 1, NULL, 1070, 470 , '01.09.1992');
INSERT INTO TEACHER (Id, SurName, Code, IdPost, PhoneNumber, Salary, Rise, HireDate)
VALUES (2 , N'Ramishevsiy','4567890123', 2, '4567890', 1110, 370 , '09.09.1998');
INSERT INTO TEACHER (Id, SurName, Code, IdPost, PhoneNumber, Salary, Rise, HireDate)
VALUES (3 , N'Horenko','1234567890', 3, NULL, 2000, 230 , '10.10.2001');
INSERT INTO TEACHER (Id, SurName, Code, IdPost, PhoneNumber, Salary, Rise, HireDate)
VALUES (4 , N'Vibrovsky','2345678901', 4, NULL, 4000, 170 , '01.09.2003');
INSERT INTO TEACHER (Id, SurName, Code, IdPost, PhoneNumber, Salary, Rise, HireDate)
VALUES (5 , N'Voropaev',NULL, 4, NULL, 1500, 150 , '02.09.2002');
INSERT INTO TEACHER (Id, SurName, Code, IdPost, PhoneNumber, Salary, Rise,
HireDate) VALUES (6 , N'Kuzincev','5678901234', 3, '4567890', 3000 ,
270 , '01.01.1991');