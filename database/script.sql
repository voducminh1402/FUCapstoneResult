 
USE [master]
GO
/****** Object:  Database [FUCapstoneResult]    Script Date: 2/9/2022 10:48:50 AM ******/
CREATE DATABASE [FUCapstoneResult]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTResultCapstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTResultCapstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPTResultCapstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTResultCapstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Comments]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[CommentStatus]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[Instructors]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[Majors]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[POPostStatuses]    Script Date: 2/9/2022 10:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POPostStatuses](
	[POPostStatusID] [int] IDENTITY(1,1) NOT NULL,
	[POPostName] [nvarchar](50) NULL,
 CONSTRAINT [PK_POPostStatuses] PRIMARY KEY CLUSTERED 
(
	[POPostStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 2/9/2022 10:48:50 AM ******/
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
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostStatuses]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[ProjectInstructor]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[ProjectOwnerCommentStatuses]    Script Date: 2/9/2022 10:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectOwnerCommentStatuses](
	[CommentStatusID] [int] NOT NULL,
	[CommentStatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectOwnerCommentStatuses] PRIMARY KEY CLUSTERED 
(
	[CommentStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectOwnerPostComments]    Script Date: 2/9/2022 10:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectOwnerPostComments](
	[CommentID] [nvarchar](50) NOT NULL,
	[POPostID] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[CommentDetail] [nvarchar](max) NOT NULL,
	[CommentTime] [datetime] NOT NULL,
	[CommentStatusID] [int] NOT NULL,
 CONSTRAINT [PK_ProjectOwnerPostComments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectOwnerPosts]    Script Date: 2/9/2022 10:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectOwnerPosts](
	[POPostID] [nvarchar](50) NOT NULL,
	[POPostTitle] [nvarchar](500) NOT NULL,
	[POPostContent] [nvarchar](max) NOT NULL,
	[POPostImage] [nvarchar](max) NOT NULL,
	[POPostDate] [date] NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[LastEditedUser] [nvarchar](50) NOT NULL,
	[Upvote] [nchar](10) NOT NULL,
	[POPostStatusID] [int] NOT NULL,
	[PostID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectOwnerPosts] PRIMARY KEY CLUSTERED 
(
	[POPostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectOwnerPostVotes]    Script Date: 2/9/2022 10:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectOwnerPostVotes](
	[UserID] [nvarchar](50) NOT NULL,
	[POPostID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectOwnerPostVotes] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[POPostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectOwnerTagDetails]    Script Date: 2/9/2022 10:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectOwnerTagDetails](
	[TagDetailID] [nvarchar](50) NOT NULL,
	[TagDetailName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProjectOwnerTagDetails] PRIMARY KEY CLUSTERED 
(
	[TagDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectOwnerTags]    Script Date: 2/9/2022 10:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectOwnerTags](
	[POPostID] [nvarchar](50) NOT NULL,
	[TagDetailID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectOwnerTags] PRIMARY KEY CLUSTERED 
(
	[POPostID] ASC,
	[TagDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[Semesters]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[TagDetails]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[Teams]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[UserStatus]    Script Date: 2/9/2022 10:48:50 AM ******/
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
/****** Object:  Table [dbo].[Votes]    Script Date: 2/9/2022 10:48:50 AM ******/
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
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [InstructorImage]) VALUES (N'1', N'HoangNT', N'ok')
GO
INSERT [dbo].[Majors] ([MajorID], [MajorName], [MajorImage]) VALUES (N'1', N'KTMP', N'ok')
GO
SET IDENTITY_INSERT [dbo].[PostStatuses] ON 

INSERT [dbo].[PostStatuses] ([PostStatusID], [PostStatusName]) VALUES (1, N'Đã Xuất Bản')
INSERT [dbo].[PostStatuses] ([PostStatusID], [PostStatusName]) VALUES (2, N'Đang Chờ Duyệt')
INSERT [dbo].[PostStatuses] ([PostStatusID], [PostStatusName]) VALUES (3, N'Đã Xóa')
SET IDENTITY_INSERT [dbo].[PostStatuses] OFF
GO
INSERT [dbo].[ProjectInstructor] ([ProjectID], [InstructorID]) VALUES (N'1', N'1')
GO
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [ProjectDescription], [ProjectImage], [ProjectScore], [MajorID], [SemesterID]) VALUES (N'1', N'Đồ Án Đỗ Xe Máy Tự Động', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', N'https://s3storage.2banh.vn/image/2016/05/hinh-anh-bai-do-xe-ken-day-toan-xe-may-67-min-kho-honda-cd-632-1462506698-572c14ca6ee98.jpg', 8.25, N'1', N'1')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [ProjectDescription], [ProjectImage], [ProjectScore], [MajorID], [SemesterID]) VALUES (N'2', N'Hệ Thống Mua Hàng 711 Hộ', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', N'https://hcmuni.fpt.edu.vn/Data/Sites/1/media/z2021/khu-%E1%BA%A9m-th%E1%BB%B1c/dhfptkhuamthuc11.png', 8, N'1', N'1')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [ProjectDescription], [ProjectImage], [ProjectScore], [MajorID], [SemesterID]) VALUES (N'3', N'Code Tự Động Bằng Sóng Não', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', N'https://www.brainent.com/wp-content/uploads/2020/11/brain_waves-2.jpg', 9.5, N'1', N'1')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [ProjectDescription], [ProjectImage], [ProjectScore], [MajorID], [SemesterID]) VALUES (N'87a71150-51fb-496a-8735-d371aed91284', N'Hệ Thống Tự Động Cho Điểm 10', N'<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s</p>
', N'https://i.imgur.com/lgxFrTj.jpg', 10, N'1', N'1')
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[Semesters] ([SemesterID], [SemesterName]) VALUES (N'1', N'Spring 2021')
GO
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'1', N'Võ Đức Minh', N'1', N'123', N'1')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'2', N'Trần Quang Quyền', N'1', N'123', N'1')
GO
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'0acb430d-1c86-470e-b89b-3c3644aff64e', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'15f15c5e-3be7-45c3-981c-3b85b712d347', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'1dc95834-4d80-4cd3-ae2c-fcd6d1b0f359', N'hcmuni')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'207a939c-7e53-41d4-a95c-9d357ec79ddb', N'test lai')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'235b6d31-a55f-45f8-8e0c-742a20001061', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'2b0d8c8d-0b3b-435a-b695-e0e7a092625d', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'2c1d72e1-171c-40b7-b918-9915b1d4215c', N'good')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'30bf54ab-8d92-49fb-a405-c3147d2732f3', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'312d4acd-22a4-4fae-8ee0-fead61c91607', N'ok day')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'33fddaca-4f99-4c2c-b6cf-c2feb38197ea', N'edu')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'3401b7f7-7a8b-4e81-8b94-9d9bdd192d2a', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'37ef14be-2592-4fff-87ce-843e2bf8d117', N'xemay')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'384b5e18-1c8b-4f92-8639-76efb04f6423', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'3d94672c-d538-4974-a419-81d6476ba074', N'hehe')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'4844cfce-15ad-48a8-98b8-14394fc3461a', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'4cfae97f-0770-4b39-901e-3ffcc9539a48', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'4f1f8c0c-f3ef-4a79-a0b5-715875aa2841', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'5de4372f-01da-47c9-8584-d6b8ab8268b2', N'good')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'6697f982-79bf-43fe-ba0d-d80e21111cab', N'fpt')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'6c7e8cba-e1e4-445c-b06a-2cce8cb81084', N'songnao')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'71c0ce28-6e12-4601-88a0-fb2abc7b083f', N'good')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'782004ab-d31a-4852-a847-8566f30ab572', N'fpt ')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'79f0a18e-e360-4c36-b82a-48168f347751', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'7cfcbcf4-2364-4ae7-a935-e721894be7a5', N'àas')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'867fc146-bfef-40e1-b183-c0333858aed5', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'8b789d1a-7245-4469-9434-a28aa4779135', N'fpt')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'90454430-879a-4fcf-926d-17a04d1d7116', N'uni')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'99fe6916-e898-4d0c-b7c0-d5bb65a56dcc', N'xemay')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'a683605d-dba9-4340-a0a9-a1ff85625278', N'good')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'a86d07f5-cfe9-4a7c-8d62-0e10fd6bc07b', N'hehe')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'abc43b7b-1063-4c6c-8c53-46bab919d407', N'hehe')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'b67b1e72-afe2-49df-b0c8-d941c5fe5f20', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'bcc2966f-22ad-4aab-8f3b-c4969143de4e', N'ok day')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'bf272149-76d4-4940-b8e8-353a43566725', N'test lai')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'd30e417f-e99e-404b-b8e0-244c7a3c0c72', N'hc')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'd7f8cc83-ecea-42ef-b9f3-4ed7af72bc62', N'sinhvien')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'deaf0f5d-cdc2-4563-86d4-9b2251d9d872', N'711')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'f3bd3bd0-bfc8-43a3-b33f-6d94eca3365a', N'hcm')
GO
INSERT [dbo].[Teams] ([TeamID], [TeamName]) VALUES (N'1', N'GaoTeam')
INSERT [dbo].[Teams] ([TeamID], [TeamName]) VALUES (N'2', N'SuperTeam')
INSERT [dbo].[Teams] ([TeamID], [TeamName]) VALUES (N'3', N'5AnhEmTeam')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'1', N'1', CAST(N'2021-01-01T00:00:00.000' AS DateTime), 2, N'1         ', N'1', NULL, N'1', N'1', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'5a1e40f4-a2a3-4078-a257-21863e042b12', N'Vo Duc Minh', CAST(N'2022-01-16T21:42:19.000' AS DateTime), 2, N'          ', N'minhvdse150114@fpt.edu.vn', NULL, N'', N'', 1)
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
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostStatuses] FOREIGN KEY([PostStatusID])
REFERENCES [dbo].[PostStatuses] ([PostStatusID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_PostStatuses]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Projects1] FOREIGN KEY([PostID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Projects1]
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
ALTER TABLE [dbo].[ProjectOwnerPostComments]  WITH CHECK ADD  CONSTRAINT [FK_ProjectOwnerPostComments_ProjectOwnerCommentStatuses] FOREIGN KEY([CommentStatusID])
REFERENCES [dbo].[ProjectOwnerCommentStatuses] ([CommentStatusID])
GO
ALTER TABLE [dbo].[ProjectOwnerPostComments] CHECK CONSTRAINT [FK_ProjectOwnerPostComments_ProjectOwnerCommentStatuses]
GO
ALTER TABLE [dbo].[ProjectOwnerPostComments]  WITH CHECK ADD  CONSTRAINT [FK_ProjectOwnerPostComments_ProjectOwnerPosts] FOREIGN KEY([POPostID])
REFERENCES [dbo].[ProjectOwnerPosts] ([POPostID])
GO
ALTER TABLE [dbo].[ProjectOwnerPostComments] CHECK CONSTRAINT [FK_ProjectOwnerPostComments_ProjectOwnerPosts]
GO
ALTER TABLE [dbo].[ProjectOwnerPosts]  WITH CHECK ADD  CONSTRAINT [FK_ProjectOwnerPosts_POPostStatuses] FOREIGN KEY([POPostStatusID])
REFERENCES [dbo].[POPostStatuses] ([POPostStatusID])
GO
ALTER TABLE [dbo].[ProjectOwnerPosts] CHECK CONSTRAINT [FK_ProjectOwnerPosts_POPostStatuses]
GO
ALTER TABLE [dbo].[ProjectOwnerPosts]  WITH CHECK ADD  CONSTRAINT [FK_ProjectOwnerPosts_Posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[ProjectOwnerPosts] CHECK CONSTRAINT [FK_ProjectOwnerPosts_Posts]
GO
ALTER TABLE [dbo].[ProjectOwnerPosts]  WITH CHECK ADD  CONSTRAINT [FK_ProjectOwnerPosts_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[ProjectOwnerPosts] CHECK CONSTRAINT [FK_ProjectOwnerPosts_Students]
GO
ALTER TABLE [dbo].[ProjectOwnerPostVotes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectOwnerPostVotes_ProjectOwnerPosts] FOREIGN KEY([POPostID])
REFERENCES [dbo].[ProjectOwnerPosts] ([POPostID])
GO
ALTER TABLE [dbo].[ProjectOwnerPostVotes] CHECK CONSTRAINT [FK_ProjectOwnerPostVotes_ProjectOwnerPosts]
GO
ALTER TABLE [dbo].[ProjectOwnerPostVotes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectOwnerPostVotes_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProjectOwnerPostVotes] CHECK CONSTRAINT [FK_ProjectOwnerPostVotes_Users]
GO
ALTER TABLE [dbo].[ProjectOwnerTags]  WITH CHECK ADD  CONSTRAINT [FK_ProjectOwnerTags_ProjectOwnerPosts] FOREIGN KEY([POPostID])
REFERENCES [dbo].[ProjectOwnerPosts] ([POPostID])
GO
ALTER TABLE [dbo].[ProjectOwnerTags] CHECK CONSTRAINT [FK_ProjectOwnerTags_ProjectOwnerPosts]
GO
ALTER TABLE [dbo].[ProjectOwnerTags]  WITH CHECK ADD  CONSTRAINT [FK_ProjectOwnerTags_ProjectOwnerTagDetails] FOREIGN KEY([TagDetailID])
REFERENCES [dbo].[ProjectOwnerTagDetails] ([TagDetailID])
GO
ALTER TABLE [dbo].[ProjectOwnerTags] CHECK CONSTRAINT [FK_ProjectOwnerTags_ProjectOwnerTagDetails]
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
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Projects] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Projects]
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
© 2022 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
