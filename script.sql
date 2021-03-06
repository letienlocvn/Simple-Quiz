USE [master]
GO
/****** Object:  Database [LAB_231_QUIZONLINE]    Script Date: 02/19/2021 20:39:16 ******/
CREATE DATABASE [LAB_231_QUIZONLINE] ON  PRIMARY 
( NAME = N'LAB_231_QUIZONLINE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LAB_231_QUIZONLINE.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LAB_231_QUIZONLINE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LAB_231_QUIZONLINE_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LAB_231_QUIZONLINE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET ANSI_NULLS OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET ANSI_PADDING OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET ARITHABORT OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET  DISABLE_BROKER
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET  READ_WRITE
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET RECOVERY SIMPLE
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET  MULTI_USER
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [LAB_231_QUIZONLINE] SET DB_CHAINING OFF
GO
USE [LAB_231_QUIZONLINE]
GO
/****** Object:  ForeignKey [FK_tblUsers_tblRoles]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblUsers] DROP CONSTRAINT [FK_tblUsers_tblRoles]
GO
/****** Object:  ForeignKey [FK_tblQuestion_tblSubjects]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblQuestion] DROP CONSTRAINT [FK_tblQuestion_tblSubjects]
GO
/****** Object:  ForeignKey [FK_tblScores_tblUsers]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblScores] DROP CONSTRAINT [FK_tblScores_tblUsers]
GO
/****** Object:  ForeignKey [FK_tblQuizDetails_tblQuestion]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblQuizDetails] DROP CONSTRAINT [FK_tblQuizDetails_tblQuestion]
GO
/****** Object:  ForeignKey [FK_tblQuizDetails_tblScores]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblQuizDetails] DROP CONSTRAINT [FK_tblQuizDetails_tblScores]
GO
/****** Object:  Table [dbo].[tblQuizDetails]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblQuizDetails] DROP CONSTRAINT [FK_tblQuizDetails_tblQuestion]
GO
ALTER TABLE [dbo].[tblQuizDetails] DROP CONSTRAINT [FK_tblQuizDetails_tblScores]
GO
DROP TABLE [dbo].[tblQuizDetails]
GO
/****** Object:  Table [dbo].[tblScores]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblScores] DROP CONSTRAINT [FK_tblScores_tblUsers]
GO
DROP TABLE [dbo].[tblScores]
GO
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblQuestion] DROP CONSTRAINT [FK_tblQuestion_tblSubjects]
GO
DROP TABLE [dbo].[tblQuestion]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblUsers] DROP CONSTRAINT [FK_tblUsers_tblRoles]
GO
DROP TABLE [dbo].[tblUsers]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 02/19/2021 20:39:18 ******/
DROP TABLE [dbo].[tblRoles]
GO
/****** Object:  Table [dbo].[tblSubjects]    Script Date: 02/19/2021 20:39:18 ******/
DROP TABLE [dbo].[tblSubjects]
GO
/****** Object:  Table [dbo].[tblSubjects]    Script Date: 02/19/2021 20:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubjects](
	[subjectID] [varchar](50) NOT NULL,
	[subjectName] [varchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblSubjects] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblSubjects] ([subjectID], [subjectName], [status]) VALUES (N'PRJ321', N'Java Web ', 1)
INSERT [dbo].[tblSubjects] ([subjectID], [subjectName], [status]) VALUES (N'PRN292', N'C#', 1)
INSERT [dbo].[tblSubjects] ([subjectID], [subjectName], [status]) VALUES (N'SWR302', N'Software Requirement', 1)
INSERT [dbo].[tblSubjects] ([subjectID], [subjectName], [status]) VALUES (N'SWT302', N'Software Testing', 0)
/****** Object:  Table [dbo].[tblRoles]    Script Date: 02/19/2021 20:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] NOT NULL,
	[roleName] [varchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (1, N'admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (2, N'student')
/****** Object:  Table [dbo].[tblUsers]    Script Date: 02/19/2021 20:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](256) NULL,
	[status] [bit] NULL,
	[role] [int] NULL,
	[fullName] [varchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblUsers] ([username], [password], [status], [role], [fullName]) VALUES (N'adminStudent', N'60a6ca8f9a7fbd5ae760f1da298dea24b6b900417e42085d809fc95e8bb36688', 1, 1, N'This is Teacher')
INSERT [dbo].[tblUsers] ([username], [password], [status], [role], [fullName]) VALUES (N'letienloc', N'b974d2908d7ea81a0f7434a6df3b5a2d773148f440204169316724138d6b170f', 1, 2, N'Le Tien Loc')
INSERT [dbo].[tblUsers] ([username], [password], [status], [role], [fullName]) VALUES (N'student', N'264c8c381bf16c982a4e59b0dd4c6f7808c51a05f64c35db42cc78a2a72875bb', 1, 2, N'Student')
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 02/19/2021 20:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblQuestion](
	[questionID] [varchar](50) NOT NULL,
	[answer_correct] [varchar](200) NULL,
	[dateOfCreate] [datetime] NULL,
	[subjectID] [varchar](50) NULL,
	[status] [bit] NULL,
	[question_content] [varchar](200) NULL,
	[answer_option1] [varchar](200) NULL,
	[answer_option2] [varchar](200) NULL,
	[answer_option3] [varchar](200) NULL,
	[answer_option4] [varchar](200) NULL,
 CONSTRAINT [PK_tblQuestion_1] PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q01', N'Gia Lai', CAST(0x0000ACC101391C40 AS DateTime), N'PRJ321', 1, N'What is the capital of VietNam', N'Ha Noi', N'Ho Chi Minh', N'Gia Lai', N'Da Nang')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q02', N'Java', NULL, N'PRJ321', 1, N'What is the first Language you learn', N'C#', N'Java', N'Python', N'Ruby')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q03', N'C#', NULL, N'SWT302', 1, N'What is your name?', N'Loc', N'Messi', N'Ronaldo', N'Robinho')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q05', N'Compilation', NULL, N'PRJ321', 0, N'Which of the following is not OOPS concept in Java', N'Inheritance', N'Encapsulation', N'Polymorphism', N'Compilation')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q07', N'At compile time', NULL, N'PRJ321', 1, N'When does method overloading is determined?', N'At run time', N'At compile time', N'At coding time', N'At execution time')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q100', N'Thay Hoang', CAST(0x0000ACD4014F36FF AS DateTime), N'SWR302', 1, N'Who was taught you the Software Requirement? ', N'Thay Hoang', N'Thay Khanh', N'Thay Hoa', N'Thay Thanh')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q108', N'', CAST(0x0000ACD3015A72C4 AS DateTime), N'PRJ321', 0, N'aaaa', N'a', N'b', N'c', N'd')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q11', N'parameterized types', NULL, N'PRN292', 1, N'What is meant by the term generics?', N'parameterized types', N'class', N'structure', N'interface')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q115', N'Tui ko biet', CAST(0x0000ACD3015D88D4 AS DateTime), N'PRJ321', 1, N'Cach nay la sao', N'Tui biet lam', N'Tui ko biet', N'Tui chiu', N'De om')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q22', N'Use of pointers', NULL, N'PRJ321', 0, N'Which of the following is not a Java features?', N'Dynamic', N'Architecture Neutral', N'Use of pointers', N'Object-oriented')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q25', N'0xnf029L', NULL, N'PRJ321', 1, N'Which of the following is a valid long literal?', N'ABH8097', N'L990023', N'904423', N'0xnf029L')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q26', N'Infinity', NULL, N'PRJ321', 1, N'What does the expression float a = 35 / 0 return?', N'Not a Number', N'0', N'Infinity', N'Run time exception')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q30', N'Javadoc tool', NULL, N'PRJ321', 1, N'Which of the following tool is used to generate API documentation in HTML format from doc comments in source code?', N'javap tool', N'javaw command', N'Javadoc tool', N'javah command')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q31', N'for ( int i = 99; i >= 0; i / 9 )', NULL, N'PRJ321', 1, N'Which of the following for loop declaration is not valid?', N'for ( int i = 99; i >= 0; i / 9 )', N'for ( int i = 7; i <= 77; i += 7 )', N'for ( int i = 20; i >= 2; - -i )', N'for ( int i = 2; i <= 20; i = 2* i )')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q32', N'getName()', NULL, N'PRJ321', 1, N'Which method of the Class.class is used to determine the name of a class represented by the class object as a String?', N'getClass()', N'intern()', N'getName()', N'toString()')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q33', N'Variable Shadowing', NULL, N'PRJ321', 1, N'In which process, a local variable has the same name as one of the instance variables?', N'Serialization', N'Variable Shadowing', N'Abstraction', N'Multi-threading')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q34', N'It has no class name', NULL, N'PRJ321', 1, N'Which of the following is true about the anonymous inner class?', N'It has only methods', N'Objects cant be created', N'It has a fixed class name', N'It has no class name')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q35', N'java.util package', NULL, N'PRJ321', 1, N'Which package contains the Random class?', N'java.lang package', N'java.util package', N'java.io package', N'java.awt package')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q36', N'An object that has no reference.', NULL, N'PRJ321', 1, N'What do you mean by nameless objects?', N'An object created by using the new keyword.', N'An object of a superclass created in the subclass.', N'An object without having any name but having a reference.', N'An object that has no reference.')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q37', N'Marker Interface', NULL, N'PRJ321', 1, N'An interface with no fields or methods is known as a ______.', N'Runnable Interface', N'Marker Interface', N'Abstract Interface', N'CharSequence Interface')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q38', N'Applet class', NULL, N'PRJ321', 1, N'Which of the following is an immediate subclass of the Panel class?', N'Applet class', N'Window class', N'Frame class', N'Dialog class')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q39', N'A final class cannot extend other classes.', NULL, N'PRJ321', 1, N'Which option is false about the final keyword?', N'A final method cannot be overridden in its subclasses.', N'A final class cannot be extended.', N'A final class cannot extend other classes.', N'A final method can be inherited.')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q40', N'Error and Exception class', NULL, N'PRJ321', 1, N'Which of these classes are the direct subclasses of the Throwable class?', N'RuntimeException and Error class', N'Exception and VirtualMachineError class', N'Error and Exception class', N'IOException and VirtualMachineError class')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q41', N'An exception caused by other exceptions', NULL, N'PRJ321', 1, N'What do you mean by chained exceptions in Java?', N'Exceptions occurred by the VirtualMachineError', N'An exception caused by other exceptions', N'Exceptions occur in chains with discarding the debugging information', N'None of the above')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q42', N'Heap memory', NULL, N'PRJ321', 1, N'In which memory a String is stored, when we create a string using new operator?', N'Stack', N'String memory', N'Heap memory', N'Random storage space')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q43', N'It returns the existing string from memory', NULL, N'PRJ321', 1, N'What is the use of the intern() method?', N'It returns the existing string from memory', N'It creates a new string in the database', N'It modifies the existing string in the database', N'None of the above')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q44', N'Remote interface', NULL, N'PRJ321', 1, N'Which of the following is a marker interface?', N'Runnable interface', N'Remote interface', N'Readable interface', N'Result interface')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q45', N'strictfp', NULL, N'PRJ321', 1, N'Which of the following is a reserved keyword in Java?', N'object', N'strictfp', N'main', N'system')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q46', N'import', NULL, N'PRJ321', 1, N'Which keyword is used for accessing the features of a package?', N'package', N'import', N'extends', N'export')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q47', N'None of the above', NULL, N'PRJ321', 1, N'In java, jar stands for_____.', N'Java Archive Runner', N'Java Application Resource', N'Java Application Runner', N'None of the above')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q48', N'java.lang.StringBuilder', NULL, N'PRJ321', 1, N'Which of the following is a mutable class in java?', N'java.lang.String', N'java.lang.Byte', N'java.lang.Short', N'java.lang.StringBuilder')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q49', N'Multiple threads', NULL, N'PRJ321', 1, N'How many threads can be executed at a time?', N'Only one thread', N'Multiple threads', N'Only main (main() method) thread', N'Two threads')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q50', N'It does not release any locks.', NULL, N'PRJ321', 1, N'If a thread goes to sleep', N'It releases all the locks it has.', N'It does not release any locks.', N'It releases half of its locks.', N'It releases all of its lock except one.')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q60', N'I dont know', NULL, N'SWT302', 0, N'What is software testing', N'I dont know', N'Yeah I know', N'Easy', N'Hard')
INSERT [dbo].[tblQuestion] ([questionID], [answer_correct], [dateOfCreate], [subjectID], [status], [question_content], [answer_option1], [answer_option2], [answer_option3], [answer_option4]) VALUES (N'q61', N'When a value type is converted to object type, it is called boxing.', CAST(0x0000ACC7009A490C AS DateTime), N'PRJ321', 1, N'Which of the following defines boxing correctly?', N'When a value type is converted to object type, it is called boxing.', N'When an object type is converted to a value type, it is called boxing.', N'Both of the above.', N'None of the above.')
/****** Object:  Table [dbo].[tblScores]    Script Date: 02/19/2021 20:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScores](
	[username] [varchar](50) NULL,
	[totalScore] [int] NULL,
	[scoreID] [varchar](50) NOT NULL,
	[DateOfCreate] [datetime] NULL,
	[subjectName] [varchar](50) NULL,
 CONSTRAINT [PK_tblScores] PRIMARY KEY CLUSTERED 
(
	[scoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblScores] ([username], [totalScore], [scoreID], [DateOfCreate], [subjectName]) VALUES (N'letienloc', 2, N'letienloc-05d668eb-7f59-4ac9-9723-9a15d5f72d81', CAST(0x0000ACD40102D161 AS DateTime), N'Java Web ')
INSERT [dbo].[tblScores] ([username], [totalScore], [scoreID], [DateOfCreate], [subjectName]) VALUES (N'letienloc', 2, N'letienloc-332e1ff3-ca2b-45f7-a81f-b94e43d3642a', CAST(0x0000ACD40102B57C AS DateTime), N'Java Web ')
INSERT [dbo].[tblScores] ([username], [totalScore], [scoreID], [DateOfCreate], [subjectName]) VALUES (N'letienloc', 1, N'letienloc-5018a422-13bf-4daa-b76a-aa256a814106', CAST(0x0000ACD40151F5E6 AS DateTime), N'C#')
INSERT [dbo].[tblScores] ([username], [totalScore], [scoreID], [DateOfCreate], [subjectName]) VALUES (N'letienloc', 1, N'letienloc-60893e9a-9f31-49fb-85f5-4d7db62cfcdc', CAST(0x0000ACD4014F7C8E AS DateTime), N'Software Requirement')
INSERT [dbo].[tblScores] ([username], [totalScore], [scoreID], [DateOfCreate], [subjectName]) VALUES (N'letienloc', 2, N'letienloc-90b2f48d-71fd-47d6-bb6d-3618a24da2a2', CAST(0x0000ACD40106A23D AS DateTime), N'Java Web ')
INSERT [dbo].[tblScores] ([username], [totalScore], [scoreID], [DateOfCreate], [subjectName]) VALUES (N'letienloc', 7, N'letienloc-af1f0b00-6cff-4f64-8267-c40799fafe9d', CAST(0x0000ACD401521825 AS DateTime), N'Java Web ')
/****** Object:  Table [dbo].[tblQuizDetails]    Script Date: 02/19/2021 20:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblQuizDetails](
	[quizDetailID] [varchar](50) NOT NULL,
	[scoreID] [varchar](50) NULL,
	[questionID] [varchar](50) NULL,
	[chooseAnswer] [varchar](200) NULL,
 CONSTRAINT [PK_tblQuizDetails] PRIMARY KEY CLUSTERED 
(
	[quizDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'05d668eb-7f59-4ac9-9723-9a15d5f72d81-details-0', N'letienloc-05d668eb-7f59-4ac9-9723-9a15d5f72d81', N'q61', N'When an object type is converted to a value type, it is called boxing.')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'05d668eb-7f59-4ac9-9723-9a15d5f72d81-details-1', N'letienloc-05d668eb-7f59-4ac9-9723-9a15d5f72d81', N'q30', N'Javadoc tool')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'05d668eb-7f59-4ac9-9723-9a15d5f72d81-details-2', N'letienloc-05d668eb-7f59-4ac9-9723-9a15d5f72d81', N'q50', N'It does not release any locks.')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'332e1ff3-ca2b-45f7-a81f-b94e43d3642a-details-0', N'letienloc-332e1ff3-ca2b-45f7-a81f-b94e43d3642a', N'q34', N'Objects cant be created')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'332e1ff3-ca2b-45f7-a81f-b94e43d3642a-details-1', N'letienloc-332e1ff3-ca2b-45f7-a81f-b94e43d3642a', N'q26', N'Infinity')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'332e1ff3-ca2b-45f7-a81f-b94e43d3642a-details-2', N'letienloc-332e1ff3-ca2b-45f7-a81f-b94e43d3642a', N'q115', N'Tui ko biet')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'5018a422-13bf-4daa-b76a-aa256a814106-details-0', N'letienloc-5018a422-13bf-4daa-b76a-aa256a814106', N'q11', N'parameterized types')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'60893e9a-9f31-49fb-85f5-4d7db62cfcdc-details-0', N'letienloc-60893e9a-9f31-49fb-85f5-4d7db62cfcdc', N'q100', N'Thay Hoang')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'90b2f48d-71fd-47d6-bb6d-3618a24da2a2-details-0', N'letienloc-90b2f48d-71fd-47d6-bb6d-3618a24da2a2', N'q41', N'Exceptions occur in chains with discarding the debugging information')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'90b2f48d-71fd-47d6-bb6d-3618a24da2a2-details-1', N'letienloc-90b2f48d-71fd-47d6-bb6d-3618a24da2a2', N'q25', N'0xnf029L')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'90b2f48d-71fd-47d6-bb6d-3618a24da2a2-details-2', N'letienloc-90b2f48d-71fd-47d6-bb6d-3618a24da2a2', N'q32', N'getName()')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'af1f0b00-6cff-4f64-8267-c40799fafe9d-details-0', N'letienloc-af1f0b00-6cff-4f64-8267-c40799fafe9d', N'q31', N'for ( int i = 99; i >= 0; i / 9 )')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'af1f0b00-6cff-4f64-8267-c40799fafe9d-details-1', N'letienloc-af1f0b00-6cff-4f64-8267-c40799fafe9d', N'q25', N'0xnf029L')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'af1f0b00-6cff-4f64-8267-c40799fafe9d-details-2', N'letienloc-af1f0b00-6cff-4f64-8267-c40799fafe9d', N'q46', N'import')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'af1f0b00-6cff-4f64-8267-c40799fafe9d-details-3', N'letienloc-af1f0b00-6cff-4f64-8267-c40799fafe9d', N'q108', N'a')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'af1f0b00-6cff-4f64-8267-c40799fafe9d-details-4', N'letienloc-af1f0b00-6cff-4f64-8267-c40799fafe9d', N'q43', N'It creates a new string in the database')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'af1f0b00-6cff-4f64-8267-c40799fafe9d-details-5', N'letienloc-af1f0b00-6cff-4f64-8267-c40799fafe9d', N'q50', N'It does not release any locks.')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'af1f0b00-6cff-4f64-8267-c40799fafe9d-details-6', N'letienloc-af1f0b00-6cff-4f64-8267-c40799fafe9d', N'q26', N'Infinity')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'af1f0b00-6cff-4f64-8267-c40799fafe9d-details-7', N'letienloc-af1f0b00-6cff-4f64-8267-c40799fafe9d', N'q47', N'None of the above')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'af1f0b00-6cff-4f64-8267-c40799fafe9d-details-8', N'letienloc-af1f0b00-6cff-4f64-8267-c40799fafe9d', N'q45', N'strictfp')
INSERT [dbo].[tblQuizDetails] ([quizDetailID], [scoreID], [questionID], [chooseAnswer]) VALUES (N'af1f0b00-6cff-4f64-8267-c40799fafe9d-details-9', N'letienloc-af1f0b00-6cff-4f64-8267-c40799fafe9d', N'q07', N'At run time')
/****** Object:  ForeignKey [FK_tblUsers_tblRoles]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([role])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
/****** Object:  ForeignKey [FK_tblQuestion_tblSubjects]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestion_tblSubjects] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[tblQuestion] CHECK CONSTRAINT [FK_tblQuestion_tblSubjects]
GO
/****** Object:  ForeignKey [FK_tblScores_tblUsers]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblScores]  WITH CHECK ADD  CONSTRAINT [FK_tblScores_tblUsers] FOREIGN KEY([username])
REFERENCES [dbo].[tblUsers] ([username])
GO
ALTER TABLE [dbo].[tblScores] CHECK CONSTRAINT [FK_tblScores_tblUsers]
GO
/****** Object:  ForeignKey [FK_tblQuizDetails_tblQuestion]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblQuizDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblQuizDetails_tblQuestion] FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuestion] ([questionID])
GO
ALTER TABLE [dbo].[tblQuizDetails] CHECK CONSTRAINT [FK_tblQuizDetails_tblQuestion]
GO
/****** Object:  ForeignKey [FK_tblQuizDetails_tblScores]    Script Date: 02/19/2021 20:39:18 ******/
ALTER TABLE [dbo].[tblQuizDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblQuizDetails_tblScores] FOREIGN KEY([scoreID])
REFERENCES [dbo].[tblScores] ([scoreID])
GO
ALTER TABLE [dbo].[tblQuizDetails] CHECK CONSTRAINT [FK_tblQuizDetails_tblScores]
GO
