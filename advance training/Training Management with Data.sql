USE [TrainingManagementHexaware]
GO
/****** Object:  Table [dbo].[Batches]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batches](
	[BatchId] [int] IDENTITY(1,1) NOT NULL,
	[BatchName] [varchar](40) NULL,
	[StartDate] [date] NULL,
	[TentativeEndDate] [date] NULL,
	[EndDate] [date] NULL,
	[Fees] [float] NULL,
	[FeesPaid] [float] NULL,
	[Duration] [float] NULL,
	[HoursTaken] [float] NULL,
	[Status] [varchar](200) NULL,
	[Details] [text] NULL,
	[Remarks] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colleges]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colleges](
	[CollegeId] [int] IDENTITY(1,1) NOT NULL,
	[CollegeName] [varchar](100) NULL,
	[Location] [varchar](100) NULL,
	[Remarks] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[CollegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainees]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainees](
	[TraineeId] [int] IDENTITY(1,1) NOT NULL,
	[BatchId] [int] NULL,
	[CollegeId] [int] NULL,
	[TraineeName] [varchar](40) NULL,
	[TraineeLocation] [varchar](40) NULL,
	[Email] [varchar](40) NULL,
	[Phone] [varchar](15) NULL,
	[Discontinue] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[TraineeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TraineesView]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TraineesView] as
select 
            TraineeId,
            TraineeName,
            TraineeLocation,
            Email,
            Phone,
            CollegeName,
            BatchName,
            Trainees.BatchId,
            Trainees.CollegeId         from Trainees join Colleges on Trainees.CollegeId = Colleges.CollegeId
        join Batches on Batches.BatchId = Trainees.BatchId
        where Trainees.Discontinue != 'y' or Trainees.Discontinue is null;
GO
/****** Object:  View [dbo].[vwTrainees]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vwTrainees]
as
select 
			TraineeId,
			TraineeName,
			TraineeLocation,
			Email,
			Phone,
			CollegeName,
			BatchName,
			Trainees.BatchId,
			Trainees.CollegeId

		from Trainees join Colleges on Trainees.CollegeId = Colleges.CollegeId
		join Batches on Batches.BatchId = Trainees.BatchId
GO
/****** Object:  Table [dbo].[BatchDetails]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchDetails](
	[BatchDetailId] [int] IDENTITY(1,1) NOT NULL,
	[BatchId] [int] NULL,
	[Date] [date] NULL,
	[HoursTaken] [float] NULL,
	[TopicsTaken] [text] NULL,
	[Remarks] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[BatchDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluations]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluations](
	[EvaluationId] [int] IDENTITY(1,1) NOT NULL,
	[BatchId] [int] NULL,
	[EvaluationName] [varchar](50) NULL,
	[Date] [date] NULL,
	[Topic] [varchar](50) NULL,
	[Question] [text] NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[EvaluationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[FacultyId] [int] IDENTITY(1,1) NOT NULL,
	[FacultyName] [varchar](40) NULL,
	[Remarks] [text] NULL,
	[Discontinue] [char](1) NULL,
 CONSTRAINT [PK__Facultie__306F630EFF9EE777] PRIMARY KEY CLUSTERED 
(
	[FacultyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacultiesSubjects]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultiesSubjects](
	[FacultySubjectId] [int] IDENTITY(1,1) NOT NULL,
	[FacultyId] [int] NULL,
	[SubjectId] [int] NULL,
	[Remarks] [text] NULL,
	[Discontinue] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[FacultySubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeesDetails]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeesDetails](
	[FeesId] [int] IDENTITY(1,1) NOT NULL,
	[BatchId] [int] NULL,
	[Date] [date] NULL,
	[Amount] [float] NULL,
	[Remarks] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](40) NULL,
	[Remarks] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraineeAssignments]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraineeAssignments](
	[AssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[TraineeId] [int] NULL,
	[Asssignment] [varchar](50) NULL,
	[Score] [float] NULL,
	[Remarks] [text] NULL,
	[Status] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraineeEvaluations]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraineeEvaluations](
	[TraineeEvaluationId] [int] IDENTITY(1,1) NOT NULL,
	[EvaluationId] [int] NULL,
	[TraineeId] [int] NULL,
	[Score] [float] NULL,
	[Remarks] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[TraineeEvaluationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](40) NOT NULL,
	[Password] [varchar](40) NOT NULL,
	[Role] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BatchDetails] ON 

INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (1, 28, CAST(N'2023-03-14' AS Date), 4, N'mvc', N'mvc')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (2, 2, CAST(N'2023-03-14' AS Date), 2, N'asp', N'asp')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (3, 1, CAST(N'2023-03-14' AS Date), 4, N'.net framework', N'mvc')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (4, 2, CAST(N'2023-03-14' AS Date), 2, N'asp', N'asp')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (5, 2, CAST(N'2023-03-14' AS Date), 1, N'asp', N'asp')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (6, 36, CAST(N'2023-03-14' AS Date), 4, N'mvc', N'mvc')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (7, 1, CAST(N'2023-03-14' AS Date), 2, N'sql', N'sql')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (8, 37, CAST(N'2023-03-14' AS Date), 2, N'.net core', N'ef')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (9, 37, CAST(N'2023-03-15' AS Date), 2, N'react', N'react')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (10, 1, CAST(N'2023-03-13' AS Date), 2, N'angular', N'angular')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (11, 38, CAST(N'2023-03-14' AS Date), 6, N'JWT', N'FIRST CLASS')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (1011, 1, CAST(N'2023-03-22' AS Date), 3, N'Project Evaluation', N'Final Evaluation')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (1012, 1, CAST(N'2023-03-22' AS Date), 4, N'Project Evaluation', N'Final Evaluation')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (1013, 2, CAST(N'2023-03-16' AS Date), 3, N'JWT', N'rr')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (1014, 1, CAST(N'2023-03-22' AS Date), 4, N'react', N'12')
INSERT [dbo].[BatchDetails] ([BatchDetailId], [BatchId], [Date], [HoursTaken], [TopicsTaken], [Remarks]) VALUES (1015, 1, CAST(N'2023-03-23' AS Date), 2, N'as', N'asd')
SET IDENTITY_INSERT [dbo].[BatchDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Batches] ON 

INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (1, N'Gemini-2023', CAST(N'2023-03-22' AS Date), CAST(N'2023-01-01' AS Date), CAST(N'2023-01-10' AS Date), 7800, 15095, 7, 20, N'Not Started', N'Some detail', N'updated')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (2, N'Cognizant 2023', CAST(N'2023-02-24' AS Date), CAST(N'2023-02-24' AS Date), CAST(N'2023-02-24' AS Date), 10000, 119, 80, 8, N'Upcoming', N'new batch', N'string')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (28, N'Aspire', CAST(N'2023-03-28' AS Date), CAST(N'2023-03-21' AS Date), CAST(N'2023-03-23' AS Date), 5, 100, 8, 4, N'Ongoing', N'Just started', N'Excellent Batch')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (35, N'Federal', CAST(N'2023-03-16' AS Date), CAST(N'2023-02-26' AS Date), CAST(N'2023-02-26' AS Date), 5, 100, 6, 0, N'Not Started', N'New', N'kkkkkkkkkk')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (36, N'Tata elxsi', CAST(N'2023-03-16' AS Date), CAST(N'2023-02-26' AS Date), CAST(N'2023-02-26' AS Date), 7, 100, 7, 4, N'Not Started', N'new', N'nice batch')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (37, N'TCS', CAST(N'2023-03-13' AS Date), CAST(N'2023-02-28' AS Date), CAST(N'2023-02-26' AS Date), 8, 102, 99, 4, N'Ongoing', N'Just start', N'Excellent ')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (38, N'Infosys', CAST(N'2023-02-26' AS Date), CAST(N'2023-03-16' AS Date), CAST(N'2023-02-20' AS Date), 5, 5, 5, 6, N'Ongoing', N'NEW', N'iii')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (39, N'Incture', CAST(N'2023-03-13' AS Date), CAST(N'2023-03-23' AS Date), CAST(N'2023-02-26' AS Date), 4, 6, 6, 0, N'Ongoing', N'Just started', N'nice batch')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (40, N'Bayers', CAST(N'2023-03-07' AS Date), CAST(N'2023-03-16' AS Date), CAST(N'2023-02-26' AS Date), 5, 6, 7, 0, N'Not Started', N'NEW', N'Excellent Batch')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (41, N'Aspire-23', CAST(N'2023-03-13' AS Date), CAST(N'2023-03-13' AS Date), CAST(N'2023-03-14' AS Date), 3, 6, 6, 0, N'Not Started', N'era', N'sdd')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (42, N'Aspire', CAST(N'2023-03-22' AS Date), CAST(N'2023-03-31' AS Date), CAST(N'2023-03-30' AS Date), 5, 6, 6, 7, N'Not Started', N'Just started', N'Excellent Batch')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (43, N'CPP', CAST(N'2023-03-23' AS Date), CAST(N'2023-02-27' AS Date), CAST(N'2023-02-26' AS Date), 6, 7, 6, 6, N'Not Started', N'Just started', N'nice batchI')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (44, N'pp', CAST(N'2023-03-07' AS Date), CAST(N'2023-03-13' AS Date), CAST(N'2023-03-23' AS Date), 3, 6, 7, 6, N'Not Started', N'88', N'uu')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (45, N'Experion', CAST(N'2023-03-23' AS Date), CAST(N'2023-03-17' AS Date), CAST(N'2023-02-13' AS Date), 5, 7, 6, 0, N'Ongoing', N'new', N'Good')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (46, N'TCS-23', CAST(N'2023-03-13' AS Date), CAST(N'2023-03-07' AS Date), CAST(N'2023-03-20' AS Date), 5, 7, 6, 6, N'Not Started', N'new', N'Good')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (47, N'Tata', CAST(N'2023-03-07' AS Date), CAST(N'2023-03-21' AS Date), CAST(N'2023-03-16' AS Date), 4, 5, 5, 6, N'Not Started', N'new', N'Good')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (48, N'TKM', CAST(N'2023-03-13' AS Date), CAST(N'2023-03-19' AS Date), CAST(N'2023-02-26' AS Date), 5, 4, 6, 4, N'Not Started', N'new', N'Good')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (49, N'Tataelxsi', CAST(N'2023-03-16' AS Date), CAST(N'2023-03-05' AS Date), CAST(N'2023-03-06' AS Date), 3, 6, 6, 5, N'Not Started', N'new', N'Good')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (50, N'Aspire-2023', CAST(N'2023-03-22' AS Date), CAST(N'2023-03-17' AS Date), CAST(N'2023-02-26' AS Date), 4, 5, 6, 5, N'Not Started', N'new', N'Good')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (51, N'Aspire-2024', CAST(N'2023-03-15' AS Date), CAST(N'2023-03-28' AS Date), CAST(N'2023-02-26' AS Date), 5, 5, 6, 5, N'Not Started', N'new', N'BASICS')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (52, N'Accenture', CAST(N'2023-03-14' AS Date), CAST(N'2023-03-13' AS Date), CAST(N'2023-02-26' AS Date), 4, 6, 7, 6, N'Not Started', N'new', N'BASICS')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (53, N'CP', CAST(N'2023-03-13' AS Date), CAST(N'2023-03-14' AS Date), CAST(N'2023-02-26' AS Date), 5, 5, 6, 6, N'Not Started', N'new', N'Good')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (54, N'Abc', CAST(N'2023-03-16' AS Date), CAST(N'2023-03-03' AS Date), CAST(N'2023-03-16' AS Date), 777, 1, 4, 0, N'Not Started', N'new', N'kkkkkkkkkkkkkkkkkkkk')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (55, N'Noval', CAST(N'2023-03-06' AS Date), CAST(N'2023-03-08' AS Date), CAST(N'2023-03-30' AS Date), 2, 6, 6, 7, N'Not Started', N'new', N'BASICS')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (56, N'TCS-24', CAST(N'2023-03-21' AS Date), CAST(N'2023-03-16' AS Date), CAST(N'2023-03-22' AS Date), 5, 5, 5, 5, N'Not Started', N'new', N'JWT')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (1055, N'IBM', CAST(N'2023-02-27' AS Date), CAST(N'2023-02-12' AS Date), CAST(N'2023-03-22' AS Date), 4, 6, 6, 6, N'Not Started', N'new', N'BASICS')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (1056, N'Asp', CAST(N'2023-03-17' AS Date), CAST(N'2023-03-15' AS Date), CAST(N'2023-03-15' AS Date), 3, 5, 5, 6, N'Not Started', N'new', N'JS')
INSERT [dbo].[Batches] ([BatchId], [BatchName], [StartDate], [TentativeEndDate], [EndDate], [Fees], [FeesPaid], [Duration], [HoursTaken], [Status], [Details], [Remarks]) VALUES (1057, N'UST GLOBAL', CAST(N'2023-03-23' AS Date), CAST(N'2023-04-07' AS Date), CAST(N'2023-04-09' AS Date), 1500, 1000, 3, 3, N'Ongoing', N'good', N'Nice')
SET IDENTITY_INSERT [dbo].[Batches] OFF
GO
SET IDENTITY_INSERT [dbo].[Colleges] ON 

INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (1, N'TKM  college', N'Karicode ', N'Autonomous')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (2, N'TKM ', N'Kollam', N'Autonomous')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (3, N'UIT KTR', N'Kottarakara', N'Autonomous')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (4, N'Women''s', N'TVM', N' Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (5, N'Karyavattom Campus', N'TVM', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (6, N'IIT 1', N'Delhi', N'Central ')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (7, N'NIT', N'Calicut', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (8, N'IIT ', N'Palakkad', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (9, N'IIT ', N'Pune', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (10, N'IIM', N'Calicut', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (11, N'IIT ', N'TVM', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (12, N'IIT ', N'Pune', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (13, N'IIT', N'MADRAS', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (14, N'IIM 3', N'Chargarh', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (15, N'NIT1', N'TVM', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (16, N'', N'', N'')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (17, N'TCkm', N'karicode', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (18, N'IIM', N'Calicut', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (19, N'IIT Palakkad', N'Palakkad', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (20, N'CET College', N'TVM', N'Govt College')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (21, N'xavier''s', N'TVM', N'Govt College')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (22, N' Mar ivanies', N'TVM', N'Govt College')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (23, N'st Xavier''s', N'TVM', N'Govt College')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (24, N'arts', N'TVM', N'Govt College')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (25, N'GEC', N'Thrissur', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (26, N'RIT', N'Kottayam', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (27, N'MEC', N'Kochi', N'Aided')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (28, N'University', N'TVM', N'Govt')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (1028, N'TKM college', N'karikode', N'Good')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (1029, N'string', N'string', N'string')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (1030, N'St. Albert''s College', N'Kochi', N'St. Albert''s College, Kochi')
SET IDENTITY_INSERT [dbo].[Colleges] OFF
GO
SET IDENTITY_INSERT [dbo].[Evaluations] ON 

INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (1, 37, N'SecondEvaluation', CAST(N'2023-02-04' AS Date), N'Layering MVC', N'Implement a project using layering', N'Api 2')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (3, 45, N'Third Evaluation', CAST(N'2023-02-24' AS Date), N'WEBAPI', N'Implement WEBAPI', N'WEBAPI Implementation')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (5, 45, N'third', CAST(N'2023-03-09' AS Date), N'MVC', N'display table in mvc', N'mvc')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (6, 36, N'third Evaluation', CAST(N'2023-03-21' AS Date), N'web api', N'display table in mvc', N'MVC')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (7, 40, N'IIT ', CAST(N'2023-04-09' AS Date), N'web api', N'display table in mvc', N'mvc')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (8, 36, N'IIT ', CAST(N'2023-04-09' AS Date), N'web api', N'display table in mvc', N'mvc')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (9, 2, N'First', CAST(N'2023-03-09' AS Date), N'web api', N'do the web api authentication', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (10, 45, N'third', CAST(N'2023-03-22' AS Date), N'web api', N'do the web api authentication', N'MVC')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (11, 1, N'IIT ', CAST(N'2023-04-02' AS Date), N'MVC', N'do the web api authentication', N'mvc')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (12, 28, N'Final', CAST(N'2023-03-23' AS Date), N'web api', N'do the web api authentication', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (13, 35, N'third', CAST(N'2023-03-02' AS Date), N'MVC', N'do the web api authentication', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (14, 1, N'string', CAST(N'2023-03-14' AS Date), N'string', N'string', N'mvcccc')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (15, 45, N'third', CAST(N'2023-03-31' AS Date), N'web api', N'do the web api authentication', N'API')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (16, 45, N'Final', CAST(N'2023-03-17' AS Date), N'Web api identity', N'Implemenet the identity in web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (17, 1, N'Final', CAST(N'2023-03-11' AS Date), N'web api', N'display table in mvc', N'mvc')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (18, 2, N'NIT', CAST(N'2023-03-10' AS Date), N'MVC', N'do the web api authentication', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (19, 35, N'Final', CAST(N'2023-03-16' AS Date), N'MVC', N'Implemenet the identity in web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (20, 35, N'Kariavattom', CAST(N'2023-03-09' AS Date), N'Web api identity', N'do the web api authentication', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (21, 41, N'Kariavattom', CAST(N'2023-03-09' AS Date), N'Web api identity', N'do the web api authentication', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (22, 39, N'NIT', CAST(N'2023-03-12' AS Date), N'Web api identity', N'Implemenet the identity in web api', N'web api 1')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (23, 42, N'Kariavattom', CAST(N'2023-03-18' AS Date), N'Web api identity', N'Implemenet the identity in web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (24, 40, N'third', CAST(N'2023-03-06' AS Date), N'MVC', N'display table in mvc', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (25, 28, N'third', CAST(N'2023-03-25' AS Date), N'web api', N'do the insert', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (26, 39, N'third', CAST(N'2023-03-15' AS Date), N'MVC', N'write the code', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (27, 38, N'third', CAST(N'2023-03-29' AS Date), N'MVC', N'Implement JWT token', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (28, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Implement web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (29, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Implement web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (30, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Implement web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (31, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Implement web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (32, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Implement web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (33, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Implement web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (34, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Implement web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (35, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Implement web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (36, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Implement web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (37, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Implement web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (38, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Implement web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (39, 52, N'IIT ', CAST(N'2023-03-16' AS Date), N'MVC', N'Implement jquery', N'mvc')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (40, 52, N'IIT ', CAST(N'2023-03-16' AS Date), N'MVC', N'Implement jquery', N'mvc')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (41, 35, N'third', CAST(N'2023-03-11' AS Date), N'MVC', N'add mvc', N'mvc')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (42, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Web api identity', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (43, 28, N'Final', CAST(N'2023-04-01' AS Date), N'Web api identity', N'Web api identity', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (44, 2, N'Di', CAST(N'2023-03-14' AS Date), N'MVC', N'asd', N'ad')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (45, 2, N'Di', CAST(N'2023-03-14' AS Date), N'MVC', N'asd', N'ad')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (46, 2, N'Di', CAST(N'2023-03-14' AS Date), N'MVC', N'asd', N'ad')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (47, 2, N'Di', CAST(N'2023-03-14' AS Date), N'MVC', N'asd', N'ad')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (48, 2, N'Di', CAST(N'2023-03-14' AS Date), N'MVC', N'asd', N'ad')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (1042, 37, N'SecondEvaluation', CAST(N'2023-03-16' AS Date), N'web api', N'web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (1043, 37, N'SecondEvaluation', CAST(N'2023-03-16' AS Date), N'web api', N'web api', N'web api')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (1044, 40, N'First', CAST(N'2023-03-22' AS Date), N'JavaScript', N'Do a backend for the project TrainingManagement using Web api', N'Javascript')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (1045, 40, N'First', CAST(N'2023-03-22' AS Date), N'JavaScript', N'Do a backend for the project TrainingManagement using Web api', N'Javascript')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (1046, 1057, N'First Evaluation', CAST(N'2023-03-29' AS Date), N'Python', N'Implement basic crud operations in python', N'Python ')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (1047, 1057, N'First Evaluation', CAST(N'2023-03-29' AS Date), N'Python', N'Implement basic crud operations in python', N'Python ')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (1048, 1057, N'abcd Evaluation', CAST(N'2023-04-07' AS Date), N'Python', N'implement crud using python and javascript', N'Python ')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (1049, 1057, N'abcd Evaluation', CAST(N'2023-04-07' AS Date), N'Python', N'implement crud using python and javascript', N'Python ')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (1050, 37, N'SecondEvaluation', CAST(N'2023-03-17' AS Date), N'Python', N'Python', N'Python ')
INSERT [dbo].[Evaluations] ([EvaluationId], [BatchId], [EvaluationName], [Date], [Topic], [Question], [Description]) VALUES (1051, 37, N'SecondEvaluation', CAST(N'2023-03-17' AS Date), N'Python', N'Python', N'Python ')
SET IDENTITY_INSERT [dbo].[Evaluations] OFF
GO
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (1, N'Shijith', N'jQuery', N'y')
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (2, N'Shalvin', N'C#', N'y')
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (3, N'Nidhi Mishra', N'MVC', N'y')
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (4, N'Amritlal', N'JWT', NULL)
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (5, N'Kripa', N'.Net Core ', NULL)
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (6, N'Nidhi', N'MVC', NULL)
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (7, N'Joy', N'.NET Framework', NULL)
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (8, N'AmritLal', N'JWT', NULL)
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (9, N'Arun', N'JS', NULL)
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (10, N'Sidharth', N'Abcd', NULL)
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (11, N'Anoop', N'C++', NULL)
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (12, N'Arun', N'JWT', NULL)
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (1011, N'Anoop', N'JWT', NULL)
INSERT [dbo].[Faculties] ([FacultyId], [FacultyName], [Remarks], [Discontinue]) VALUES (1012, N'Hari', N'MVC', NULL)
SET IDENTITY_INSERT [dbo].[Faculties] OFF
GO
SET IDENTITY_INSERT [dbo].[FacultiesSubjects] ON 

INSERT [dbo].[FacultiesSubjects] ([FacultySubjectId], [FacultyId], [SubjectId], [Remarks], [Discontinue]) VALUES (1, 5, 1, N'COGNIZANTTRAINER', NULL)
INSERT [dbo].[FacultiesSubjects] ([FacultySubjectId], [FacultyId], [SubjectId], [Remarks], [Discontinue]) VALUES (2, 5, 3, N'Gemini Trainer', NULL)
INSERT [dbo].[FacultiesSubjects] ([FacultySubjectId], [FacultyId], [SubjectId], [Remarks], [Discontinue]) VALUES (3, 3, 3, N'Advanced', NULL)
INSERT [dbo].[FacultiesSubjects] ([FacultySubjectId], [FacultyId], [SubjectId], [Remarks], [Discontinue]) VALUES (4, 3, 1, N'Advanced', NULL)
INSERT [dbo].[FacultiesSubjects] ([FacultySubjectId], [FacultyId], [SubjectId], [Remarks], [Discontinue]) VALUES (5, 5, 8, N'Advanced', NULL)
INSERT [dbo].[FacultiesSubjects] ([FacultySubjectId], [FacultyId], [SubjectId], [Remarks], [Discontinue]) VALUES (6, 8, 6, N'', NULL)
INSERT [dbo].[FacultiesSubjects] ([FacultySubjectId], [FacultyId], [SubjectId], [Remarks], [Discontinue]) VALUES (7, 4, 7, N'', NULL)
INSERT [dbo].[FacultiesSubjects] ([FacultySubjectId], [FacultyId], [SubjectId], [Remarks], [Discontinue]) VALUES (8, 6, 7, N'', NULL)
INSERT [dbo].[FacultiesSubjects] ([FacultySubjectId], [FacultyId], [SubjectId], [Remarks], [Discontinue]) VALUES (9, 4, 7, N'Good', NULL)
INSERT [dbo].[FacultiesSubjects] ([FacultySubjectId], [FacultyId], [SubjectId], [Remarks], [Discontinue]) VALUES (10, 7, 6, N'WEB api', NULL)
INSERT [dbo].[FacultiesSubjects] ([FacultySubjectId], [FacultyId], [SubjectId], [Remarks], [Discontinue]) VALUES (1005, 8, 10, N'Basics', NULL)
INSERT [dbo].[FacultiesSubjects] ([FacultySubjectId], [FacultyId], [SubjectId], [Remarks], [Discontinue]) VALUES (1006, 6, 1008, N'', NULL)
SET IDENTITY_INSERT [dbo].[FacultiesSubjects] OFF
GO
SET IDENTITY_INSERT [dbo].[FeesDetails] ON 

INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (6, NULL, CAST(N'2023-03-13' AS Date), 500, N'third')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (7, NULL, CAST(N'2023-03-22' AS Date), 1, N'second')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (8, 2, CAST(N'2023-03-01' AS Date), 9, N'FIRST')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (9, 2, CAST(N'2023-03-13' AS Date), 90, N'second')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (10, 28, CAST(N'2023-03-09' AS Date), 90, N'second')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (11, NULL, CAST(N'2023-03-15' AS Date), 900, N'first')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (1002, NULL, CAST(N'2023-03-03' AS Date), 90, N'second')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (1003, NULL, CAST(N'2023-03-08' AS Date), 90, N'second')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (1004, NULL, CAST(N'2023-03-13' AS Date), 400, N'third')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (1005, 1, CAST(N'2023-03-01' AS Date), 3000, N'edited')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (1006, 1, CAST(N'2023-03-13' AS Date), 400, N'third')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (1007, NULL, CAST(N'2023-03-22' AS Date), 90, N'hi')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (1008, 1, CAST(N'2023-03-31' AS Date), 100, N'third pay')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (1009, 2, CAST(N'2023-03-15' AS Date), 90, N'second')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (1010, 37, CAST(N'2023-03-15' AS Date), 3, N'second')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (1011, 1, CAST(N'2023-03-06' AS Date), 1000, N'second payment')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (1012, 1, CAST(N'2023-02-28' AS Date), 5, N'third pay')
INSERT [dbo].[FeesDetails] ([FeesId], [BatchId], [Date], [Amount], [Remarks]) VALUES (1013, 1, CAST(N'2023-06-11' AS Date), 5000, N'Paid Rs. 5000')
SET IDENTITY_INSERT [dbo].[FeesDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [Remarks]) VALUES (1, N'C#', N'BASICS OF C#')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [Remarks]) VALUES (3, N'jQuery', N'Advanced')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [Remarks]) VALUES (6, N'Web Api', N'Basic')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [Remarks]) VALUES (7, N'.NET 6', N'Advanced')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [Remarks]) VALUES (8, N'Angular', N'Intermediate')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [Remarks]) VALUES (9, N'React', N'Intermediate')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [Remarks]) VALUES (10, N'Node.js', N'Basics')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [Remarks]) VALUES (1007, N'MVC', N'BASIC')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [Remarks]) VALUES (1008, N'Blazor Server', N'Blazor Server')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [Remarks]) VALUES (1009, N'JWT', N'Json Web Tokens with Web API')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[TraineeAssignments] ON 

INSERT [dbo].[TraineeAssignments] ([AssignmentId], [TraineeId], [Asssignment], [Score], [Remarks], [Status]) VALUES (40, 5, N'casting', 6, N'Nice Talk', N'Completed')
INSERT [dbo].[TraineeAssignments] ([AssignmentId], [TraineeId], [Asssignment], [Score], [Remarks], [Status]) VALUES (41, 8, N'C# Struct', 4, N'Good', N'Completed')
INSERT [dbo].[TraineeAssignments] ([AssignmentId], [TraineeId], [Asssignment], [Score], [Remarks], [Status]) VALUES (42, 2, N'IIFE', 10, N'Excellent', N'Assigned')
INSERT [dbo].[TraineeAssignments] ([AssignmentId], [TraineeId], [Asssignment], [Score], [Remarks], [Status]) VALUES (43, 6, N'Enum', 6, N'Good', N'Completed')
INSERT [dbo].[TraineeAssignments] ([AssignmentId], [TraineeId], [Asssignment], [Score], [Remarks], [Status]) VALUES (44, 5, N'Dockers', 3, N'Good', N'Completed')
INSERT [dbo].[TraineeAssignments] ([AssignmentId], [TraineeId], [Asssignment], [Score], [Remarks], [Status]) VALUES (45, 2, N'C# Struct', 4, N'Good', N'Completed')
SET IDENTITY_INSERT [dbo].[TraineeAssignments] OFF
GO
SET IDENTITY_INSERT [dbo].[TraineeEvaluations] ON 

INSERT [dbo].[TraineeEvaluations] ([TraineeEvaluationId], [EvaluationId], [TraineeId], [Score], [Remarks]) VALUES (1, 1, 2, 75, N'Good')
INSERT [dbo].[TraineeEvaluations] ([TraineeEvaluationId], [EvaluationId], [TraineeId], [Score], [Remarks]) VALUES (3, 9, 8, 75, N'Average')
INSERT [dbo].[TraineeEvaluations] ([TraineeEvaluationId], [EvaluationId], [TraineeId], [Score], [Remarks]) VALUES (4, 1, 5, 100, N'Average')
INSERT [dbo].[TraineeEvaluations] ([TraineeEvaluationId], [EvaluationId], [TraineeId], [Score], [Remarks]) VALUES (8, 1, 19, 100, N'Excellant')
INSERT [dbo].[TraineeEvaluations] ([TraineeEvaluationId], [EvaluationId], [TraineeId], [Score], [Remarks]) VALUES (9, 1, 14, 100, N'Excellant')
INSERT [dbo].[TraineeEvaluations] ([TraineeEvaluationId], [EvaluationId], [TraineeId], [Score], [Remarks]) VALUES (17, 3, 6, 100, N'Excellant')
INSERT [dbo].[TraineeEvaluations] ([TraineeEvaluationId], [EvaluationId], [TraineeId], [Score], [Remarks]) VALUES (23, 12, 25, 75, N'Nice')
INSERT [dbo].[TraineeEvaluations] ([TraineeEvaluationId], [EvaluationId], [TraineeId], [Score], [Remarks]) VALUES (24, 1, 38, 75, N'Good')
INSERT [dbo].[TraineeEvaluations] ([TraineeEvaluationId], [EvaluationId], [TraineeId], [Score], [Remarks]) VALUES (25, 16, 14, 78, N'Good')
INSERT [dbo].[TraineeEvaluations] ([TraineeEvaluationId], [EvaluationId], [TraineeId], [Score], [Remarks]) VALUES (26, 6, 8, 44, N'Average')
SET IDENTITY_INSERT [dbo].[TraineeEvaluations] OFF
GO
SET IDENTITY_INSERT [dbo].[Trainees] ON 

INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (1, 1, 1, N'Athmajan', N'TVM', N'abcd@gmail.com', N'123456', N'y')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (2, 1, 1, N'Athmajan A S', N'Trivandrum', N'abcd@gmail.com', N'12345678', NULL)
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (3, 1, 1, N'Gopika', N'Attingal', N'gopika@gmail.com', N'1234567898', N'y')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (4, 1, 2, N'Stefi', N'Vilangara', N'stefi5933@gmail.com', N'9967754345', N'y')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (5, 1, 2, N'Stefi', N'Kollam', N'stefithomas@mail.com', N'77885434', N' ')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (6, 1, 1, N'Sachin M', N'Kozhikode', N'sachin@gmail.com', N'92367748923', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (8, 2, 2, N'Gopika S Raj', N'Trivandrum', N'gopika@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (9, 1, 1, N'Amal P', N'Kannur', N'amal@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (10, 2, 2, N'Adarsh H', N'Trivandrum', N'adarsh@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (14, 1, 1, N'Basil Narakodan', N'Malappuram', N'basil@gmail.com', N'234234', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (18, 1, 2, N'Sibi', N'TVM', N'gopika@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (19, 2, 1, N'Gokul', N'Palakkad', N'Gokul@gmail.com', N'3234234234', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (20, 1, 1, N'Gokul', N'Trivandrum', N'adarsh@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (21, 2, 1, N'Gopika S Raj', N'asdf', N'adarsh@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (22, 2, 1, N'Adarsh H', N'Trivandrum', N'amal@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (23, 1, 2, N'Gopika S Raj', N'Trivandrum', N'gopika@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (25, 2, 2, N'Adarsh Hari', N'sdf', N'amal@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (26, 2, 2, N'asd', N'TVM', N'athmu2000@gmail.com', N'234234', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (27, 1, 14, N'Yasin', N'TVM', N'demo@gmail.cm', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (28, 1, 2, N'Adarsh H', N'Kannur', N'amal@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (29, 1, 1, N'Athmajan A S', N'Trivandrum', N'demo@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (30, 28, 2, N'Gopika S Raj', N'Trivandrum', N'gopika@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (31, 2, 2, N'Gopika S Raj', N'TVM', N'gopika@gmail.com', N'231', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (32, 2, 2, N'Gopika S Raj', N'Trivandrum', N'amal@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (33, 1, 2, N'Adarsh Hari', N'Trivandrum', N'adarsh@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (34, 2, 1, N'Gokul', N'Trivandrum', N'demo@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (35, 2, 5, N'Gopika S Raj', N'Trivandrum', N'demo@gmail.com', N'7012525354', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (36, 40, 6, N'Nikila', N'Calicut', N'nikila@gmail.com', N'8451236542', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (37, 40, 6, N'Nikila', N'Calicut', N'nikila@gmail.com', N'8451236542', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (38, 1057, 3, N'Alexa George', N'London', N'alexa@gmail.com', N'85426391245', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (39, 1057, 22, N'Athmajan A S', N'Pune', N'Divakar@gmail.com', N'8542639125', N'N')
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (40, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (41, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (42, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (43, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (44, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (45, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Trainees] ([TraineeId], [BatchId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (47, 1, 1, N'Shalvin', N'Kochi', N'shalvin@gmail.com', N'9745800512', N's')
SET IDENTITY_INSERT [dbo].[Trainees] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Role]) VALUES (1, N'Admin', N'Admin@123', N'Admin')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Trainees] ADD  CONSTRAINT [DF_Trainees_Discontinue]  DEFAULT (NULL) FOR [Discontinue]
GO
ALTER TABLE [dbo].[BatchDetails]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[BatchDetails]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[BatchDetails]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[Evaluations]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[Evaluations]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[Evaluations]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[FacultiesSubjects]  WITH CHECK ADD  CONSTRAINT [FK__Faculties__Facul__2B3F6F97] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([FacultyId])
GO
ALTER TABLE [dbo].[FacultiesSubjects] CHECK CONSTRAINT [FK__Faculties__Facul__2B3F6F97]
GO
ALTER TABLE [dbo].[FacultiesSubjects]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([SubjectId])
GO
ALTER TABLE [dbo].[FacultiesSubjects]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([SubjectId])
GO
ALTER TABLE [dbo].[FacultiesSubjects]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([SubjectId])
GO
ALTER TABLE [dbo].[FeesDetails]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[FeesDetails]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[FeesDetails]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[TraineeAssignments]  WITH CHECK ADD FOREIGN KEY([TraineeId])
REFERENCES [dbo].[Trainees] ([TraineeId])
GO
ALTER TABLE [dbo].[TraineeAssignments]  WITH CHECK ADD FOREIGN KEY([TraineeId])
REFERENCES [dbo].[Trainees] ([TraineeId])
GO
ALTER TABLE [dbo].[TraineeAssignments]  WITH CHECK ADD FOREIGN KEY([TraineeId])
REFERENCES [dbo].[Trainees] ([TraineeId])
GO
ALTER TABLE [dbo].[TraineeEvaluations]  WITH CHECK ADD FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluations] ([EvaluationId])
GO
ALTER TABLE [dbo].[TraineeEvaluations]  WITH CHECK ADD FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluations] ([EvaluationId])
GO
ALTER TABLE [dbo].[TraineeEvaluations]  WITH CHECK ADD FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluations] ([EvaluationId])
GO
ALTER TABLE [dbo].[TraineeEvaluations]  WITH CHECK ADD FOREIGN KEY([TraineeId])
REFERENCES [dbo].[Trainees] ([TraineeId])
GO
ALTER TABLE [dbo].[TraineeEvaluations]  WITH CHECK ADD FOREIGN KEY([TraineeId])
REFERENCES [dbo].[Trainees] ([TraineeId])
GO
ALTER TABLE [dbo].[TraineeEvaluations]  WITH CHECK ADD FOREIGN KEY([TraineeId])
REFERENCES [dbo].[Trainees] ([TraineeId])
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([CollegeId])
REFERENCES [dbo].[Colleges] ([CollegeId])
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([CollegeId])
REFERENCES [dbo].[Colleges] ([CollegeId])
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([CollegeId])
REFERENCES [dbo].[Colleges] ([CollegeId])
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([CollegeId])
REFERENCES [dbo].[Colleges] ([CollegeId])
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([CollegeId])
REFERENCES [dbo].[Colleges] ([CollegeId])
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([CollegeId])
REFERENCES [dbo].[Colleges] ([CollegeId])
GO
/****** Object:  StoredProcedure [dbo].[spAllTrainees]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spAllTrainees] as
select * from Trainees
GO
/****** Object:  StoredProcedure [dbo].[spBatchDetails]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBatchDetails]
	@Option char(1) = 's',
	@BatchDetailId int = null,
	@BatchId int = null,
	@Date date = null,
	@HoursTaken float = null,
	@TopicsTaken text = null,
	@Remarks text = null
AS

	if @Option = 's'
		SELECT BatchDetailId,Batches.BatchName,BatchDetails.BatchId,Date,BatchDetails.HoursTaken,TopicsTaken,BatchDetails.Remarks  FROM BatchDetails left  join Batches on BatchDetails.BatchId = Batches.BatchId;
	else if @Option = 'i'
	Begin
		INSERT INTO BatchDetails values 
		(@BatchId,@Date,@HoursTaken,@TopicsTaken,@Remarks);
			update Batches set HoursTaken = HoursTaken+@HoursTaken where BatchId = @BatchId;
	END
	else if @Option = 'u'
	BEGIN
		if((select BatchId from BatchDetails where BatchDetailId = @BatchDetailId) != @BatchId)
			begin
				UPDATE Batches set HoursTaken = (HoursTaken - cast( (select HoursTaken from BatchDetails where BatchDetailId = @BatchDetailId) as float))  where BatchId =(select BatchId from BatchDetails where BatchDetailId = @BatchDetailId);
				UPDATE Batches set HoursTaken = (HoursTaken+ cast (@HoursTaken as float)) where BatchId = @BatchId;
				UPDATE BatchDetails set 
								Date =@Date,
								HoursTaken = @HoursTaken,
								TopicsTaken = @TopicsTaken,
								BatchId = @BatchId,
								Remarks = @Remarks where BatchDetailId = @BatchDetailId
			end
		else
			begin
				UPDATE Batches set HoursTaken = (HoursTaken - cast( (select HoursTaken from BatchDetails where BatchDetailId = @BatchDetailId) as float))  where BatchId =@BatchId;
				UPDATE Batches set HoursTaken = (HoursTaken+ cast (@HoursTaken as float)) where BatchId = @BatchId;
				UPDATE BatchDetails set 
							Date =@Date,
							HoursTaken = @HoursTaken,
							TopicsTaken = @TopicsTaken,
							Remarks = @Remarks where BatchDetailId = @BatchDetailId
			end	
	END			
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spBatches]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spBatches]( @Option varchar(10) = 'select',
							@BatchId int = null,
							@BatchName varchar(40) = null,
							@StartDate date = null,
							@TentativeEndDate date = null,
							@EndDate date = null,
							@Fees float = null,
							@FeesPaid float = null,
							@Duration float = null,
							@HoursTaken float = null,
							@Status varchar(200) = null,
							@Details text = null,
							@Remarks text = null
							)

as
	if @Option = 'select'
	begin
	SELECT * from Batches

		
	END
	else if @Option = 'insert'
	begin
		insert into Batches values(
				@BatchName,
				@StartDate,
				@TentativeEndDate,
				@EndDate,
				@Fees,
				@FeesPaid,
				@Duration,
				@HoursTaken,
				@Status,
				@Details,
				@Remarks

		)
		end
		else if @Option = 'update'
		begin
	update Batches set 
				BatchName = @BatchName,
				StartDate=@StartDate,
				TentativeEndDate=@TentativeEndDate,
				EndDate=@EndDate,
				Fees=@Fees,
				FeesPaid=@FeesPaid,
				Duration=@Duration,
				HoursTaken=@HoursTaken,
				Status=@Status,
				Details=@Details,
				Remarks=@Remarks
where BatchId = @BatchId
end
GO
/****** Object:  StoredProcedure [dbo].[spColleges]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spColleges](
							@Option char(1) = 's',
							@CollegeId int = null,
							@CollegeName varchar(100) = null,
							@Location varchar(100) = null,
							@Remarks text = null

)
as
	if @Option = 's'
		select * from Colleges
	else if @Option = 'i'
		insert into Colleges values(@CollegeName, @Location, @Remarks)
	else if @Option = 'u'
		update Colleges set CollegeName = @CollegeName, Location = @Location, Remarks = @Remarks where CollegeId = @CollegeId
    else if @Option = 'c'
	    select TraineeName from Trainees where CollegeId=@CollegeId


GO
/****** Object:  StoredProcedure [dbo].[spEvaluations]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spEvaluations](
							@Option char(1) = 's',
							@EvaluationId int = null,
							@BatchId int = null,
							@EvaluationName varchar(50)=null,
							@Date date=null,
							@Topic varchar(50) = null,
							@Question text = null,
							@Description text = null


)
as
	if @Option = 's'
		select Batches.BatchId,Batches.BatchName, Evaluations.EvaluationId,Evaluations.EvaluationName,Evaluations.Date,Evaluations.Topic,Evaluations.Question,Evaluations.Description from Evaluations left join Batches on 
Evaluations.BatchId=Batches.batchId
	else if @Option = 'i'
		insert into Evaluations values(@BatchId,@EvaluationName, @Date, @Topic,@Question,@Description)
	else if @Option = 'u'
		update Evaluations set Batchid = @BatchId,EvaluationName= @EvaluationName, Date = @Date, Topic= @Topic,Question= @Question, Description=@Description where EvaluationId = @EvaluationId

GO
/****** Object:  StoredProcedure [dbo].[spFaculties]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFaculties](@Option char(1)='s',
			@FacultyId int=null,
			@FacultyName varchar(40)=NULL,
			@Remarks text=NULL,
			@Discontinue char(1)=NULL)
			
as

begin
if @Option='s'
	select * from Faculties where Discontinue!='y' OR Discontinue IS NULL
else if @Option='d'
	BEGIN
		update Faculties set Discontinue='y' where FacultyId=@FacultyId
		update FacultiesSubjects set Discontinue='y' where FacultyId=@FacultyId
	END
else if @Option='i'
	insert into Faculties(FacultyName,Remarks) VALUES(@FacultyName,@Remarks)
else if @Option='u' 
	update Faculties set FacultyName=@FacultyName,Remarks=@Remarks  where FacultyId=@FacultyId
end
GO
/****** Object:  StoredProcedure [dbo].[spFacultySubjects]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFacultySubjects]
	@Option char(1) = 'j',
	@FacultyId int = null,
	@SubjectId int = null,
	@Remarks text = null,
	@Discontinue char(1) = null,
	@FacultySubjectId int = null
	
AS
	IF @Option = 's'
		SELECT * FROM FacultiesSubjects WHERE Discontinue != 'y' OR Discontinue IS NULL;
	ELSE IF @Option = 'i'
		INSERT INTO FacultiesSubjects (FacultyId,SubjectId,Remarks) VALUES (@FacultyId,@SubjectId,@Remarks);
	ELSE IF @Option = 'u'
		UPDATE FacultiesSubjects SET FacultyId=@FacultyId,SubjectId=@SubjectId,Remarks=@Remarks WHERE FacultySubjectId = @FacultySubjectId;
	ELSE IF @Option = 'j'
		  select Faculties.FacultyId, FacultyName, SubjectName, Faculties.Remarks
  from FacultiesSubjects full join Faculties on Faculties.FacultyId=FacultiesSubjects.FacultyId
  left join Subjects on Subjects.SubjectId = FacultiesSubjects.SubjectId
GO
/****** Object:  StoredProcedure [dbo].[spFeesDetails]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFeesDetails]
	@Option char(1) ='s',
	@FeesId int = null,
	@BatchId int = null,
	@Date date = null,
	@Amount float = null,
	@Remarks text = null
AS
	IF @Option = 's'
  SELECT FeesId,Date,Amount,FeesDetails.Remarks,FeesDetails.BatchId,Batches.BatchName
  from
  FeesDetails join Batches
  on  FeesDetails.BatchId=Batches.BatchId
   
	ELSE IF @Option = 'i'
	Begin
		INSERT INTO FeesDetails VALUES(@BatchId,
										@Date,
										@Amount,
										@Remarks);
        update Batches set FeesPaid=FeesPaid+@Amount where BatchId=@BatchId;
	END	
else if @Option='u'
begin
    DECLARE @OldAmount INT;
    SELECT @OldAmount = Amount FROM FeesDetails WHERE FeesID = @FeesID 
    UPDATE FeesDetails SET Date=@Date,Amount = @Amount,Remarks=@Remarks WHERE FeesId = @FeesId    
    UPDATE Batches SET FeesPaid = FeesPaid - @OldAmount + @Amount WHERE BatchID = @BatchID  
end
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spSubjects]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSubjects](@Option char(1)='s',
							@SubjectId int=null,
							@SubjectName varchar(40)=null,
							@Remarks text=null)
as
begin
if @Option='s'
	select * from Subjects
else if @Option='i'
	insert into Subjects (SubjectName,Remarks) VALUES(@SubjectName,@Remarks)
else if @Option='u' 
	update Subjects set SubjectName=@SubjectName,Remarks=@Remarks  where SubjectId=@SubjectId
end
GO
/****** Object:  StoredProcedure [dbo].[spTraineeAssignment]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTraineeAssignment]  
 @Option char(1) = 's',  
 @AssignmentId int = null,  
 @TraineeId int =  null,  
 @Assignment varchar(50) = null,  
 @Score float = 0.0,  
 @Status varchar(200)=null,
 @Remarks text =null 
AS  
 IF @Option = 's'  

  SELECT AssignmentId,  Asssignment,TraineeAssignments.Status,Score,Remarks,Trainees.TraineeName
  from
  TraineeAssignments join Trainees
  on  TraineeAssignments.TraineeId=Trainees.TraineeId
   


 ELSE IF @Option = 'i'  
  INSERT INTO TraineeAssignments VALUES (@TraineeId,@Assignment,@Score,@Remarks,@Status);  
 ELSE IF @Option = 'u'  
  UPDATE TraineeAssignments SET Asssignment=@Assignment,Score=@Score,Status=@Status,Remarks=@Remarks WHERE AssignmentId = @AssignmentId;  
 ELSE IF @Option = 'm'  
  UPDATE TraineeAssignments SET Score = @Score  
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spTraineeById]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spTraineeById] (@TraineeId int)
as
select 
			TraineeId,
			TraineeName,
			TraineeLocation,
			Email,
			Phone,
			Trainees.BatchId,
			Trainees.CollegeId	
	from Trainees	
		where  TraineeId = @TraineeId;
GO
/****** Object:  StoredProcedure [dbo].[spTraineeEvalDetails]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spTraineeEvalDetails] 
				@TraineeId int
as
	select E.EvaluationName,E.Date,E.Question,T.Score,T.Remarks from Evaluations as E join TraineeEvaluations as T
on E.EvaluationId = T.EvaluationId where T.TraineeId =@TraineeId
GO
/****** Object:  StoredProcedure [dbo].[spTraineeEvaluations]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spTraineeEvaluations](
							@Option char(1) = 's',
							@TraineeEvaluationId int = null,
							@EvaluationId int = null,
							@TraineeId int = null,
							@Score float = null,
							@Remarks text = null


)
as
	if @Option = 's'
		
		select TraineeEvaluationId,Evaluations.EvaluationId,Evaluations.EvaluationName, Trainees.TraineeId,Trainees.TraineeName,TraineeEvaluations.Score,TraineeEvaluations.Remarks from TraineeEvaluations left join
		Trainees on TraineeEvaluations.TraineeId=Trainees.TraineeId left join Evaluations on TraineeEvaluations.EvaluationId=Evaluations.EvaluationId
	else if @Option = 'i'
		insert into TraineeEvaluations values(@EvaluationId, @TraineeId, @Score,@Remarks)
	else if @Option = 'u'
		update TraineeEvaluations set TraineeId=@TraineeId,EvaluationId=@EvaluationId,  Score= @Score,Remarks= @Remarks  where TraineeEvaluationId = @TraineeEvaluationId
GO
/****** Object:  StoredProcedure [dbo].[spTrainees]    Script Date: 25-01-2024 15:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spTrainees](
							@Option char(1) = 's',
							@TraineeId int = null,
							@BatchId int = null,
							@CollegeId int = null,
							@TraineeName varchar(50) = null,					
							@TraineeLocation varchar(100) = null,
							@Email varchar(50) = null,
							@Phone varchar(50) = null,
							@Discontinue char(1) = null

)

as
	if @Option = 's'
		select 
			TraineeId,
			TraineeName,
			TraineeLocation,
			Email,
			Phone,
			CollegeName,
			BatchName,
			Trainees.BatchId,
			Trainees.CollegeId

		from Trainees join Colleges on Trainees.CollegeId = Colleges.CollegeId
		join Batches on Batches.BatchId = Trainees.BatchId
		where Trainees.Discontinue != 'y' or Trainees.Discontinue is null;

		if @Option = 'id'
		select 
			TraineeId,
			TraineeName,
			TraineeLocation,
			Email,
			Phone,
			Trainees.BatchId,
			Trainees.CollegeId	
	from Trainees	
		where  TraineeId = @TraineeId;

	else if @Option = 'i'
		insert into Trainees values (
									@BatchId,
									@CollegeId,
									@TraineeName,
									@TraineeLocation,
									@Email,
									@Phone,
									@Discontinue
								
		)

		else if @Option = 'u'
				update Trainees set Batchid = @BatchId,
									CollegeId = @CollegeId,
									TraineeName = @TraineeName,
									TraineeLocation = @TraineeLocation,
									Email = @Email,
									Phone = @Phone
				where TraineeId = @TraineeId

	 else if @Option='d'
	     update Trainees set Discontinue='y' where TraineeId=@TraineeId
GO
