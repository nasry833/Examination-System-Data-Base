USE [master]
GO
/****** Object:  Database [ExaminationSystem]    Script Date: 3/31/2024 4:47:32 PM ******/
CREATE DATABASE [ExaminationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExaminationSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExaminationSystem.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExaminationSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExaminationSystem_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExaminationSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExaminationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExaminationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExaminationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExaminationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExaminationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExaminationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExaminationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExaminationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExaminationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExaminationSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [ExaminationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ExaminationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExaminationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExaminationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExaminationSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExaminationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExaminationSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExaminationSystem', N'ON'
GO
ALTER DATABASE [ExaminationSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExaminationSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ExaminationSystem]
GO
/****** Object:  User [Trainingmanager]    Script Date: 3/31/2024 4:47:33 PM ******/
CREATE USER [Trainingmanager] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Training_manager]    Script Date: 3/31/2024 4:47:33 PM ******/
CREATE USER [Training_manager] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Student]    Script Date: 3/31/2024 4:47:33 PM ******/
CREATE USER [Student] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Instructor]    Script Date: 3/31/2024 4:47:33 PM ******/
CREATE USER [Instructor] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 3/31/2024 4:47:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[INS_ID] [int] NOT NULL,
	[Fname] [varchar](50) NULL,
	[Lname] [varchar](50) NULL,
	[Phone] [int] NULL,
	[Address] [varchar](100) NULL,
	[Gender] [varchar](10) NULL,
	[Age] [int] NULL,
	[Email] [varchar](100) NULL,
	[Dept_ID] [int] NULL,
	[Supervisor_ID] [int] NULL,
 CONSTRAINT [PK__Instruct__A3DBF5718AE300C2] PRIMARY KEY CLUSTERED 
(
	[INS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 3/31/2024 4:47:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CRS_ID] [int] NOT NULL,
	[CRS_Name] [varchar](100) NULL,
	[Min] [int] NULL,
	[Max] [int] NULL,
	[Credit_Hours] [int] NULL,
	[INS_ID] [int] NULL,
	[Track_ID] [int] NULL,
 CONSTRAINT [PK__Course__AA9750031E9148FB] PRIMARY KEY CLUSTERED 
(
	[CRS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[InstructorInfooo]    Script Date: 3/31/2024 4:47:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   view [dbo].[InstructorInfooo]
as
select Inst.[INS_ID],Inst.[Fname],Inst.[Lname],
Inst.Gender,
Inst.[Address],
Inst.[Email],
Inst.[Age],
Inst.[Phone],
COU.[CRS_Name]
from Instructor Inst join 
 Course COU
on COU.INS_ID=Inst.INS_ID
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 3/31/2024 4:47:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Exam_ID] [int] NOT NULL,
	[Total_Grade] [int] NULL,
	[NO_MCQ] [int] NULL,
	[NO_T_F] [int] NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[INS_ID] [int] NULL,
	[CRS_ID] [int] NULL,
	[IS_Normal] [int] NULL,
	[IS_Corrective] [int] NULL,
 CONSTRAINT [PK__Exam__C782CA79890919FC] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stu_CRS]    Script Date: 3/31/2024 4:47:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stu_CRS](
	[Student_ID] [int] NOT NULL,
	[Grade] [int] NULL,
	[CRS_ID] [int] NULL,
	[CRS_name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_ID] [int] NOT NULL,
	[Fname] [varchar](50) NULL,
	[Lname] [varchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Address] [varchar](100) NULL,
	[Position] [varchar](50) NULL,
	[Link] [varchar](100) NULL,
	[Freelance_status] [int] NULL,
	[Company_Name] [varchar](100) NULL,
	[Gender] [varchar](10) NULL,
	[Graduation_Year] [int] NULL,
	[Birth_Date] [date] NULL,
	[Track_ID] [int] NULL,
	[Hiring_Status] [int] NULL,
	[certificate_status] [int] NULL,
 CONSTRAINT [PK__Student__A2F4E9AC8C4BD79B] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentinCorrective]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    view [dbo].[StudentinCorrective]
as
select s.[Student_ID],
s.[Fname],
s.[Lname],
s.[Phone],
s.Track_ID,
C.[Min],
C.[CRS_Name],
STC.[Grade],
E.Exam_id
from Student s join [dbo].[Stu_CRS] STC 
on s.[Student_ID] =STC.[Student_ID] join Exam E 
on E.[CRS_ID]=STC.[CRS_ID]join Course C
on C.[CRS_ID] = E.[CRS_ID]
where STC.grade < C.[Min]
GO
/****** Object:  View [dbo].[coursePerformance]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[coursePerformance] 
as 
select C.[CRS_ID],
C.[CRS_Name],
count(STC.Student_ID) as Total_students,
Avg(STC.[Grade]) as Average_degree
From Course C join [dbo].[Stu_CRS] STC
on c.[CRS_ID] =STC.[CRS_ID]
group by C.[CRS_ID] ,C.[CRS_Name]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[Branch_ID] [int] NOT NULL,
	[Branch_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crs_Topics]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crs_Topics](
	[Crs_ID] [int] NULL,
	[Crs_Name] [nvarchar](max) NULL,
	[Topics] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dept_ID] [int] NOT NULL,
	[Dept_Name] [varchar](50) NULL,
	[Branch_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Dept_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ex_Questions]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ex_Questions](
	[Exam_ID] [int] NULL,
	[Question_ID] [int] NULL,
	[Grade] [int] NULL,
	[CRS_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Intake]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intake](
	[Intake_ID] [int] NOT NULL,
	[Intake_Duration] [date] NOT NULL,
	[Branch_ID] [int] NULL,
 CONSTRAINT [PK__Intake__D7826D7A83392435] PRIMARY KEY CLUSTERED 
(
	[Intake_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Question_ID] [int] NOT NULL,
	[Question] [varchar](max) NULL,
	[Model_Answer] [varchar](255) NULL,
	[T_F] [varchar](max) NULL,
	[MCQ] [varchar](max) NULL,
	[Grade] [int] NULL,
	[CRS_ID] [int] NULL,
 CONSTRAINT [PK__Question__B0B2E4C6F224639C] PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stu_CRS_Evaluate]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stu_CRS_Evaluate](
	[Student_ID] [int] NOT NULL,
	[CRS_ID] [int] NOT NULL,
	[Rate] [nvarchar](max) NULL,
 CONSTRAINT [PK__Stu_CRS___885D9CAC9B247067] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[CRS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stu_EX_Ans]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stu_EX_Ans](
	[exam_id] [int] NULL,
	[Student_ID] [int] NOT NULL,
	[Grade] [int] NULL,
	[Student_Answer] [varchar](255) NULL,
	[Question_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_results]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_results](
	[student_id] [int] NULL,
	[total_grade] [int] NULL,
	[result_rating] [varchar](max) NULL,
	[Exam_ID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Track]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[Track_ID] [int] NOT NULL,
	[Track_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Track_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Track_branch]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track_branch](
	[Track_id] [int] NULL,
	[Branch_id] [int] NULL,
	[branch_name] [nvarchar](max) NULL,
	[Track_name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_manager]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training_manager](
	[mgr_id] [int] IDENTITY(1,1) NOT NULL,
	[mgr_name] [nvarchar](30) NULL,
	[branch_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[mgr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Branch]    Script Date: 3/31/2024 4:47:34 PM ******/
CREATE NONCLUSTERED INDEX [Branch] ON [dbo].[Branch]
(
	[Branch_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Course]    Script Date: 3/31/2024 4:47:34 PM ******/
CREATE NONCLUSTERED INDEX [Course] ON [dbo].[Course]
(
	[CRS_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Course_Name]    Script Date: 3/31/2024 4:47:34 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Course_Name] ON [dbo].[Course]
(
	[CRS_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Instructor_Name]    Script Date: 3/31/2024 4:47:34 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Instructor_Name] ON [dbo].[Instructor]
(
	[Fname] ASC,
	[Lname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Intake_IDandName]    Script Date: 3/31/2024 4:47:34 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Intake_IDandName] ON [dbo].[Intake]
(
	[Intake_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Student_Name]    Script Date: 3/31/2024 4:47:34 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Student_Name] ON [dbo].[Student]
(
	[Fname] ASC,
	[Lname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Student_company]    Script Date: 3/31/2024 4:47:34 PM ******/
CREATE NONCLUSTERED INDEX [Student_company] ON [dbo].[Student]
(
	[Company_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [student_course_table]    Script Date: 3/31/2024 4:47:34 PM ******/
CREATE NONCLUSTERED INDEX [student_course_table] ON [dbo].[Student]
(
	[Fname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [student_index]    Script Date: 3/31/2024 4:47:34 PM ******/
CREATE NONCLUSTERED INDEX [student_index] ON [dbo].[Student]
(
	[Fname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Track_IDndName]    Script Date: 3/31/2024 4:47:34 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Track_IDndName] ON [dbo].[Track]
(
	[Track_ID] ASC
)
INCLUDE([Track_Name]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Track]    Script Date: 3/31/2024 4:47:34 PM ******/
CREATE NONCLUSTERED INDEX [Track] ON [dbo].[Track]
(
	[Track_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Training_Manager_Name]    Script Date: 3/31/2024 4:47:34 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Training_Manager_Name] ON [dbo].[training_manager]
(
	[mgr_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK__Course__INS_ID__4AB81AF0] FOREIGN KEY([INS_ID])
REFERENCES [dbo].[Instructor] ([INS_ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK__Course__INS_ID__4AB81AF0]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK__Course__Track_ID__4BAC3F29] FOREIGN KEY([Track_ID])
REFERENCES [dbo].[Track] ([Track_ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK__Course__Track_ID__4BAC3F29]
GO
ALTER TABLE [dbo].[Crs_Topics]  WITH CHECK ADD  CONSTRAINT [FK_Crs_Topics_Course] FOREIGN KEY([Crs_ID])
REFERENCES [dbo].[Course] ([CRS_ID])
GO
ALTER TABLE [dbo].[Crs_Topics] CHECK CONSTRAINT [FK_Crs_Topics_Course]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([Branch_ID])
GO
ALTER TABLE [dbo].[Ex_Questions]  WITH CHECK ADD  CONSTRAINT [FK_Ex_Questions_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Ex_Questions] CHECK CONSTRAINT [FK_Ex_Questions_Exam]
GO
ALTER TABLE [dbo].[Ex_Questions]  WITH CHECK ADD  CONSTRAINT [FK_Ex_Questions_Questions1] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Questions] ([Question_ID])
GO
ALTER TABLE [dbo].[Ex_Questions] CHECK CONSTRAINT [FK_Ex_Questions_Questions1]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK__Exam__CRS_ID__52593CB8] FOREIGN KEY([CRS_ID])
REFERENCES [dbo].[Course] ([CRS_ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK__Exam__CRS_ID__52593CB8]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK__Exam__INS_ID__5165187F] FOREIGN KEY([INS_ID])
REFERENCES [dbo].[Instructor] ([INS_ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK__Exam__INS_ID__5165187F]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK__Instructo__Dept___440B1D61] FOREIGN KEY([Dept_ID])
REFERENCES [dbo].[Department] ([Dept_ID])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK__Instructo__Dept___440B1D61]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK__Instructo__Super__44FF419A] FOREIGN KEY([Supervisor_ID])
REFERENCES [dbo].[Instructor] ([INS_ID])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK__Instructo__Super__44FF419A]
GO
ALTER TABLE [dbo].[Intake]  WITH CHECK ADD  CONSTRAINT [FK__Intake__Branch_I__47DBAE45] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([Branch_ID])
GO
ALTER TABLE [dbo].[Intake] CHECK CONSTRAINT [FK__Intake__Branch_I__47DBAE45]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK__Questions__CRS_I__5629CD9C] FOREIGN KEY([CRS_ID])
REFERENCES [dbo].[Course] ([CRS_ID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK__Questions__CRS_I__5629CD9C]
GO
ALTER TABLE [dbo].[Stu_CRS]  WITH CHECK ADD  CONSTRAINT [FK__Stu_CRS__Student__5FB337D6] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Stu_CRS] CHECK CONSTRAINT [FK__Stu_CRS__Student__5FB337D6]
GO
ALTER TABLE [dbo].[Stu_CRS]  WITH CHECK ADD  CONSTRAINT [FK_Stu_CRS_Course] FOREIGN KEY([CRS_ID])
REFERENCES [dbo].[Course] ([CRS_ID])
GO
ALTER TABLE [dbo].[Stu_CRS] CHECK CONSTRAINT [FK_Stu_CRS_Course]
GO
ALTER TABLE [dbo].[Stu_CRS_Evaluate]  WITH CHECK ADD  CONSTRAINT [FK__Stu_CRS_E__CRS_I__6477ECF3] FOREIGN KEY([CRS_ID])
REFERENCES [dbo].[Course] ([CRS_ID])
GO
ALTER TABLE [dbo].[Stu_CRS_Evaluate] CHECK CONSTRAINT [FK__Stu_CRS_E__CRS_I__6477ECF3]
GO
ALTER TABLE [dbo].[Stu_CRS_Evaluate]  WITH CHECK ADD  CONSTRAINT [FK__Stu_CRS_E__Stude__6383C8BA] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Stu_CRS_Evaluate] CHECK CONSTRAINT [FK__Stu_CRS_E__Stude__6383C8BA]
GO
ALTER TABLE [dbo].[Stu_EX_Ans]  WITH CHECK ADD  CONSTRAINT [FK__Stu_EX_An__Exam___59FA5E80] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Stu_EX_Ans] CHECK CONSTRAINT [FK__Stu_EX_An__Exam___59FA5E80]
GO
ALTER TABLE [dbo].[Stu_EX_Ans]  WITH CHECK ADD  CONSTRAINT [FK__Stu_EX_An__Stude__59063A47] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Stu_EX_Ans] CHECK CONSTRAINT [FK__Stu_EX_An__Stude__59063A47]
GO
ALTER TABLE [dbo].[Stu_EX_Ans]  WITH CHECK ADD  CONSTRAINT [FK_Stu_EX_Ans_Exam] FOREIGN KEY([exam_id])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Stu_EX_Ans] CHECK CONSTRAINT [FK_Stu_EX_Ans_Exam]
GO
ALTER TABLE [dbo].[Stu_EX_Ans]  WITH CHECK ADD  CONSTRAINT [FK_Stu_EX_Ans_Questions] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Questions] ([Question_ID])
GO
ALTER TABLE [dbo].[Stu_EX_Ans] CHECK CONSTRAINT [FK_Stu_EX_Ans_Questions]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK__Student__Track_I__4E88ABD4] FOREIGN KEY([Track_ID])
REFERENCES [dbo].[Track] ([Track_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK__Student__Track_I__4E88ABD4]
GO
ALTER TABLE [dbo].[student_results]  WITH CHECK ADD  CONSTRAINT [FK_student_results_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[student_results] CHECK CONSTRAINT [FK_student_results_Exam]
GO
ALTER TABLE [dbo].[student_results]  WITH CHECK ADD  CONSTRAINT [FK_student_results_Student1] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[student_results] CHECK CONSTRAINT [FK_student_results_Student1]
GO
ALTER TABLE [dbo].[Track_branch]  WITH CHECK ADD  CONSTRAINT [FK_Track_branch_Branch] FOREIGN KEY([Branch_id])
REFERENCES [dbo].[Branch] ([Branch_ID])
GO
ALTER TABLE [dbo].[Track_branch] CHECK CONSTRAINT [FK_Track_branch_Branch]
GO
ALTER TABLE [dbo].[Track_branch]  WITH CHECK ADD  CONSTRAINT [FK_Track_branch_Track] FOREIGN KEY([Track_id])
REFERENCES [dbo].[Track] ([Track_ID])
GO
ALTER TABLE [dbo].[Track_branch] CHECK CONSTRAINT [FK_Track_branch_Track]
GO
ALTER TABLE [dbo].[training_manager]  WITH CHECK ADD FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([Branch_ID])
GO
/****** Object:  StoredProcedure [dbo].[AssignStudentToExams]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[AssignStudentToExams]
(
    @studentId INT,
    @examId INT,
    @Total_Grade INT,
    @Type INT,
    @Start_Date DATETIME,
    @End_Date DATETIME,
    @INS_ID INT,
    @new_exam_id INT
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Student WHERE Student_ID = @studentId)
    BEGIN
        PRINT 'Student does not exist';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @examId)
    BEGIN
        PRINT 'Exam does not exist';
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM [dbo].[Stu_EX_Ans] WHERE Student_ID = @studentId AND Exam_ID = @examId)
    BEGIN
        PRINT 'Student already assigned to this exam';
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @new_exam_id)
    BEGIN
        PRINT 'New exam ID already exists';
        RETURN;
    END

    -- Check if the student's result is corrective
    IF EXISTS (SELECT 1 FROM [dbo].[student_results] WHERE Student_ID = @studentId AND Exam_ID = @examId AND[result_rating] = 'corrective')
    BEGIN
        PRINT 'Student has a corrective result for this exam';
        RETURN;
    END

    DECLARE @CRS_ID_Value INT;
    SELECT @CRS_ID_Value = [CRS_ID] FROM exam WHERE Exam_ID = @examId;

    INSERT INTO Exam (Exam_ID, Total_Grade, [IS_Corrective], NO_MCQ, NO_T_F, Start_Date, End_Date, INS_ID, CRS_ID)
    VALUES (@new_exam_id, @Total_Grade, @Type, 5, 5, @Start_Date, @End_Date, @INS_ID, @CRS_ID_Value);

    PRINT 'Student added to exam successfully'; 
END;
GO
/****** Object:  StoredProcedure [dbo].[CalculateTotalGradeAndRate]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[CalculateTotalGradeAndRate]
(     
    @StudentID INT,
    @ExamID INT
)
AS 
BEGIN
    DECLARE @TotalGrade INT;
    DECLARE @Rating VARCHAR(50);

    -- Calculate total grade for the student in the specified exam
    SELECT @TotalGrade = SUM(Grade) 
    FROM Stu_EX_Ans
    WHERE Student_ID = @StudentID AND Exam_ID = @ExamID;

    -- Insert the Total_Grade and Rating into the student_results table
    INSERT INTO [dbo].[student_results] (Student_ID, Exam_ID, total_grade, result_rating)
    VALUES (@StudentID, @ExamID, @TotalGrade, 
            CASE
                WHEN @TotalGrade >= 90 THEN 'A'
                WHEN @TotalGrade >= 80 THEN 'B'
                WHEN @TotalGrade >= 70 THEN 'C'
                WHEN @TotalGrade >= 60 THEN 'D'
                ELSE 'corrective'
            END);
END;
GO
/****** Object:  StoredProcedure [dbo].[CorrectMCQQuestions]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CorrectMCQQuestions]
(
  @examID INT
)
AS
BEGIN
  -- Update student's grades for MCQ questions in the specified exam
  UPDATE Stu_EX_Ans
  SET Grade = 
      CASE 
        WHEN UPPER(Stu_EX_Ans.Student_Answer) = UPPER(Questions.Model_Answer) THEN 10 -- Correct answer
        ELSE 0 -- Incorrect answer
      END
  FROM Stu_EX_Ans
  INNER JOIN Questions ON Stu_EX_Ans.Question_ID = Questions.Question_ID
  WHERE Stu_EX_Ans.Exam_ID = @examID;
 -- Filter by Exam_ID and Course_ID

END;
GO
/****** Object:  StoredProcedure [dbo].[Course_evaluation]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Course_evaluation] 
(
    @st_id INT,
    @Crd_id INT,
    @rating VARCHAR(50)
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Student] WHERE [Student_ID] = @st_id)
    BEGIN
        PRINT 'Student does not exist';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM [dbo].[Course] WHERE [CRS_ID] = @Crd_id)
    BEGIN
        PRINT 'Course does not exist';
        RETURN;
    END

    INSERT INTO [dbo].[Stu_CRS_Evaluate] ([Student_ID], [CRS_ID], [Rate])
    SELECT @st_id, @Crd_id, @rating
    WHERE NOT EXISTS (SELECT 1 FROM [dbo].[Stu_CRS_Evaluate] WHERE [Student_ID] = @st_id AND [CRS_ID] = @Crd_id);
END;
GO
/****** Object:  StoredProcedure [dbo].[create_manual_exam_proc]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[create_manual_exam_proc]
    @Exam_ID int OUTPUT,
    @Total_Grade int,
    @Type int,
    @Start_Date datetime,
    @End_Date datetime,
    @INS_ID int,
    @CRS_ID int,
    @MCQ_Question_IDs varchar(MAX),
    @T_F_Question_IDs varchar(MAX)
AS
BEGIN
    -- Generate a unique Exam_ID
    DECLARE @ExamID int;
    SELECT @ExamID = ISNULL(MAX(Exam_ID), 0) + 1 FROM Exam;

    -- Check if the provided Instructor ID exists
    IF NOT EXISTS (SELECT 1 FROM Instructor WHERE INS_ID = @INS_ID)
    BEGIN
        PRINT 'Instructor does not exist';
        RETURN;
    END;

    -- Check if the provided Course ID exists
    IF NOT EXISTS (SELECT 1 FROM Course WHERE CRS_ID = @CRS_ID)
    BEGIN
        PRINT 'Course does not exist';
        RETURN;
    END;

    -- Insert exam information into the Exam table
    INSERT INTO Exam (Exam_ID, Total_Grade, [IS_Normal], NO_MCQ, NO_T_F, Start_Date, End_Date, INS_ID, CRS_ID)
    VALUES (@ExamID, @Total_Grade, @Type, 5, 5, @Start_Date, @End_Date, @INS_ID, @CRS_ID);

    -- Insert selected MCQ questions
    INSERT INTO [dbo].[Ex_Questions] (Exam_ID, Question_ID, Grade, CRS_ID)
    SELECT @ExamID, CAST(value AS int), Grade, @CRS_ID
    FROM STRING_SPLIT(@MCQ_Question_IDs, ',') 
    JOIN Questions ON CAST(value AS int) = Questions.Question_ID
    WHERE CRS_ID = @CRS_ID;

    -- Insert selected T/F questions
    INSERT INTO [dbo].[Ex_Questions] (Exam_ID, Question_ID, Grade, CRS_ID)
    SELECT @ExamID, CAST(value AS int), Grade, @CRS_ID
    FROM STRING_SPLIT(@T_F_Question_IDs, ',') 
    JOIN Questions ON CAST(value AS int) = Questions.Question_ID
    WHERE CRS_ID = @CRS_ID;

    PRINT 'Exam created successfully with selected questions';
    SET @Exam_ID = @ExamID; -- Assign the generated Exam_ID to the output parameter
END;

	DECLARE @NewExamID int;
EXEC create_manual_exam_proc 
    @Exam_ID = @NewExamID OUTPUT,
    @Total_Grade = 100,
    @Type = 1,
    @Start_Date = '2024-03-03  02:00:00'   ,
    @End_Date = '2024-03-03  04:00:00 ',
    @INS_ID = 1,
    @CRS_ID = 104,
    @MCQ_Question_IDs = '38,41,42,43,44',
    @T_F_Question_IDs = '36,37,39,40,51';

	select  ex.[CRS_ID],ex.[Question_ID],q.[Question]from  [dbo].[Ex_Questions] ex  join [dbo].[Questions]  q
	on ex.[Question_ID]=q.[Question_ID]
	where ex.[CRS_ID]=102;
GO
/****** Object:  StoredProcedure [dbo].[DeleteBranch]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBranch] ---Delete Branch
    @Branch_ID INT
AS
BEGIN
    DELETE FROM [dbo].[Branch]
    WHERE [Branch_ID] = @Branch_ID
END
exec DeleteBranch  @Branch_ID= 5010
GO
/****** Object:  StoredProcedure [dbo].[DeleteCourse]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteCourse]
    @CRS_ID INT
AS
BEGIN
    DELETE FROM [dbo].[Course]
    WHERE [CRS_ID] = @CRS_ID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDepartment]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDepartment]
    @Dept_ID INT
AS
BEGIN
    DELETE FROM [dbo].[Department]
    WHERE [Dept_ID] = @Dept_ID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteExam]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[DeleteExam] 
    @Exam_ID INT
as
begin
    delete from Exam
    where  Exam_ID = @Exam_ID;
END;
exec DeleteExam @Exam_ID=22;
GO
/****** Object:  StoredProcedure [dbo].[DeleteInstructor]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[DeleteInstructor]
    @INS_ID INT
AS
BEGIN
    DELETE FROM [dbo].[Instructor]
    WHERE [INS_ID] = @INS_ID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteIntake]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteIntake] -------delete intake 
    @Intake_ID INT
AS
BEGIN
    DELETE FROM [dbo].[Intake]
    WHERE [Intake_ID] = @Intake_ID
END
GO
/****** Object:  StoredProcedure [dbo].[deletemgr]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deletemgr] @mgr_id INT
AS
	BEGIN TRY
		DELETE FROM training_manager
		WHERE mgr_id = @mgr_id 
	END TRY
	BEGIN CATCH
		SELECT ' ERROR: NOT EXISTED VALUE '
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[DeleteQuestion]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------
CREATE   PROCEDURE [dbo].[DeleteQuestion]
    @Question_ID INT
AS
BEGIN
    DELETE FROM Questions
    WHERE Question_ID = @Question_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStudent]
    @Student_ID INT
AS
BEGIN
    DELETE FROM [dbo].[Student]
    WHERE [Student_ID] = @Student_ID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTrack]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[DeleteTrack]
    @Track_ID INT
AS
BEGIN
    DELETE FROM Track
    WHERE Track_ID = @Track_ID;
END;
 EXEC DeleteTrack @Track_ID = 9021;
GO
/****** Object:  StoredProcedure [dbo].[ExamQuestionsReport]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ExamQuestionsReport] 
    @exam_id INT
AS
SELECT DISTINCT question, [Model_Answer]from questions q
INNER JOIN  Stu_EX_Ans eq  ON  q.question_id=eq.Question_ID
WHERE  exam_id=@exam_id
GO
/****** Object:  StoredProcedure [dbo].[ExamStudentAnsReport]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ExamStudentAnsReport] @exam_id int ,@student_id int 
AS 
Select q.question , s.[Student_Answer]
from questions q inner join  Stu_EX_Ans s
on  s.Question_ID=q.question_id
where exam_id=@exam_id and Student_ID=@student_id
GO
/****** Object:  StoredProcedure [dbo].[generate_random_exam_proc]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[generate_random_exam_proc]
    @Exam_ID int ,
    @Total_Grade int,
    @Type int,
    @Start_Date datetime,
    @End_Date datetime,
    @INS_ID int,
    @CRS_ID int
AS
BEGIN
    -- Check if the provided Instructor ID exists
    IF NOT EXISTS (SELECT 1 FROM Instructor WHERE INS_ID = @INS_ID)
    BEGIN
        PRINT 'Instructor does not exist';
        RETURN;
    END

    -- Check if the provided Course ID exists
    IF NOT EXISTS (SELECT 1 FROM Course WHERE CRS_ID = @CRS_ID)
    BEGIN
        PRINT 'Course does not exist';
        RETURN;
    END

    -- Generate a unique Exam_ID
    DECLARE @ExamID int;
   SELECT @ExamID = ISNULL(MAX(Exam_ID), 0) + 1 FROM Exam;

    -- Insert exam information into the Exam table
    --INSERT INTO Exam (Exam_ID, Total_Grade, [IS_Normal], NO_MCQ, NO_T_F, Start_Date, End_Date, INS_ID, CRS_ID)
    --VALUES (@ExamID, @Total_Grade, @Type, 5, 5, @Start_Date, @End_Date, @INS_ID, @CRS_ID);

-- Select random 5 MCQ questions
INSERT INTO [dbo].[Ex_Questions] (Exam_ID, Question_ID, Grade, CRS_ID)
SELECT TOP 5 @ExamID, Question_ID, Grade, CRS_ID
FROM Questions
WHERE CRS_ID = @CRS_ID AND MCQ = 1
      AND Question_ID NOT IN (SELECT Question_ID FROM [dbo].[Ex_Questions] WHERE Exam_ID = @ExamID)
ORDER BY NEWID(); 

-- Select random 5 T/F questions
INSERT INTO [dbo].[Ex_Questions] (Exam_ID, Question_ID, Grade, CRS_ID)
SELECT TOP 5 @ExamID, Question_ID, Grade, CRS_ID
FROM Questions
WHERE CRS_ID = @CRS_ID AND T_F = 1
      AND Question_ID NOT IN (SELECT Question_ID FROM [dbo].[Ex_Questions] WHERE Exam_ID = @ExamID)
ORDER BY NEWID();


    SET @Exam_ID = @ExamID; -- Assign the generated Exam_ID to the output parameter

    PRINT 'Random exam created successfully';
END;
GO
/****** Object:  StoredProcedure [dbo].[GetDepartmentDataByID]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDepartmentDataByID]
    @Dept_ID INT
AS
BEGIN
    SELECT * FROM [dbo].[Department]
    WHERE [Dept_ID] = @Dept_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetExamDataByID]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetExamDataByID]
    @Exam_ID INT
AS
BEGIN
    SELECT * FROM [dbo].[Exam]
    WHERE [Exam_ID] = @Exam_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetExamQuestion]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetExamQuestion]
    @ExQuestion_ID INT
AS
BEGIN
    SELECT * FROM [dbo].[Ex_Questions]
    WHERE[Exam_ID] =  @ExQuestion_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetGradeStudentReport]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[GetGradeStudentReport] @st_id int 
as 
SELECT sc.Student_ID,c.crs_name , sc.Grade
FROM     stu_crs sc
INNER JOIN course c
on c.crs_id=sc.crs_id
where Student_ID=@st_id
GO
/****** Object:  StoredProcedure [dbo].[GetInstructorData]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInstructorData]
    @INS_ID INT
AS
BEGIN
    SELECT * FROM [dbo].[Instructor]
    WHERE [INS_ID] = @INS_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetIntakeDataByID]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIntakeDataByID]
    @Intake_ID INT
AS
BEGIN
    SELECT * FROM [dbo].[Intake]
    WHERE [Intake_ID] = @Intake_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetQuestionsData]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetQuestionsData]
    @Question_ID INT
AS
BEGIN
    SELECT * FROM [dbo].[Questions]
    WHERE [Question_ID] = @Question_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetStuCRSData]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStuCRSData]
    @Student_ID INT,
    @CRS_ID INT
AS
BEGIN
    SELECT * FROM [dbo].[Stu_CRS]
    WHERE [Student_ID] = @Student_ID AND [CRS_ID] = @CRS_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetStuCRSEvaluateData]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStuCRSEvaluateData]
    @Student_ID INT,
    @CRS_ID INT
AS
BEGIN
    SELECT * FROM [dbo].[Stu_CRS_Evaluate]
    WHERE [Student_ID] = @Student_ID AND [CRS_ID] = @CRS_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetStuEXAnsDataByID]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[GetStuEXAnsDataByID]
    @Student_ID INT,
    @Exam_ID INT
AS
BEGIN
    SELECT * FROM [dbo].[Stu_EX_Ans]
    WHERE [Student_ID] = @Student_ID AND [Exam_ID] = @Exam_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTrackBranch]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTrackBranch]
    @Track_ID INT
AS
BEGIN
    SELECT * FROM [dbo].[Track_branch]
    WHERE [Track_ID] = @Track_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTrackDataByID]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTrackDataByID]
    @Track_ID INT
AS
BEGIN
    SELECT * FROM [dbo].[Track]
    WHERE [Track_ID] = @Track_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBranch]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBranch] --Insert Branch

    @Branch_ID INT,
    @Branch_Name VARCHAR(50)
AS
BEGIN
    INSERT INTO [dbo].[Branch] ([Branch_ID], [Branch_Name])
    VALUES (@Branch_ID, @Branch_Name)
END
exec InsertBranch  @Branch_ID= 5010 , @Branch_Name='cairo'
GO
/****** Object:  StoredProcedure [dbo].[InsertCourse]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCourse]
    @CRS_ID INT,
    @CRS_Name VARCHAR(100),
    @Topic VARCHAR(MAX),
    @Min INT,
    @Max INT,
    @Credit_Hours INT,
    @INS_ID INT,
    @Track_ID INT
AS
BEGIN
    INSERT INTO [dbo].[Course] ([CRS_ID], [CRS_Name], [Topic], [Min], [Max], [Credit_Hours], [INS_ID], [Track_ID])
    VALUES (@CRS_ID, @CRS_Name, @Topic, @Min, @Max, @Credit_Hours, @INS_ID, @Track_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertDepartment]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDepartment]
    @Dept_ID INT,
    @Dept_Name VARCHAR(50),
    @Branch_ID INT
AS
BEGIN
    INSERT INTO [dbo].[Department] ([Dept_ID], [Dept_Name], [Branch_ID])
    VALUES (@Dept_ID, @Dept_Name, @Branch_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[insertExam]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create    Procedure [dbo].[insertExam]
    @Exam_ID INT,
    @Total_Grade INT,
    @Type INT,
    @NO_MCQ INT,
    @NO_T_F INT,
    @Start_Date DATETIME,
    @End_Date DATETIME,
    @INS_ID INT,
    @CRS_ID INT
AS
BEGIN
    INSERT INTO Exam (Exam_ID, Total_Grade, IS_Normal, NO_MCQ, NO_T_F, Start_Date, End_Date, INS_ID, CRS_ID)
    VALUES (@Exam_ID, @Total_Grade, @Type, @NO_MCQ, @NO_T_F, @Start_Date, @End_Date, @INS_ID, @CRS_ID);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertInstructor]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertInstructor]
    @INS_ID INT,
    @Fname VARCHAR(50),
    @Lname VARCHAR(50),
    @Phone INT,
    @Address VARCHAR(100),
    @Gender VARCHAR(10),
    @Age INT,
    @Email VARCHAR(100),
    @Dept_ID INT,
    @Supervisor_ID INT
AS
BEGIN
    INSERT INTO [dbo].[Instructor] ([INS_ID], [Fname], [Lname], [Phone], [Address], [Gender], [Age], [Email], [Dept_ID],
	[Supervisor_ID])
    VALUES (@INS_ID, @Fname, @Lname, @Phone, @Address, @Gender, @Age, @Email, @Dept_ID, @Supervisor_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertIntake]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertIntake] ----------------insert intake
    @Intake_ID INT,
    @Intake_Duration DATE,
    @Branch_ID INT
AS
BEGIN
    INSERT INTO [dbo].[Intake] ([Intake_ID], [Intake_Duration], [Branch_ID])
    VALUES (@Intake_ID, @Intake_Duration, @Branch_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[insertmgr]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertmgr] @mgr_name nvarchar(30) , @branch_id int 
 AS
	BEGIN TRY 
		INSERT INTO training_manager
		VALUES (  @mgr_name , @branch_id  )
	END TRY
	BEGIN CATCH
		SELECT ' ERROR : DUPLICATED VALUE '
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[InsertQuestion]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertQuestion]
    @Question_ID INT,
    @Question VARCHAR(MAX),
    @Model_Answer VARCHAR(255),
    @T_F VARCHAR(MAX),
    @MCQ VARCHAR(MAX),
    @Grade INT,
    @CRS_ID INT
AS
BEGIN
    INSERT INTO Questions (Question_ID, Question, Model_Answer, T_F, MCQ, Grade, CRS_ID)
	VALUES (@Question_ID, @Question, @Model_Answer, @T_F, @MCQ, @Grade,@CRS_ID)
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertStudent]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertStudent]
    @Student_ID INT,
    @Fname VARCHAR(50),
    @Lname VARCHAR(50),
    @Phone VARCHAR(20),
    @Address VARCHAR(100),
    @Position VARCHAR(50),
    @Link VARCHAR(100),
    @Freelance_status INT,
    @Company_Name VARCHAR(100),
    @Gender VARCHAR(10),
    @Graduation_Year INT,
    @Birth_Date DATE,
    @Track_ID INT,
    @Hiring_Status INT,
    @Certificate_Status INT
AS
BEGIN
    INSERT INTO [dbo].[Student] ([Student_ID], [Fname], [Lname], [Phone], [Address], [Position], [Link], [Freelance_status], 
	[Company_Name], [Gender], [Graduation_Year], [Birth_Date], [Track_ID], [Hiring_Status], [Certificate_Status])
    VALUES (@Student_ID, @Fname, @Lname, @Phone, @Address, @Position, @Link, @Freelance_status, @Company_Name, @Gender, 
	@Graduation_Year, @Birth_Date, @Track_ID, @Hiring_Status, @Certificate_Status)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertTrack]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTrack] --------- insert track
    @Track_ID INT,
    @Track_Name VARCHAR(50),
    @Branch_ID INT
AS
BEGIN
    INSERT INTO Track (Track_ID, Track_Name, Branch_ID)
    VALUES (@Track_ID, @Track_Name, @Branch_ID);
END;
GO
/****** Object:  StoredProcedure [dbo].[InstCrsStudReport]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROC [dbo].[InstCrsStudReport] @ins_id int 
AS
SELECT crs_name,COUNT(cs.Student_ID) as StudentCount
FROM course c inner join Stu_CRS cs
on c.CRS_ID=cs.CRS_ID
WHERE c.ins_id=@ins_id

GROUP BY crs_name
GO
/****** Object:  StoredProcedure [dbo].[proc_calc_exam_results]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_calc_exam_results] (
    @st_id int 
)
AS
BEGIN
    BEGIN TRY
        UPDATE dbo.student_results
        SET 
            total_grade = total_mark,
            result_type = CASE
                               WHEN total_mark < 60 THEN 'Failed'
                               WHEN total_mark < 70 THEN 'Fair'
                               WHEN total_mark < 80 THEN 'Good'
                               WHEN total_mark < 90 THEN 'Very Good'
                               ELSE 'Excellent'
                           END
        FROM (
            SELECT
                Student_ID,
                SUM(Grade) AS total_mark
            FROM
                dbo.Stu_EX_Ans
            GROUP BY
                Student_ID
        ) AS SOURCE
        WHERE student_results.Student_ID = SOURCE.Student_ID
        AND @st_id = SOURCE.Student_ID;
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[SaveStudentExamAnswer]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SaveStudentExamAnswer]
    @Ex_No INT,
    @Std_ID INT,
    @ques_ID NVARCHAR(MAX),
    @Std_Ans NVARCHAR(MAX),
    @student_enter_exam_date DATETIME 
AS
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM Exam WHERE Exam_ID = @Ex_No)
    BEGIN
        SELECT 'The exam does not exist' AS ErrMessage;
        RETURN;
    END
    ELSE IF NOT EXISTS (SELECT * FROM Student WHERE Student_ID = @Std_ID)
    BEGIN
        SELECT 'The student does not exist' AS ErrMessage;
        RETURN;
    END
    
    DECLARE @Counter INT = 1;
    DECLARE @ExamStart DATETIME, @ExamEnd DATETIME;
    SELECT @ExamStart = Start_Date, @ExamEnd = End_Date FROM dbo.Exam WHERE Exam_ID = @Ex_No; 
    
    IF @student_enter_exam_date < @ExamEnd
    BEGIN
        DECLARE @QuestionID INT;
        
        DECLARE @j NVARCHAR(MAX);
        SET @j = @ques_ID;

        WHILE LEN(@j) > 0
        BEGIN
            IF CHARINDEX(',', @j) > 0
                SET @QuestionID = CAST(LEFT(@j, CHARINDEX(',', @j) - 1) AS INT);
            ELSE
                SET @QuestionID = CAST(@j AS INT);

            -- Insert answer for the current question
            DECLARE @Answer NVARCHAR(1);
            SET @Answer = SUBSTRING(@Std_Ans, (@Counter - 1) * LEN(@j) + 1, LEN(@j));

            INSERT INTO dbo.Stu_EX_Ans (Student_ID, Exam_ID, Student_Answer, Question_ID)
            VALUES (@Std_ID, @Ex_No, @Answer, @QuestionID);

            PRINT 'Answer saved successfully for question ID: ' + CAST(@QuestionID AS NVARCHAR(10));
            
            -- Move to the next question
            SET @j = SUBSTRING(@j, CHARINDEX(',', @j) + 1, LEN(@j) - CHARINDEX(',', @j));
            SET @Counter = @Counter + 1;
        END
    END
    ELSE
    BEGIN
        PRINT 'Cannot access the exam, time out.';
    END
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[SaveStudentExamAnswers]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SaveStudentExamAnswers]
    @Ex_No INT,
    @Std_ID INT,
    @ques_ID INT,
    @Std_Ans NVARCHAR(MAX),
	@student_enter_exam_date DATETIME
AS
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM Exam WHERE Exam_ID = @Ex_No)
    BEGIN
        SELECT 'The exam does not exist' AS ErrMessage;
    END
    ELSE IF NOT EXISTS (SELECT * FROM Student WHERE Student_ID = @Std_ID)
    BEGIN
        SELECT 'The student does not exist' AS ErrMessage;
    END
    ELSE
    BEGIN
        DECLARE @ExamStart DATETIME, @ExamEnd DATETIME;
        SELECT @ExamStart = Start_Date, @ExamEnd = End_Date FROM dbo.Exam WHERE Exam_ID = @Ex_No; 
        IF @student_enter_exam_date < @ExamEnd
        BEGIN
            INSERT INTO dbo.Stu_EX_Ans (Student_ID, Exam_ID, Student_Answer, Question_ID)
            VALUES (@Std_ID, @Ex_No, @Std_Ans, @ques_ID);
            PRINT 'Answer saved successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Cannot access the exam, time out.';
        END
    END
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[select_students_for_exam_proc]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[select_students_for_exam_proc] 
    @Student_ID int, 
    @Exam_ID int
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Student WHERE Student_ID = @Student_ID)
    BEGIN
        PRINT 'Student does not exist';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @Exam_ID)
    BEGIN
        PRINT 'Exam does not exist';
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM [dbo].[Stu_EX_Ans] WHERE Student_ID = @Student_ID AND Exam_ID = @Exam_ID)
    BEGIN
        PRINT 'Student already assigned to this exam';
        RETURN;
    END

    -- Add student to the exam
    INSERT INTO [dbo].[Stu_EX_Ans] (Student_ID, Exam_ID) VALUES (@Student_ID, @Exam_ID);
    PRINT 'Student added to exam successfully';
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectBranch]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[SelectBranch] @Branchid INT
AS
  BEGIN TRY
    SELECT * FROM [dbo].[Branch]
    WHERE [Branch_ID] = @Branchid
    END TRY
  BEGIN CATCH
    SELECT 'ERROR : ID NOT FOUND '
    END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SelectCourse]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectCourse] @CRSid INT
AS
  BEGIN TRY
    SELECT * FROM [dbo].[Course]
    WHERE [CRS_ID]= @CRSid
    END TRY
  BEGIN CATCH
    SELECT 'ERROR : ID NOT FOUND '
    END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SelectCrs_Topic]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectCrs_Topic] @CRS_TP_id INT
AS
  BEGIN TRY
    SELECT * FROM [dbo].[Crs_Topics]
    WHERE [Crs_ID]= @CRS_TP_id
    END TRY
  BEGIN CATCH
    print 'ERROR : ID NOT FOUND '
    END CATCH
GO
/****** Object:  StoredProcedure [dbo].[selectmgr]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectmgr] @mgr_id INT
AS
	BEGIN TRY
		SELECT * FROM training_manager
		WHERE  mgr_id= @mgr_id
		END TRY
	BEGIN CATCH
		SELECT 'ERROR : ID NOT FOUND '
		END CATCH
GO
/****** Object:  StoredProcedure [dbo].[selectstudent]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[selectstudent] @stid INT
AS
  BEGIN TRY
    SELECT * FROM [dbo].[Student]
    WHERE [Student_ID] = @stid
    END TRY
  BEGIN CATCH
    SELECT 'ERROR : ID NOT FOUND '
    END CATCH
GO
/****** Object:  StoredProcedure [dbo].[stored_course_student_grades]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[stored_course_student_grades]
(
    @st_id INT
)
AS
BEGIN
    -- Check if the student exists
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Student] WHERE [Student_ID] = @st_id)
    BEGIN
        PRINT 'Student does not exist';
        RETURN;
    END

    -- Insert student grades into Stu_CRS_Evaluate
    INSERT INTO [dbo].[Stu_CRS] ([Student_ID], CRS_ID, [CRS_name], [Grade])
    SELECT @st_id, c.CRS_ID, c.CRS_Name, st.total_grade
    FROM [dbo].[student_results] st
    JOIN [dbo].[Exam] ex ON st.Exam_ID = ex.Exam_ID
    JOIN [dbo].[Course] c ON ex.CRS_ID = c.CRS_ID
    WHERE st.[Student_ID] = @st_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[StudentByTrackIDReport]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[StudentByTrackIDReport] @track_id int 
AS 
SELECT * FROM student
where track_id=@track_id
GO
/****** Object:  StoredProcedure [dbo].[UpdateBranch]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBranch] ------update Branch 
    @Branch_ID INT,
    @New_Branch_Name VARCHAR(50)
AS
BEGIN
    UPDATE [dbo].[Branch]
    SET [Branch_Name] = @New_Branch_Name
    WHERE [Branch_ID] = @Branch_ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourse]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCourse]
    @CRS_ID INT,
    @New_CRS_Name VARCHAR(100),
    @New_Topic VARCHAR(MAX),
    @New_Min INT,
    @New_Max INT,
    @New_Credit_Hours INT,
    @New_INS_ID INT,
    @New_Track_ID INT
AS
BEGIN
    UPDATE [dbo].[Course]
    SET [CRS_Name] = @New_CRS_Name,
        [Topic] = @New_Topic,
        [Min] = @New_Min,
        [Max] = @New_Max,
        [Credit_Hours] = @New_Credit_Hours,
        [INS_ID] = @New_INS_ID,
        [Track_ID] = @New_Track_ID
    WHERE [CRS_ID] = @CRS_ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDepartment]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDepartment]
    @Dept_ID INT,
    @New_Dept_Name VARCHAR(50),
    @New_Branch_ID INT
AS
BEGIN
    UPDATE [dbo].[Department]
    SET [Dept_Name] = @New_Dept_Name,
        [Branch_ID] = @New_Branch_ID
    WHERE [Dept_ID] = @Dept_ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateExam]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[UpdateExam]
    @Exam_ID INT,
    @New_Total_Grade INT,
    @New_Type  int,
    @New_NO_MCQ INT,
    @New_NO_T_F INT,
    @New_Start_Date DATETIME,
    @New_End_Date DATETIME,
    @New_INS_ID INT,
    @New_CRS_ID INT
AS
BEGIN
    UPDATE Exam
    SET Total_Grade = @New_Total_Grade,
        IS_Normal = @New_Type,
        NO_MCQ = @New_NO_MCQ,
        NO_T_F = @New_NO_T_F,
        Start_Date = @New_Start_Date,
        End_Date = @New_End_Date,
        INS_ID = @New_INS_ID,
        CRS_ID = @New_CRS_ID
    WHERE Exam_ID = @Exam_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateInstructor]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateInstructor]
    @INS_ID INT,
    @New_Fname VARCHAR(50),
    @New_Lname VARCHAR(50),
    @New_Phone INT,
    @New_Address VARCHAR(100),
    @New_Gender VARCHAR(10),
    @New_Age INT,
    @New_Email VARCHAR(100),
    @New_Dept_ID INT,
    @New_Supervisor_ID INT
AS
BEGIN
    UPDATE [dbo].[Instructor]
    SET [Fname] = @New_Fname,
        [Lname] = @New_Lname,
        [Phone] = @New_Phone,
        [Address] = @New_Address,
        [Gender] = @New_Gender,
        [Age] = @New_Age,
        [Email] = @New_Email,
        [Dept_ID] = @New_Dept_ID,
        [Supervisor_ID] = @New_Supervisor_ID
    WHERE [INS_ID] = @INS_ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIntake]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateIntake] ---------update intake 
    @Intake_ID INT,
    @New_Intake_Duration DATE,
    @New_Branch_ID INT
AS
BEGIN
    UPDATE [dbo].[Intake]
    SET [Intake_Duration] = @New_Intake_Duration,
        [Branch_ID] = @New_Branch_ID
    WHERE [Intake_ID] = @Intake_ID
END
GO
/****** Object:  StoredProcedure [dbo].[updatemgr]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create   PROC [dbo].[updatemgr] @mgr_id int , @mgr_name nvarchar(30) , @branch_id int 
AS
	BEGIN TRY
		UPDATE training_manager
		SET	
		 mgr_name=@mgr_name ,  branch_id= @branch_id

		Where  mgr_id=@mgr_id
		END TRY
	BEGIN CATCH
		SELECT ' ERROR: NOT EXISTED VALUE '
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateQuestion]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateQuestion]
    @Question_ID INT,
    @New_Question VARCHAR(MAX),
    @New_Model_Answer VARCHAR(255),
    @New_T_F VARCHAR(MAX),
    @New_MCQ VARCHAR(MAX),
    @New_Grade INT,
    @New_CRS_ID INT
AS
BEGIN
    UPDATE Questions
    SET Question = @New_Question,
        Model_Answer = @New_Model_Answer,
        T_F = @New_T_F,
        MCQ = @New_MCQ,
        Grade = @New_Grade,
   
        CRS_ID = @New_CRS_ID
    WHERE Question_ID = @Question_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudent]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStudent]
    @Student_ID INT,
    @New_Fname VARCHAR(50),
    @New_Lname VARCHAR(50),
    @New_Phone VARCHAR(20),
    @New_Address VARCHAR(100),
    @New_Position VARCHAR(50),
    @New_Link VARCHAR(100),
    @New_Freelance_status INT,
    @New_Company_Name VARCHAR(100),
    @New_Gender VARCHAR(10),
    @New_Graduation_Year INT,
    @New_Birth_Date DATE,
    @New_Track_ID INT,
    @New_Hiring_Status INT,
    @New_Certificate_Status INT
AS
BEGIN
    UPDATE [dbo].[Student]
    SET [Fname] = @New_Fname,
        [Lname] = @New_Lname,
        [Phone] = @New_Phone,
        [Address] = @New_Address,
        [Position] = @New_Position,
        [Link] = @New_Link,
        [Freelance_status] = @New_Freelance_status,
        [Company_Name] = @New_Company_Name,
        [Gender] = @New_Gender,
        [Graduation_Year] = @New_Graduation_Year,
        [Birth_Date] = @New_Birth_Date,
        [Track_ID] = @New_Track_ID,
        [Hiring_Status] = @New_Hiring_Status,
        [Certificate_Status] = @New_Certificate_Status
    WHERE [Student_ID] = @Student_ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTrack]    Script Date: 3/31/2024 4:47:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTrack]
    @Track_ID INT,
    @New_Track_Name VARCHAR(50),
    @New_Branch_ID INT
AS
BEGIN
    UPDATE Track
    SET Track_Name = @New_Track_Name,
        Branch_ID = @New_Branch_ID
    WHERE Track_ID = @Track_ID;
END;
GO
USE [master]
GO
ALTER DATABASE [ExaminationSystem] SET  READ_WRITE 
GO
