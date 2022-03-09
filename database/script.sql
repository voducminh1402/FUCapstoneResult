USE [master]
GO
/****** Object:  Database [FUCapstoneResult]    Script Date: 3/9/2022 5:11:42 PM ******/
CREATE DATABASE [FUCapstoneResult]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTResultCapstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019EXP\MSSQL\DATA\FPTResultCapstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPTResultCapstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019EXP\MSSQL\DATA\FPTResultCapstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FUCapstoneResult] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FUCapstoneResult].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FUCapstoneResult] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET ARITHABORT OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FUCapstoneResult] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FUCapstoneResult] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FUCapstoneResult] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FUCapstoneResult] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FUCapstoneResult] SET  MULTI_USER 
GO
ALTER DATABASE [FUCapstoneResult] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FUCapstoneResult] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FUCapstoneResult] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FUCapstoneResult] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FUCapstoneResult] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FUCapstoneResult] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FUCapstoneResult] SET QUERY_STORE = OFF
GO
USE [FUCapstoneResult]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [nvarchar](50) NOT NULL,
	[PostID] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[CommentDetail] [nvarchar](max) NOT NULL,
	[CommentTime] [datetime] NOT NULL,
	[CommentStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentStatus]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentStatus](
	[CommentStatusID] [int] IDENTITY(1,1) NOT NULL,
	[CommentStatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CommentStatus] PRIMARY KEY CLUSTERED 
(
	[CommentStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ContentKey] [nvarchar](250) NOT NULL,
	[ContentValue] [ntext] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[InstructorID] [nvarchar](50) NOT NULL,
	[InstructorName] [nvarchar](200) NOT NULL,
	[InstructorImage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Instructors] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Majors]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Majors](
	[MajorID] [nvarchar](50) NOT NULL,
	[MajorName] [nvarchar](200) NOT NULL,
	[MajorImage] [ntext] NULL,
 CONSTRAINT [PK_Majors] PRIMARY KEY CLUSTERED 
(
	[MajorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [nvarchar](50) NOT NULL,
	[PostTitle] [nvarchar](300) NOT NULL,
	[PostDate] [date] NOT NULL,
	[PostAuthor] [nvarchar](200) NOT NULL,
	[PostContent] [nvarchar](max) NOT NULL,
	[PostImage] [nvarchar](max) NOT NULL,
	[LastEditedUser] [nvarchar](50) NOT NULL,
	[Upvote] [int] NOT NULL,
	[PostStatusID] [int] NOT NULL,
	[IsMainPost] [nvarchar](50) NULL,
	[ProjectID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostStatuses]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostStatuses](
	[PostStatusID] [int] IDENTITY(1,1) NOT NULL,
	[PostStatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PostStatuses] PRIMARY KEY CLUSTERED 
(
	[PostStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectInstructor]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectInstructor](
	[ProjectID] [nvarchar](50) NOT NULL,
	[InstructorID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectInstructor] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [nvarchar](50) NOT NULL,
	[ProjectName] [nvarchar](200) NOT NULL,
	[ProjectDescription] [nvarchar](max) NOT NULL,
	[ProjectImage] [nvarchar](max) NULL,
	[ProjectScore] [float] NOT NULL,
	[MajorID] [nvarchar](50) NOT NULL,
	[SemesterID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semesters](
	[SemesterID] [nvarchar](50) NOT NULL,
	[SemesterName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Semesters] PRIMARY KEY CLUSTERED 
(
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [nvarchar](50) NOT NULL,
	[StudentName] [nvarchar](250) NOT NULL,
	[MajorID] [nvarchar](50) NOT NULL,
	[StudentImage] [ntext] NOT NULL,
	[TeamID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagDetails]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagDetails](
	[TagDetailID] [nvarchar](50) NOT NULL,
	[TagDetailName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TagDetails] PRIMARY KEY CLUSTERED 
(
	[TagDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[PostID] [nvarchar](50) NOT NULL,
	[TagDetailID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC,
	[TagDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[TeamID] [nvarchar](50) NOT NULL,
	[TeamName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Teams_1] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserStatusID] [int] NOT NULL,
	[UserImage] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[SubEmail] [nvarchar](100) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[OTP] [nvarchar](6) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[UserStatusID] [int] IDENTITY(1,1) NOT NULL,
	[UserStatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserStatus] PRIMARY KEY CLUSTERED 
(
	[UserStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votes]    Script Date: 3/9/2022 5:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[UserID] [nvarchar](50) NOT NULL,
	[PostID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CommentStatus] ON 

INSERT [dbo].[CommentStatus] ([CommentStatusID], [CommentStatusName]) VALUES (1, N'Đang Chờ Xét Duyệt')
INSERT [dbo].[CommentStatus] ([CommentStatusID], [CommentStatusName]) VALUES (2, N'Đã Xét Duyệt')
INSERT [dbo].[CommentStatus] ([CommentStatusID], [CommentStatusName]) VALUES (3, N'Đã Bị Xóa')
SET IDENTITY_INSERT [dbo].[CommentStatus] OFF
GO
INSERT [dbo].[Content] ([ContentKey], [ContentValue]) VALUES (N'slide', N'[]')
INSERT [dbo].[Content] ([ContentKey], [ContentValue]) VALUES (N'timeline', N'[]')
GO
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [InstructorImage]) VALUES (N'1', N'Thầy Nguyễn Thế Hoàng', N'https://hcmuni.fpt.edu.vn/Data/Sites/1/media/2018/06/giao-l%C3%A0ng-768x432.jpg')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [InstructorImage]) VALUES (N'3', N'Cô Thân Thị Ngọc Vân', N'https://fpt.edu.vn/Resources/article/uploads/2020/11/ANH%201%20BAI%20PR%2012%20v1.png')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [InstructorImage]) VALUES (N'4', N'Thầy Đoàn Nguyễn Thành Hòa', N'https://scontent.fsgn2-4.fna.fbcdn.net/v/t31.18172-8/20729154_10203459490283234_6369935824807666706_o.jpg?_nc_cat=101&ccb=1-5&_nc_sid=19026a&_nc_ohc=c4tt8hVBOiYAX_tXVcI&tn=MWZAySIbj1ZgudIA&_nc_ht=scontent.fsgn2-4.fna&oh=00_AT9VynNFUvoBhwzOe0NTPt5jJyU4ThhroAYeYiElHxFFZg&oe=624D6032')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [InstructorImage]) VALUES (N'5', N'Thầy Lâm Hữu Khánh Phương', N'https://i.chungta.vn/2016/11/18/ictnews-20-11-ngay-nha-giao-vi-7477-6336-1479432744.jpg')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [InstructorImage]) VALUES (N'6', N'Thầy Ngô Đăng Hà An', N'https://hcmuni.fpt.edu.vn/Data/Sites/1/News/335/ngo-dang-ha-an.jpg')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [InstructorImage]) VALUES (N'7', N'Thầy Kiều Trọng Khánh', N'https://hcmuni.fpt.edu.vn/Data/Sites/1/media/zz2020file/teacher/thaykieutrongkhanh.jpg')
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [InstructorImage]) VALUES (N'GV123', N'Thầy Thân Văn Sử', N'https://hcmuni.fpt.edu.vn/Data/Sites/1/media/z2021/th%E1%BA%A7y-th%C3%A2n-v%C4%83n-s%E1%BB%AD/dhfptthaythanvansu.jpg')
GO
INSERT [dbo].[Majors] ([MajorID], [MajorName], [MajorImage]) VALUES (N'1', N'Kỹ Thuật Phần Mềm', N'ok')
INSERT [dbo].[Majors] ([MajorID], [MajorName], [MajorImage]) VALUES (N'2', N'An Toàn Thông Tin', N'ok')
GO
SET IDENTITY_INSERT [dbo].[PostStatuses] ON 

INSERT [dbo].[PostStatuses] ([PostStatusID], [PostStatusName]) VALUES (1, N'Đã Xuất Bản')
INSERT [dbo].[PostStatuses] ([PostStatusID], [PostStatusName]) VALUES (2, N'Đang Chờ Duyệt')
INSERT [dbo].[PostStatuses] ([PostStatusID], [PostStatusName]) VALUES (3, N'Đã Xóa')
SET IDENTITY_INSERT [dbo].[PostStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[Semesters] ([SemesterID], [SemesterName]) VALUES (N'1', N'Fall 2021')
INSERT [dbo].[Semesters] ([SemesterID], [SemesterName]) VALUES (N'2', N'Spring 2021')
GO
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'068b353f-2da9-471b-ad07-0ec1848329d2', N'711')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'10c21347-32d5-46b4-9bc3-74c54f406ddf', N'Okoko')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'1e4a9e98-868f-4cba-8d25-fcf8a6891474', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'239b9256-2872-417d-afec-2c9b91458928', N'test')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'26b10082-f20d-4ab4-b624-503d4596299b', N'test')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'270a2a7e-dd5b-4c6c-8a13-fd446896d398', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'28b25762-c22a-4290-953f-5c51b5fe844e', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'3016bcb8-0c52-4bf9-b48d-0ca117b7bff3', N'testthoi')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'35500ce2-c067-4068-88bc-08f489d0b121', N'ok good')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'380de5a9-a033-4c55-8254-82381dda9d90', N'okok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'4334581f-109b-4c61-a6cd-c6c3b9418e9a', N'online')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'4fc4e23a-49f8-4903-aa2f-fff79c167d17', N'hoconline')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'5670346e-9b6a-48cb-9243-34846371025b', N'oko')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'56a19246-3bab-478e-96c4-98abf7c2a5b7', N'qua ghe')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'5abc0f0a-6349-4ee7-b664-15eee7f7a9cc', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'60aab4b6-5e68-41d7-bb2b-7f80f90ba13b', N'hcmu')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'6795925a-f0c8-43ec-8898-1f19a7138f6b', N'testtag')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'73dbeead-16c6-41ff-82d5-ca9e582b2481', N'alo')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'8f1e4fa3-684e-4b1f-992a-376e0c584707', N'ghe z ')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'98561bc4-3f74-4353-ba8b-ec01af3c594b', N'hello')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'98b6ef63-05ad-4cf3-bf05-5955827a6c3f', N'alo')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'9bb57b9c-3898-480c-bd64-6c726f97acd5', N'hay')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'9e56fcf8-ccaf-47a4-a9ff-da2bf44dc94a', N'ngon day')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'ab4b0e9f-4ca4-469e-a478-73c5a8a9cf16', N'test')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'ab5e43e2-6db9-4b27-8916-03fa863226ac', N'14/2')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'b0ec2eed-a0ff-4d68-a558-0ae41869490c', N'')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'b352f452-d567-4652-b0c5-3d0390c4baf4', N'troi')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'b5fb70f4-3db3-4fbb-a2fe-ffcd80156961', N'fpt')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'bc3f1ab9-f9ce-4f81-8aff-981543152738', N'ghe du z')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'c7283fb3-19da-4699-9106-d8d00cc3b55b', N'luon')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'c7b1ce47-2730-45ac-a46b-2367cc4e6bd6', N'di')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'd07357bf-72c8-4adc-9c03-8220f0f16be0', N'qua')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'dc134bdf-8341-40ac-ba51-150e083e80d1', N'fptu')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'deae5a32-bece-4877-b92c-0d057fd994c8', N'testtagnha')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'e63d73a8-16ca-49c4-af5d-35e2012d80ab', N'testtag')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'ebdd3ee9-a863-4924-8b57-c08109632a28', N'gôd')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'f1246c6b-d677-4e50-9fd3-5d991ad391b4', N'ghe gom')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'f2af66c2-4ed7-4a90-abeb-19225c2f3dad', N'oi')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'fcce1d49-4f16-4fcb-98ea-4ed0d875f7e0', N'hcmu')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'1', N'1', CAST(N'2021-01-01T00:00:00.000' AS DateTime), 2, N'1         ', N'1', NULL, N'1', N'1', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'4d301e43-5cf3-4f2e-a3bd-60a945cfb672', N'Võ Đức Minh', CAST(N'2022-03-07T11:57:37.000' AS DateTime), 2, N'', N'voducminh140201@gmail.com', NULL, N'', N'', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'4f9a70eb-b736-4d59-8ed7-ffceaef6efb6', N'Min Min', CAST(N'2022-02-09T17:45:59.000' AS DateTime), 2, N'', N'voducminh01@gmail.com', NULL, N'1', N'', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'5a1e40f4-a2a3-4078-a257-21863e042b12', N'Võ Đức Minh', CAST(N'2022-01-16T21:42:19.000' AS DateTime), 2, N'          ', N'minhvdse150114@fpt.edu.vn', NULL, N'1', N'', 1)
GO
SET IDENTITY_INSERT [dbo].[UserStatus] ON 

INSERT [dbo].[UserStatus] ([UserStatusID], [UserStatusName]) VALUES (2, N'Active')
SET IDENTITY_INSERT [dbo].[UserStatus] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_CommentStatus] FOREIGN KEY([CommentStatusID])
REFERENCES [dbo].[CommentStatus] ([CommentStatusID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_CommentStatus]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Posts] FOREIGN KEY([IsMainPost])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Posts]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostStatuses] FOREIGN KEY([PostStatusID])
REFERENCES [dbo].[PostStatuses] ([PostStatusID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_PostStatuses]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Projects]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([LastEditedUser])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
ALTER TABLE [dbo].[ProjectInstructor]  WITH CHECK ADD  CONSTRAINT [FK_ProjectInstructor_Instructors] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructors] ([InstructorID])
GO
ALTER TABLE [dbo].[ProjectInstructor] CHECK CONSTRAINT [FK_ProjectInstructor_Instructors]
GO
ALTER TABLE [dbo].[ProjectInstructor]  WITH CHECK ADD  CONSTRAINT [FK_ProjectInstructor_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[ProjectInstructor] CHECK CONSTRAINT [FK_ProjectInstructor_Projects]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Majors] FOREIGN KEY([MajorID])
REFERENCES [dbo].[Majors] ([MajorID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Majors]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Semesters] FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semesters] ([SemesterID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Semesters]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Teams] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Teams] ([TeamID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Teams]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Majors] FOREIGN KEY([MajorID])
REFERENCES [dbo].[Majors] ([MajorID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Majors]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Teams] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Teams] ([TeamID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Teams]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_Posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_Posts]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_TagDetails1] FOREIGN KEY([TagDetailID])
REFERENCES [dbo].[TagDetails] ([TagDetailID])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_TagDetails1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserStatus] FOREIGN KEY([UserStatusID])
REFERENCES [dbo].[UserStatus] ([UserStatusID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserStatus]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Posts]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Users]
GO
USE [master]
GO
ALTER DATABASE [FUCapstoneResult] SET  READ_WRITE 
GO
