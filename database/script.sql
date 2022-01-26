USE [master]
GO
/****** Object:  Database [FUCapstoneResult]    Script Date: 1/19/2022 11:40:58 PM ******/
CREATE DATABASE [FUCapstoneResult]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTResultCapstone', FILENAME = N'D:\SQL\SQL2019_Exp\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTResultCapstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPTResultCapstone_log', FILENAME = N'D:\SQL\SQL2019_Exp\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTResultCapstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Comments]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[CommentStatus]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[Instructors]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[Majors]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[POPostStatuses]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 1/19/2022 11:40:58 PM ******/
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
	[ProjectID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostStatuses]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[ProjectInstructor]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[ProjectOwnerCommentStatuses]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[ProjectOwnerPostComments]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[ProjectOwnerPosts]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[ProjectOwnerPostVotes]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[ProjectOwnerTagDetails]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[ProjectOwnerTags]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[Projects]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[Semesters]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[TagDetails]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[Teams]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 1/19/2022 11:40:58 PM ******/
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
	[Password] [nvarchar](max) NOT NULL,
	[OTP] [nvarchar](6) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 1/19/2022 11:40:58 PM ******/
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
/****** Object:  Table [dbo].[Votes]    Script Date: 1/19/2022 11:40:58 PM ******/
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
INSERT [dbo].[Instructors] ([InstructorID], [InstructorName], [InstructorImage]) VALUES (N'1', N'HoangNT', N'ok')
GO
INSERT [dbo].[Majors] ([MajorID], [MajorName], [MajorImage]) VALUES (N'1', N'KTMP', N'ok')
GO
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [ProjectID]) VALUES (N'1502edfa-49d2-43a9-b4de-44efce302bbd', N'Code Tự Động Bằng Sóng Não', CAST(N'2022-01-19' AS Date), N'Võ Đức Minh 1', N'<p>&nbsp;</p>
<p><img src=''https://i.imgur.com/cq9B5SF.jpg'' /></p>
<p>ok</p>
<p><img src=''https://i.imgur.com/olfNvHQ.jpg'' />hcm</p>
<p>&nbsp;</p>
', N'https://i.imgur.com/SlPAg4F.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 3, N'2')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [ProjectID]) VALUES (N'1ca2ea84-bdcd-4c87-8c1a-e5816e566ed1', N'Sinh Viên Đại Học FPT Xây Dựng Hệ Thống Đỗ Xe Máy Siêu Xịn Test', CAST(N'2022-01-19' AS Date), N'Võ Đức Minh', N'<p>Lorem ip<strong>sum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididu</strong>nt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa. Commodo odio aenean sed adipiscing diam donec adipiscing tristique. Mi eget mauris pharetra et. Non tellus orci ac auctor augue. Elit at imperdiet dui accumsan sit. Ornare arcu dui vivamu<em>s arcu felis. Egestas integer eget aliquet nibh praesent. In hac habitasse platea dictumst quisque sagittis purus. Pulvinar elementum integer enim neque volutpat ac.</em></p>
<p>&nbsp;</p>
<p><em><img src=''https://i.imgur.com/JIAfkr2.jpg'' /></em></p>
', N'https://i.imgur.com/g6XFReo.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 3, N'1')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [ProjectID]) VALUES (N'46193a22-f173-43a3-ab83-72a1c2d35666', N'Sinh Viên Đại Học FPT Xây Dựng Hệ Thống Đỗ Xe Máy Siêu Xịn 3:58', CAST(N'2022-01-18' AS Date), N'Võ Đức Minh', N'<p>ok</p>
<p><strong>besst</strong></p>
<p>&nbsp;</p>
<p><strong><img src=''https://i.imgur.com/exDZAr2.png'' /></strong></p>
', N'https://i.imgur.com/nAh8Fu8.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 1, N'1')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [ProjectID]) VALUES (N'5d2acb9e-d685-4806-97fb-95bffe0364dc', N'Sinh Viên Đại Học FPT Xây Dựng Hệ Thống Đỗ Xe Máy Siêu Xịn 18/1', CAST(N'2022-01-18' AS Date), N'Võ Đức Minh', N'<p>ok good</p>
<p><strong>hello</strong></p>
<p><img src="https://i.imgur.com/ml9gW9Q.jpg" /></p>
<p>&nbsp;</p>
', N'https://i.imgur.com/42Zkac2.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 3, N'1')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [ProjectID]) VALUES (N'6a439d0a-34d9-471c-9b8e-2ee04174ab72', N'Code Tự Động Bằng Sóng Não', CAST(N'2022-01-19' AS Date), N'Võ Đức Minh', N'<p><img src=''https://i.imgur.com/so3S0GI.png'' /></p>
', N'https://i.imgur.com/t0xXKCP.png', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 1, N'3')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [ProjectID]) VALUES (N'89d48001-62af-413b-b447-fc446efec7d6', N'Code Tự Động Bằng Sóng Não', CAST(N'2022-01-19' AS Date), N'Võ Đức Minh', N'<h2>What is Lorem Ipsum?</h2>
<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
<p><img src="https://i.imgur.com/Bhykfas.jpg" /></p>
', N'https://i.imgur.com/fn7cDoc.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 1, N'3')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [ProjectID]) VALUES (N'b14c96e4-6a54-483b-b3f6-dd6a22a0f346', N'711 Không Một Bóng Người Vì Sinh Viên Chuyển Sang Dùng Dịch Vụ Mua Hàng Hộ', CAST(N'2022-01-18' AS Date), N'Võ Đức Minh', N'<h2>What is Lorem Ipsum?</h2>
<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
<p>&nbsp;</p>
<p><img src="https://i.imgur.com/JmLMsXG.jpg" /></p>
', N'https://i.imgur.com/xkMUg1B.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 3, N'2')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [ProjectID]) VALUES (N'cb7e7189-866d-4090-8f9e-f169f33556c4', N'Sinh Viên Đại Học FPT Xây Dựng Hệ Thống Đỗ Xe Máy Siêu Xịn', CAST(N'2022-01-18' AS Date), N'Võ Đức Minh', N'<p>ok</p>
<p><strong>besst content</strong></p>
<p><img src=''https://i.imgur.com/EEuqlLL.jpg'' /></p>
<p>&nbsp;</p>
', N'https://i.imgur.com/HE3AieV.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 3, N'1')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [ProjectID]) VALUES (N'cf7bd93f-3f47-48fd-9a2b-54e9c96725ea', N'Sinh Viên Đại Học FPT Xây Dựng Hệ Thống Đỗ Xe Máy Siêu Xịn', CAST(N'2022-01-19' AS Date), N'Võ Đức Minh', N'<p><img src=''https://i.imgur.com/nvSd0DW.jpg'' /></p>
', N'https://i.imgur.com/Ljun5Ys.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 3, N'3')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [ProjectID]) VALUES (N'f3dcb79d-9893-46cf-bb92-c7a555b50daa', N'Sinh Viên Đại Học FPT Xây Dựng Hệ Thống Đỗ Xe Máy Siêu Xịn', CAST(N'2022-01-19' AS Date), N'Võ Đức Minh', N'<p><img src="https://i.imgur.com/sB8S1TB.jpg" /></p>
', N'https://i.imgur.com/6Ugpuem.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 3, N'3')
GO
SET IDENTITY_INSERT [dbo].[PostStatuses] ON 

INSERT [dbo].[PostStatuses] ([PostStatusID], [PostStatusName]) VALUES (1, N'Đã Xuất Bản')
INSERT [dbo].[PostStatuses] ([PostStatusID], [PostStatusName]) VALUES (2, N'Đang Chờ Duyệt')
INSERT [dbo].[PostStatuses] ([PostStatusID], [PostStatusName]) VALUES (3, N'Đã Xóa')
SET IDENTITY_INSERT [dbo].[PostStatuses] OFF
GO
INSERT [dbo].[ProjectInstructor] ([ProjectID], [InstructorID]) VALUES (N'1', N'1')
GO
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [ProjectDescription], [ProjectImage], [ProjectScore], [MajorID], [SemesterID]) VALUES (N'1', N'Đồ Án Đỗ Xe Máy Tự Động', N'1', N'1', 1, N'1', N'1')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [ProjectDescription], [ProjectImage], [ProjectScore], [MajorID], [SemesterID]) VALUES (N'2', N'Hệ Thống Mua Hàng 711 Hộ', N'1', N'1', 1, N'1', N'1')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [ProjectDescription], [ProjectImage], [ProjectScore], [MajorID], [SemesterID]) VALUES (N'3', N'Đồ Án Code Tự Động Bằng Sóng Não', N'1', N'1', 1, N'1', N'1')
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
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'15f15c5e-3be7-45c3-981c-3b85b712d347', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'1dc95834-4d80-4cd3-ae2c-fcd6d1b0f359', N'hcmuni')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'33fddaca-4f99-4c2c-b6cf-c2feb38197ea', N'edu')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'3401b7f7-7a8b-4e81-8b94-9d9bdd192d2a', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'37ef14be-2592-4fff-87ce-843e2bf8d117', N'xemay')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'384b5e18-1c8b-4f92-8639-76efb04f6423', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'4844cfce-15ad-48a8-98b8-14394fc3461a', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'4cfae97f-0770-4b39-901e-3ffcc9539a48', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'4f1f8c0c-f3ef-4a79-a0b5-715875aa2841', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'6697f982-79bf-43fe-ba0d-d80e21111cab', N'fpt')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'6c7e8cba-e1e4-445c-b06a-2cce8cb81084', N'songnao')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'71c0ce28-6e12-4601-88a0-fb2abc7b083f', N'good')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'782004ab-d31a-4852-a847-8566f30ab572', N'fpt ')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'79f0a18e-e360-4c36-b82a-48168f347751', N'hcm')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'8b789d1a-7245-4469-9434-a28aa4779135', N'fpt')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'90454430-879a-4fcf-926d-17a04d1d7116', N'uni')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'99fe6916-e898-4d0c-b7c0-d5bb65a56dcc', N'xemay')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'd30e417f-e99e-404b-b8e0-244c7a3c0c72', N'hc')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'd7f8cc83-ecea-42ef-b9f3-4ed7af72bc62', N'sinhvien')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'deaf0f5d-cdc2-4563-86d4-9b2251d9d872', N'711')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'f3bd3bd0-bfc8-43a3-b33f-6d94eca3365a', N'hcm')
GO
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'1502edfa-49d2-43a9-b4de-44efce302bbd', N'384b5e18-1c8b-4f92-8639-76efb04f6423')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'1ca2ea84-bdcd-4c87-8c1a-e5816e566ed1', N'8b789d1a-7245-4469-9434-a28aa4779135')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'1ca2ea84-bdcd-4c87-8c1a-e5816e566ed1', N'99fe6916-e898-4d0c-b7c0-d5bb65a56dcc')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'1ca2ea84-bdcd-4c87-8c1a-e5816e566ed1', N'f3bd3bd0-bfc8-43a3-b33f-6d94eca3365a')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'46193a22-f173-43a3-ab83-72a1c2d35666', N'37ef14be-2592-4fff-87ce-843e2bf8d117')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'46193a22-f173-43a3-ab83-72a1c2d35666', N'4cfae97f-0770-4b39-901e-3ffcc9539a48')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'46193a22-f173-43a3-ab83-72a1c2d35666', N'71c0ce28-6e12-4601-88a0-fb2abc7b083f')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'6a439d0a-34d9-471c-9b8e-2ee04174ab72', N'd30e417f-e99e-404b-b8e0-244c7a3c0c72')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'89d48001-62af-413b-b447-fc446efec7d6', N'3401b7f7-7a8b-4e81-8b94-9d9bdd192d2a')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'89d48001-62af-413b-b447-fc446efec7d6', N'6697f982-79bf-43fe-ba0d-d80e21111cab')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'89d48001-62af-413b-b447-fc446efec7d6', N'6c7e8cba-e1e4-445c-b06a-2cce8cb81084')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'89d48001-62af-413b-b447-fc446efec7d6', N'90454430-879a-4fcf-926d-17a04d1d7116')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'b14c96e4-6a54-483b-b3f6-dd6a22a0f346', N'33fddaca-4f99-4c2c-b6cf-c2feb38197ea')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'b14c96e4-6a54-483b-b3f6-dd6a22a0f346', N'782004ab-d31a-4852-a847-8566f30ab572')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'b14c96e4-6a54-483b-b3f6-dd6a22a0f346', N'd7f8cc83-ecea-42ef-b9f3-4ed7af72bc62')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'b14c96e4-6a54-483b-b3f6-dd6a22a0f346', N'deaf0f5d-cdc2-4563-86d4-9b2251d9d872')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'cb7e7189-866d-4090-8f9e-f169f33556c4', N'15f15c5e-3be7-45c3-981c-3b85b712d347')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'cb7e7189-866d-4090-8f9e-f169f33556c4', N'1dc95834-4d80-4cd3-ae2c-fcd6d1b0f359')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'cb7e7189-866d-4090-8f9e-f169f33556c4', N'4f1f8c0c-f3ef-4a79-a0b5-715875aa2841')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'cf7bd93f-3f47-48fd-9a2b-54e9c96725ea', N'4844cfce-15ad-48a8-98b8-14394fc3461a')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'f3dcb79d-9893-46cf-bb92-c7a555b50daa', N'79f0a18e-e360-4c36-b82a-48168f347751')
GO
INSERT [dbo].[Teams] ([TeamID], [TeamName]) VALUES (N'1', N'GaoTeam')
INSERT [dbo].[Teams] ([TeamID], [TeamName]) VALUES (N'2', N'SuperTeam')
INSERT [dbo].[Teams] ([TeamID], [TeamName]) VALUES (N'3', N'5AnhEmTeam')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [Password], [OTP], [RoleID]) VALUES (N'1', N'1', CAST(N'2021-01-01T00:00:00.000' AS DateTime), 2, N'1         ', N'1', N'1', N'1', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [Password], [OTP], [RoleID]) VALUES (N'5a1e40f4-a2a3-4078-a257-21863e042b12', N'Vo Duc Minh', CAST(N'2022-01-16T21:42:19.000' AS DateTime), 2, N'          ', N'minhvdse150114@fpt.edu.vn', N'', N'', 1)
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