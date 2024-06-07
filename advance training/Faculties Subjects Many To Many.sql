USE [FacultyManagementManyToMany]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 25-01-2024 16:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[FacultyId] [int] NOT NULL,
	[FacultyName] [varchar](50) NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[FacultyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacultiesSubjects]    Script Date: 25-01-2024 16:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultiesSubjects](
	[FacultySubjectId] [int] IDENTITY(1,1) NOT NULL,
	[FacultyId] [int] NULL,
	[SubjectId] [int] NULL,
 CONSTRAINT [PK_FacultiesSubjects] PRIMARY KEY CLUSTERED 
(
	[FacultySubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 25-01-2024 16:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectId] [int] NOT NULL,
	[SubjectName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FacultiesSubjects]  WITH CHECK ADD  CONSTRAINT [FK_FacultiesSubjects_Faculties] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([FacultyId])
GO
ALTER TABLE [dbo].[FacultiesSubjects] CHECK CONSTRAINT [FK_FacultiesSubjects_Faculties]
GO
ALTER TABLE [dbo].[FacultiesSubjects]  WITH CHECK ADD  CONSTRAINT [FK_FacultiesSubjects_Subjects] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([SubjectId])
GO
ALTER TABLE [dbo].[FacultiesSubjects] CHECK CONSTRAINT [FK_FacultiesSubjects_Subjects]
GO
