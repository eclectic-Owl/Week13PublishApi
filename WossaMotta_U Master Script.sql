USE [master]
GO
/****** Object:  Database [WossaMotta_U]    Script Date: 4/9/2022 1:05:17 AM ******/
CREATE DATABASE [WossaMotta_U]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WossaMotta_U', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WossaMotta_U.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WossaMotta_U_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WossaMotta_U_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WossaMotta_U] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WossaMotta_U].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WossaMotta_U] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WossaMotta_U] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WossaMotta_U] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WossaMotta_U] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WossaMotta_U] SET ARITHABORT OFF 
GO
ALTER DATABASE [WossaMotta_U] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WossaMotta_U] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WossaMotta_U] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WossaMotta_U] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WossaMotta_U] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WossaMotta_U] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WossaMotta_U] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WossaMotta_U] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WossaMotta_U] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WossaMotta_U] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WossaMotta_U] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WossaMotta_U] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WossaMotta_U] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WossaMotta_U] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WossaMotta_U] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WossaMotta_U] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WossaMotta_U] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WossaMotta_U] SET RECOVERY FULL 
GO
ALTER DATABASE [WossaMotta_U] SET  MULTI_USER 
GO
ALTER DATABASE [WossaMotta_U] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WossaMotta_U] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WossaMotta_U] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WossaMotta_U] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WossaMotta_U] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WossaMotta_U] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WossaMotta_U', N'ON'
GO
ALTER DATABASE [WossaMotta_U] SET QUERY_STORE = OFF
GO
USE [WossaMotta_U]
GO
/****** Object:  Table [dbo].[Class_Subjects]    Script Date: 4/9/2022 1:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Subjects](
	[Class_SubjectID] [varchar](8) NOT NULL,
	[ClassID] [varchar](8) NULL,
	[SubjectID] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Class_SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 4/9/2022 1:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [varchar](8) NOT NULL,
	[Credits] [int] NULL,
	[classRoomNumber] [varchar](25) NULL,
	[StartDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 4/9/2022 1:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[FacultyID] [varchar](8) NOT NULL,
	[Title] [varchar](40) NULL,
	[Tenure_is_checked] [bit] NULL,
	[FacFirstName] [varchar](40) NULL,
	[FacLastName] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty_Classes]    Script Date: 4/9/2022 1:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty_Classes](
	[Faculty_ClassesID] [varchar](8) NOT NULL,
	[ClassID] [varchar](8) NULL,
	[FacultyID] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Faculty_ClassesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Schedules]    Script Date: 4/9/2022 1:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Schedules](
	[ScheduleID] [varchar](8) NOT NULL,
	[ClassID] [varchar](8) NULL,
	[StudentID] [varchar](8) NULL,
	[Grade] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 4/9/2022 1:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [varchar](8) NOT NULL,
	[StudFirstName] [varchar](25) NULL,
	[StudLastName] [varchar](25) NULL,
	[StudMajor] [varchar](40) NULL,
	[StudPhone] [varchar](14) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 4/9/2022 1:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [varchar](8) NOT NULL,
	[SubjectCode] [varchar](25) NULL,
	[SubjectName] [varchar](50) NULL,
	[SubjectDescription] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Class_Subjects] ([Class_SubjectID], [ClassID], [SubjectID]) VALUES (N'CS000001', N'CL000001', N'SU000001')
INSERT [dbo].[Class_Subjects] ([Class_SubjectID], [ClassID], [SubjectID]) VALUES (N'CS000002', N'CL000019', N'SU000004')
INSERT [dbo].[Class_Subjects] ([Class_SubjectID], [ClassID], [SubjectID]) VALUES (N'CS000003', N'CL000011', N'SU000017')
INSERT [dbo].[Class_Subjects] ([Class_SubjectID], [ClassID], [SubjectID]) VALUES (N'CS000004', N'CL000013', N'SU000045')
INSERT [dbo].[Class_Subjects] ([Class_SubjectID], [ClassID], [SubjectID]) VALUES (N'CS000005', N'CL000023', N'SU000051')
GO
INSERT [dbo].[Classes] ([ClassID], [Credits], [classRoomNumber], [StartDate]) VALUES (N'CL000001', 3, N'Bulwinkle Hall 315', CAST(N'2022-08-26' AS Date))
INSERT [dbo].[Classes] ([ClassID], [Credits], [classRoomNumber], [StartDate]) VALUES (N'CL000011', 1, N'Natasha Hall', CAST(N'2022-08-25' AS Date))
INSERT [dbo].[Classes] ([ClassID], [Credits], [classRoomNumber], [StartDate]) VALUES (N'CL000013', 3, N'Badenov Center', CAST(N'2022-08-29' AS Date))
INSERT [dbo].[Classes] ([ClassID], [Credits], [classRoomNumber], [StartDate]) VALUES (N'CL000019', 3, N'Rocky Auditorium A100', CAST(N'2022-08-28' AS Date))
INSERT [dbo].[Classes] ([ClassID], [Credits], [classRoomNumber], [StartDate]) VALUES (N'CL000023', 3, N'Fearless Leader Dungeon', CAST(N'2022-09-01' AS Date))
GO
INSERT [dbo].[Faculty] ([FacultyID], [Title], [Tenure_is_checked], [FacFirstName], [FacLastName]) VALUES (N'FA000012', N'Professor Emeritus', 1, N'Jacob', N'Marley')
INSERT [dbo].[Faculty] ([FacultyID], [Title], [Tenure_is_checked], [FacFirstName], [FacLastName]) VALUES (N'FA000024', N'Instructor', 0, N'Pete', N'Fleet')
INSERT [dbo].[Faculty] ([FacultyID], [Title], [Tenure_is_checked], [FacFirstName], [FacLastName]) VALUES (N'FA000036', N'Uber Mentor', 1, N'Nora', N'Pinata')
INSERT [dbo].[Faculty] ([FacultyID], [Title], [Tenure_is_checked], [FacFirstName], [FacLastName]) VALUES (N'FA000048', N'Professor', 0, N'Sally', N'Gomez')
INSERT [dbo].[Faculty] ([FacultyID], [Title], [Tenure_is_checked], [FacFirstName], [FacLastName]) VALUES (N'FA000060', N'Teach', 0, N'Vic', N'MacBeth')
GO
INSERT [dbo].[Faculty_Classes] ([Faculty_ClassesID], [ClassID], [FacultyID]) VALUES (N'FC000001', N'CL000023', N'FA000012')
INSERT [dbo].[Faculty_Classes] ([Faculty_ClassesID], [ClassID], [FacultyID]) VALUES (N'FC000002', N'CL000013', N'FA000024')
INSERT [dbo].[Faculty_Classes] ([Faculty_ClassesID], [ClassID], [FacultyID]) VALUES (N'FC000003', N'CL000011', N'FA000036')
INSERT [dbo].[Faculty_Classes] ([Faculty_ClassesID], [ClassID], [FacultyID]) VALUES (N'FC000004', N'CL000019', N'FA000048')
INSERT [dbo].[Faculty_Classes] ([Faculty_ClassesID], [ClassID], [FacultyID]) VALUES (N'FC000005', N'CL000001', N'FA000060')
GO
INSERT [dbo].[Student_Schedules] ([ScheduleID], [ClassID], [StudentID], [Grade]) VALUES (N'SC000002', N'CL000019', N'ST000115', N'B')
INSERT [dbo].[Student_Schedules] ([ScheduleID], [ClassID], [StudentID], [Grade]) VALUES (N'SC000003', N'CL000011', N'ST000217', N'C')
INSERT [dbo].[Student_Schedules] ([ScheduleID], [ClassID], [StudentID], [Grade]) VALUES (N'SC000004', N'CL000013', N'ST000317', N'B')
INSERT [dbo].[Student_Schedules] ([ScheduleID], [ClassID], [StudentID], [Grade]) VALUES (N'SC000005', N'CL000023', N'ST000523', N'A')
GO
INSERT [dbo].[Students] ([StudentID], [StudFirstName], [StudLastName], [StudMajor], [StudPhone]) VALUES (N'ST000099', N'Buck', N'Rogers', N'Rocketry', N'(444)-555-9873')
INSERT [dbo].[Students] ([StudentID], [StudFirstName], [StudLastName], [StudMajor], [StudPhone]) VALUES (N'ST000115', N'Louisa May', N'Alcott', N'Literature', N'(448)-355-9383')
INSERT [dbo].[Students] ([StudentID], [StudFirstName], [StudLastName], [StudMajor], [StudPhone]) VALUES (N'ST000217', N'Dave', N'Bowman', N'Astronomy', N'(449)-755-3373')
INSERT [dbo].[Students] ([StudentID], [StudFirstName], [StudLastName], [StudMajor], [StudPhone]) VALUES (N'ST000317', N'Ripley', N'Just_Ripley', N'Astrophysics', N'(424)-515-9673')
INSERT [dbo].[Students] ([StudentID], [StudFirstName], [StudLastName], [StudMajor], [StudPhone]) VALUES (N'ST000523', N'Mulligan', N'Stu', N'Culinary Arts', N'(416)-165-9163')
GO
INSERT [dbo].[Subjects] ([SubjectID], [SubjectCode], [SubjectName], [SubjectDescription]) VALUES (N'SU000001', N'USH101', N'U.S. History 101', N'Required Freshman history class')
INSERT [dbo].[Subjects] ([SubjectID], [SubjectCode], [SubjectName], [SubjectDescription]) VALUES (N'SU000004', N'ENG203', N'Lyric Poetry and the Self', N'A bunch of sappy romantic poems')
INSERT [dbo].[Subjects] ([SubjectID], [SubjectCode], [SubjectName], [SubjectDescription]) VALUES (N'SU000017', N'SCI311', N'Rocketry for Dummies', N'Building rockets out of sprockets')
INSERT [dbo].[Subjects] ([SubjectID], [SubjectCode], [SubjectName], [SubjectDescription]) VALUES (N'SU000045', N'PHY031', N'Zamboni Driving Lessons', N'Learn to drive the Zamboni at the Field House Ice Rink')
INSERT [dbo].[Subjects] ([SubjectID], [SubjectCode], [SubjectName], [SubjectDescription]) VALUES (N'SU000051', N'MATH202', N'Imaginary Numbers for Dummies', N'Advanced Math targeting nooknudgies like Winston over there')
GO
ALTER TABLE [dbo].[Class_Subjects]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class_Subjects]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Faculty_Classes]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Faculty_Classes]  WITH CHECK ADD FOREIGN KEY([FacultyID])
REFERENCES [dbo].[Faculty] ([FacultyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student_Schedules]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student_Schedules]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [WossaMotta_U] SET  READ_WRITE 
GO
