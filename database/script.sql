USE [master]
GO
/****** Object:  Database [FUCapstoneResult]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[CommentStatus]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Content]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Instructors]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Majors]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[PostStatuses]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[ProjectInstructor]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Projects]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Semesters]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[TagDetails]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Teams]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[UserStatus]    Script Date: 3/28/2022 6:08:55 PM ******/
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
/****** Object:  Table [dbo].[Votes]    Script Date: 3/28/2022 6:08:55 PM ******/
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
INSERT [dbo].[Comments] ([CommentID], [PostID], [UserID], [CommentDetail], [CommentTime], [CommentStatusID]) VALUES (N'10a38fbd-5be2-41de-b7d3-2a9649148742', N'2', N'5a1e40f4-a2a3-4078-a257-21863e042b12', N'good job 3', CAST(N'2022-03-10T12:29:46.000' AS DateTime), 2)
INSERT [dbo].[Comments] ([CommentID], [PostID], [UserID], [CommentDetail], [CommentTime], [CommentStatusID]) VALUES (N'7a4772ef-5e67-4854-bd8d-855d3f3503b6', N'2', N'5a1e40f4-a2a3-4078-a257-21863e042b12', N'test comment', CAST(N'2022-03-10T12:54:18.000' AS DateTime), 2)
INSERT [dbo].[Comments] ([CommentID], [PostID], [UserID], [CommentDetail], [CommentTime], [CommentStatusID]) VALUES (N'9fa54951-24ff-4ba5-8018-119fd134b410', N'2', N'5a1e40f4-a2a3-4078-a257-21863e042b12', N'good job', CAST(N'2022-03-10T12:29:21.000' AS DateTime), 3)
INSERT [dbo].[Comments] ([CommentID], [PostID], [UserID], [CommentDetail], [CommentTime], [CommentStatusID]) VALUES (N'c9d07737-fd2f-49c5-8323-35df4184a12d', N'2', N'5a1e40f4-a2a3-4078-a257-21863e042b12', N'ok test', CAST(N'2022-03-11T07:58:25.000' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [PostID], [UserID], [CommentDetail], [CommentTime], [CommentStatusID]) VALUES (N'ff3e7999-97b5-4f09-be2f-bd11a25d9992', N'2', N'5a1e40f4-a2a3-4078-a257-21863e042b12', N'good job 2', CAST(N'2022-03-10T12:29:35.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[CommentStatus] ON 

INSERT [dbo].[CommentStatus] ([CommentStatusID], [CommentStatusName]) VALUES (1, N'Đang Chờ Xét Duyệt')
INSERT [dbo].[CommentStatus] ([CommentStatusID], [CommentStatusName]) VALUES (2, N'Đã Xét Duyệt')
INSERT [dbo].[CommentStatus] ([CommentStatusID], [CommentStatusName]) VALUES (3, N'Đã Bị Xóa')
SET IDENTITY_INSERT [dbo].[CommentStatus] OFF
GO
INSERT [dbo].[Content] ([ContentKey], [ContentValue]) VALUES (N'contextIndex', N'[]')
INSERT [dbo].[Content] ([ContentKey], [ContentValue]) VALUES (N'slide', N'[{"id":"32ad4acf-ea08-42a5-a4a8-334139af7dc9","title":"asfasf12124","image":"https://i.imgur.com/5EnUwuE.jpg","url":"asfas12412"},{"id":"eff12acb-012b-43de-ae74-e8597c74580a","title":"fasfas","image":"https://i.imgur.com/2VFX317.jpg","url":"fasfas"},{"id":"c62a39cd-81e0-4f6d-9e63-dd91380a633b","title":"test lan 3","image":"https://i.imgur.com/gppKS0o.jpg","url":"abfiaisfiasfas"}]')
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
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [IsMainPost], [ProjectID]) VALUES (N'1', N'Đồ Án Đỗ Xe Máy Tự Động', CAST(N'2022-03-09' AS Date), N'Võ Đức Minh', N'<h1 style=''text-align: justify;''>Đồ án tốt nghiệp / môn học là gì ?</h1>
<p style=''text-align: justify;''>Thông thường đồ án tốt nghiệp/môn học là một bài viết dài. Mục tiêu của nó là giúp người đọc có thể hiểu một cách khá chi tiết về một lĩnh vực hay triển khai được một ứng dụng/dịch vụ nào đó. Đồng thời, đồ án có thể chỉ ra được những ưu nhược điểm của hệ thống hay một vấn đề nào đó.</p>
<p style=''text-align: justify;''>Công dụng của một đồ án là gì: giúp người đọc, vốn chưa biết/chưa quen thuộc với lĩnh vực mà đồ án nghiên cứu, có thể hiểu được một cách khái quát về vấn đề.</p>
<p style=''text-align: justify;''>Ví dụ: Có hàng chục quyển sách, hàng trăm bài báo viết về mã độc, Domain, Firewall, IDS/IPS</p>
<p style=''text-align: justify;''>Hàng nghìn tài liệu viết về cách ứng dụng Firewall vào một hệ thống mạng cụ thể.</p>
<p style=''text-align: justify;''>Nói một cách bình dân, đồ án tốt nghiệp/môn học là một tài liệu khảo sát một lĩnh vực nào đó, mà chỉ cần người đọc, đọc qua đồ án là có thể nắm bắt được và biết được nguồn gốc tài liệu, để khi cần biết thêm chi tiết là có thể tự tìm đọc được.</p>
<p style=''text-align: justify;''>Vậy quá trình cần thiết để tạo ra một đồ án tốt nghiệp/môn học, các quy trình viết cũng như các kỹ thuật để viết là gì ? Chúng ta cùng làm rõ nhé!.</p>
<h1>Quá trình viết đồ án</h1>
<p style=''text-align: justify;''>Thông thường, quá trình viết có thể bao gồm 4 bước:</p>
<p style=''text-align: justify;''>            1) Đọc và ghi chú tài liệu</p>
<p style=''text-align: justify;''>            2) Sắp xếp dàn ý</p>
<p style=''text-align: justify;''>            3) Viết và trích dẫn</p>
<p style=''text-align: justify;''>            4) Quay lại bước (1)</p>
<h2 style=''text-align: justify;''>1. Đọc và ghi chú tài liệu</h2>
<p style=''text-align: justify;''>Bản chất của một đồ án là tìm hiểu, Nghiên cứu hay khảo sát một công nghệ, một vấn đề, cũng có thể là triển khai một dịch vụ nào đó nên việc đọc là phần đầu tiên rất quan trọng của đồ án.</p>
<p style=''text-align: justify;''>Nhưng đọc xong phải ghi lại những ý chính. Mục tiêu của việc ghi chú là để tóm tắt 1 vấn đề theo cách hiểu của mình. Một bảng ghi chú đạt yêu cầu là thông qua việc đọc bảng ghi chú đó, các bạn sẽ không cần đọc lại nguyên tác mà vẫn có thể tóm tắt được ý chính của bản gốc.</p>
<p style=''text-align: justify;''><strong>Loại tài liệu cần đọc:</strong></p>
<p style=''text-align: justify;''>&#8211; Bài báo khoa học đăng tạp chí</p>
<p style=''text-align: justify;''>&#8211; Bài báo khoa học đăng hội nghị</p>
<p style=''text-align: justify;''>&#8211; Sách giáo khoa, sách tham khảo</p>
<p style=''text-align: justify;''>&#8211; Tài liệu của hãng.</p>
<p style=''text-align: justify;''>Thông thường, các bài báo khoa học dù là tạp chí hay hội nghị chỉ nêu 1 đến 2 ý chính. Rất phù hợp để trích dẫn trong bài viết.</p>
<p style=''text-align: justify;''>Ví dụ: Weiser, 1991, đã khai sinh ra hướng ngành tính toán khắp mọi nơi [1].</p>
<p style=''text-align: justify;''>[1] Weiser, M., The computer for the 21st century, Scientific American, 1991, 265, 66-75</p>
<p style=''text-align: justify;''>Nhìn chung, sự khác biệt cơ bản nhất của bài báo hội nghị và bài báo tạp chí là: chất lượng và độ tin cậy của bài báo đăng tạp chí cao hơn so với bài báo đăng hội nghị. Tất nhiên là cũng phụ thuộc vào độ tin cậy của tạp chí và hội nghị nữa. Tất cả chỉ mang tính tương đối. Các bài báo hội nghị sau khi trình bày, nhận góp ý, các tác giả có thể viết lên thành bài báo và gửi tạp chí. Hơn nữa, những nhà phản biện của tạp chí thường là những ngườii có uy tín trong ngành nên độ tin cậy sẽ cao hơn.</p>
<p style=''text-align: justify;''>Sách giáo khoa, sách tham khảo là tập hợp nhiều bài báo, nhiều phần của một lĩnh vực và nội dung rất rộng cho nên sẽ mất rất nhiều thời gian để đọc và ghi chú. Hơn nữa, nó cũng là sản phẩm xuất phát từ các bài báo được viết lại theo dạng giáo khoa để dễ hiểu và tập trung.</p>
<p style=''text-align: justify;''>Tài liệu của hãng công nghệ là tài liệu tham khảo tốt nhất cần đọc khi chúng ta triển khai các ứng dụng công nghệ hay dịch vụ;</p>
<p style=''text-align: justify;''>Ví dụ khi bạn làm đề tài; “Triển khai HA cho Ms Exchange” thì tài liệu của microsoft là nguồn tham khảo tốt nhất</p>
<p style=''text-align: justify;''>Các tài liệu trên diễn đàn, website, link, báo lá cải, nhật báo, wikipedia, chỉ mang tính chất tham khảo <span style=''color: #0000ff;''>không nên</span> đưa vào mục tài liệu tham khảo.</p>
<h2 style=''text-align: justify;''>2. Sắp xếp dàn ý</h2>
<p style=''text-align: justify;''> Sau khi đã đọc được một ít, điều tiếp theo là lập dàn ý để viết.</p>
<p style=''text-align: justify;''>Một dàn ý tốt sẽ cho ra một bài viết tốt</p>
<p style=''text-align: justify;''>Các phần ghi chú ở <span style=''color: #0000ff;''>bước 1.</span> sẽ được đưa vào dàn ý này.</p>
<p style=''text-align: justify;''>Thông qua dàn ý, các bạn sẽ rõ hơn về đồ án của mình.</p>
<p style=''text-align: justify;''>==&gt; Các bạn nên nhờ Giáo viên hướng dẫn góp ý ngay từ lúc này.</p>
<h2 style=''text-align: justify;''>3. Viết và trích dẫn</h2>
<p style=''text-align: justify;''>Sau khi có dàn ý tốt, các bạn hãy bắt tay vào viết. Nói nôm na, dàn ý là phần khung xương, bây giờ là đến phần chúng ta đắp da thịt vào bộ xương đó để tạo nên một tác phẩm nghệ thuật.</p>
<p style=''text-align: justify;''>Nhưng khi viết, ta cần phải đưa những nội dung ta đã ghi chú trong phần đọc vào, và ghi trích dẫn rõ ràng. Để làm gì vậy ?</p>
<p style=''text-align: justify;''>Tại sao lại phải trích dẫn.</p>
<p style=''text-align: justify;''>Tôn trọng về bản quyền, tránh đạo văn</p>
<p style=''text-align: justify;''>Dùng những ý kiến đã được chứng thực để bổ sung, làm mạnh lên chính kiến của mình. Thuyết phục người khác tin mình. Chứng tỏ rằng, tôi đang làm cái việc mà cũng có những người khác làm, chứ không phải là tôi tự chế. Đứng trên vai người khổng lồ.</p>
<p style=''text-align: justify;''>Thực ra, trong cuộc sống, chúng ta dùng rất nhiều trích dẫn, đến mức hết sức tự nhiên mà ta không để ý. Đó là lý do tại sao người ta hay dùng ca dao, tục ngữ, những tri thức đã xác lập để bảo vệ chính kiến và thuyết phục người khác tin.</p>
<h2 style=''text-align: justify;''>4. Quay lại <span style=''color: #0000ff;''>bước 1</span></h2>
<p style=''text-align: justify;''>Trước khi quay lại bước 1, các bạn kiểm tra lại những gì đã viết, chỉnh sửa câu cú, chính tả.</p>
<h1 style=''text-align: justify;''>Cấu trúc một đồ án</h1>
<p style=''text-align: justify;''>Thực ra, không có một mẫu đồ án chuẩn, vì lĩnh vực nghiên cứu của mỗi đề tài sẽ rất khác nhau. Cấu trúc cũng sẽ rất linh họat.</p>
<p style=''text-align: justify;''>Để cụ thể hóa, chúng ta xét ví dụ dưới đây để xem cấu trúc có những phần cơ bản:</p>
<p style=''text-align: justify;''>Ví dụ: Đồ án: Tìm hiểu Công Nghệ GPS ứng dụng trong Location-Based Services.</p>
<p style=''text-align: justify;''>Việc đầu tiên cần làm là phân tích các keywords trong tên đồ án (tô màu khác nhau).</p>
<p style=''text-align: justify;''>Toàn bộ đồ án sẽ là những phần chi tiết của các keywords này.</p>
<p style=''text-align: justify;''>Chẳng hạn như trong đồ án này &#8221; Tìm hiểu Công Nghệ GPS ứng dụng trong Location-Based Services.&#8221; Người đọc sẽ cần biết GPS là gì, Location-Based Services là gì, và qua đó GPS hỗ trợ thế nào cho LBS. Các ứng dụng có thể có của LBS với sự trợ giúp của GPS.</p>
<p style=''text-align: justify;''>Qua đó, ta có thể cấu trúc 1 đồ án cơ bản như sau:</p>
<p style=''text-align: justify;''>Chương 1: Giới thiệu</p>
<p style=''text-align: justify;''>Chương 2: Khảo sát lý thuyết</p>
<p style=''text-align: justify;''>Chương &#8230;</p>
<p style=''text-align: justify;''>Chương n-2: Thực nghiệm</p>
<p style=''text-align: justify;''>Chương n-1: Thảo luận &amp; đánh giá</p>
<p style=''text-align: justify;''>Chương n: Kết luận</p>
<p style=''text-align: justify;''>Giám khảo, phản biện sẽ đọc Chương 1 và Chương kết luận đầu tiên. Đó cũng chính là lý do ta cần phải đầu tư thật nghiêm túc 2 chương này. Để nguời đọc có thể hiểu được ta muốn viết gì.</p>
<p style=''text-align: justify;''>Từ chương 3 trở đi, các bạn tự thiết kế nội dung xoay quanh các vấn đề để giải thích cho keywords đã phân tích và tập trung làm rõ đề tài.</p>
<p style=''text-align: justify;''>Chương n-2: Thực nghiệm: từ lý thuyết -&gt; triển khai áp dụng thực tế.</p>
<p style=''text-align: justify;''>Chương n-1: Thảo luận &amp; đánh giá: Quan trọng, đây là chương mà công sức của bạn sẽ được giáo viên chấm điểm ở đây !</p>
<p style=''text-align: justify;''>Vì sao: Khi đã đọc được rất nhiều sách vở, trình bày từ chương 1 đến chương n-2, chương n-1 là chương mà bạn nêu lên chính kiến của mình, hoặc đánh giá của mình (dựa trên các tài liệu thu thập được). Các bạn phát hiện được những ưu nhược nào của vấn đề, các lỗ hổng lớn nào cần phải được xử lý (không cần bạn phải xử lý, hoặc đưa ra giải pháp).</p>
<p style=''text-align: justify;''>Nên có những bản so sánh để đánh giá.</p>
<p style=''text-align: justify;''>Chương kết luận: Rất quan trọng: nó chốt lại những gì các bạn đã tìm hiểu, cho ra những kết luận quan trọng, và tóm gọn nội dung đã làm.</p>
<p style=''text-align: justify;''>Ví dụ:</p>
<p style=''text-align: justify;''>Đề tài đã tìm hiểu về GPS  và LBS ở những khía cạnh: 1,2,3,&#8230;..</p>
<p style=''text-align: justify;''>Chúng tôi nhận thấy rằng, GPS rất quan trọng và hữu ích cho LBS vì những lý do sau: i)&#8230;. ii)&#8230;, iii)&#8230;., iv) &#8230;..</p>
<p style=''text-align: justify;''>Tuy nhiên, LBS đòi hỏi những yếu tố 1)&#8230;., 2)&#8230;., 3)&#8230;.. mà GPS có những hạn chế. Qua đó ta thấy để đáp ứng được những nhu cầu nâng cao của LBS, cần phải có những cải tiến x,y,z&#8230;</p>
<p style=''text-align: justify;''>Tóm lại, kỹ thuật GPS là một thành phần không thể thiếu cho LBS&#8230;.</p>
<p style=''text-align: justify;''><strong>Kỷ luật viết &amp; Nguyên tắc 2 giờ vàng</strong></p>
<p style=''text-align: justify;''>Mặc dù việc viết bài ngày nay đã đựơc hỗ trợ rất nhiều từ máy tính, <a href=''http://sinhvientot.net/category/van-phong/word/'' target=''_blank'' rel=''noopener noreferrer''>phần mềm soạn thảo văn bản</a>, máy in&#8230; Tuy nhiên, nếu bạn không bắt tay vào viết thì Đồ Án sẽ không bao giờ được hoàn thành.</p>
<p style=''text-align: justify;''>Việc viết đồ án đòi hỏi sự kiên trì, nhất quán và kỷ luật. Con người rất dễ bị chi phối bởi ngoại cảnh, nên việc ngồi tập trung 2h để viết là 1 việc vô cùng gian khổ!</p>
<p style=''text-align: justify;''><span style=''color: #0000ff;''>Ví dụ:</span></p>
<p style=''text-align: justify;''>Khi đang ngồi trong phòng viết bài, tự dưng có bạn rủ chơi game, chat, hay đi cafe (Thường rất khó từ chối :)) ==&gt; Quên mất việc chính là viết bài, khi quay lại viết thì hết cảm hứng, lại phải tốn thời gian tập trung.</p>
<p style=''text-align: justify;''><strong>Nguyên tắc 2 giờ vàng:</strong> Một người làm việc trí óc có thể tập trung và làm việc hiệu quả nhất trong từng khoảng thời gian là 2 tiếng. Cho nên khi bắt tay vào viết, bạn phải chuẩn bị cho mình 2h rảnh, không được đi đâu hết. Không được phân tán, đi đây đó, nghe điện thoại, chat chit, lướt web, hoặc vào facebook !!!</p>
<p style=''text-align: justify;''>Một khi có một &#8220;tạp niệm&#8221; khởi lên, bạn đừng làm ngay theo sự dẫn dắt của nó, mà chỉ cần hỏi 1 câu: việc chính của mình lúc này đang làm gì ? Đang viết bài à, thì hãy bỏ qua tạp niệm đó, đừng để nó dẫn dắt, quay lại viết bài đi !</p>
<p style=''text-align: justify;''>Đây là một việc khó, cần phải rèn luyện.</p>
<h1>Vai trò của giáo viên hướng dẫn (GVHD)</h1>
<h2 style=''text-align: justify;''>Các sai lầm thường thấy của sinh viên khi bỏ qua vai trò của GVHD</h2>
<p style=''text-align: justify;''>Một trong những <span style=''color: #0000ff;''>sai lầm lớn nhất</span> của các sinh viên là không tham khảo ý kiến của giáo viên hướng dẫn. Tự mình làm đến sát ngày hết hạn nộp đồ án mới chạy đến nhờ giáo viên hướng dẫn xem, góp ý, thậm chí còn tự ý in đem đi nộp (Khả năng Fail là rất cao 🙂 lúc này chẳng có ai có thể giúp bạn được) !</p>
<p style=''text-align: justify;''>==&gt; Giáo viên hướng dẫn lúc đó cũng bó tay luôn, không tài nào sửa chữa, góp ý kịp một công trình mà các bạn đã làm trong vòng hai đến sáu tháng !</p>
<p style=''text-align: justify;''>Sai lầm thứ 2, do đồ án là tìm hiểu, nghiên cứu công nghệ, triển khai ứng dụng mà việc đọc tài liệu và làm lab là chính sẽ dẫn đến tình trạng là không biết đọc bao nhiêu sách, lab thì đủ, bỏ cái nào, viết cái nào, hay là viết hết. Đồ án sẽ trở thành 1 bách khoa toàn thư và toàn là copy paste</p>
<h2 style=''text-align: justify;''>Vai trò của GVHD</h2>
<p style=''text-align: justify;''>GVHD là người có kinh nghiệm trong giảng dạy, nghiên cứu, và đã trải qua hết các giai đoạn mà các bạn đã và đang trải qua. Cho nên phải thường xuyên gặp gỡ, trao đổi (trực tiếp hay qua email) với GVHD để có được góp ý kịp thời.</p>
<p style=''text-align: justify;''>GVHD không phải là người nghe, nói, đọc, viết thay cho các bạn, nhưng sẽ là người định hướng để các bạn có thể tự mình tìm ra con đường của mình thông qua việc cung cấp tài liệu, chỉ sách cho đọc, và qua các buổi gặp mặt, thảo luận trực tiếp.</p>
<p style=''text-align: justify;''>GVHD là người biết tầm vóc của vấn đề các bạn đang nghiên cứu và nắm rõ chuẩn đầu ra của trường. Cho nên việc trao đổi thường xuyên sẽ giúp các bạn hoàn thiện đồ án không ở mức quá sơ sài, cũng như không phải là xây dựng bách khoa toàn thư.</p>
<h2 style=''text-align: justify;''>Kết luận</h2>
<p style=''text-align: justify;''>Tóm lại, viết đồ án là việc gian nan nhưng không kém phần thú vị, vì khi viết được, có nghĩa là bạn đã hiểu được. có thể nó sẽ là sản phẩm chúng ta sẽ sử dụng để bổ sung vào CV xin việc.</p>
<p style=''text-align: justify;''>Bài viết này có tham khảo một số tư liệu của <strong>TS. Nguyễn Anh Tuấn</strong> – Trưởng Khoa Truyền thông và Mạng máy tính. Trường ĐHCNTT</p>
<h1><strong>Mẫu hướng dẫn viết đồ án tốt nghiệp</strong></h1>
<p>Một số mẫu và hướng dẫn cách viết đồ án bạn có thể tham khảo:</p>
<ol>
<li>Mẫu báo cáo Đồ án tốt nghiệp trường đại học công nghiệp thực phẩm: <a href=''http://sinhvientot.net/wp-content/uploads/2016/06/Mau-4_trinh-bay-do-an-tot-nghiep.doc''>Mau 4_trinh bay do an tot nghiep</a></li>
<li>Mẫu báo cáo Khóa luận tốt nghiệp trường đại học công nghiệp thực phẩm: <a href=''http://sinhvientot.net/wp-content/uploads/2016/06/Mau-3_trinh-bay-khoa-luan.doc''>Mau 3_trinh bay khoa luan</a></li>
<li>Mẫu báo cáo Luận văn tốt nghiệp trường đại học công nghiệp thực phẩm: <a href=''http://sinhvientot.net/wp-content/uploads/2016/06/Mau-3_trinh-bay-luan-van.doc''>Mau 3_trinh bay luan van</a></li>
<li>Hướng dẫn viết đồ án/khóa luận trường đại học Sư phạm kỹ thuật</li>
<li><a class=''seoquake-nofollow'' href=''http://ouo.io/QPfsI'' target=''_blank'' rel=''nofollow noopener noreferrer''>Hướng dẫn viết đồ án/khóa luận trườ</a>ng đại học Hutech</li>
</ol>
<p>Đồ án tham khảo:</p>
<p><a href=''http://sinhvientot.net/xay-dung-va-trien-khai-he-thong-voip-cho-doanh-nghiep-vua-va-nho/'' target=''_blank'' rel=''noopener noreferrer''>Xây dựng và triển khai hệ thống VoIP cho doanh nghiệp vừa và nhỏ</a></p>
<p><strong>XÂY DỰNG HỆ THỐNG MAIL </strong><strong>CHO DOANH NGHIỆP ĐẠI NAM</strong></p>
<p><iframe width=''100%'' height=''480'' src=''https://drive.google.com/file/d/13hPXeT75mS7QZVrjrwQz7VkdBzSwiTor/preview''></iframe></p>
<p><strong>Xem thêm các bài viết:</strong></p>
<p><a href=''http://sinhvientot.net/tao-ngat-trang-danh-so-trang-tieu-de-trang-trong-word/'' target=''_blank'' rel=''noopener noreferrer''>Tạo ngắt trang, đánh số trang, tiêu đề trang trong Word</a></p>
<p><a href=''http://sinhvientot.net/huong-dan-tao-muc-luc-tu-dong-trong-word/'' target=''_blank'' rel=''noopener noreferrer''>Hướng dẫn tạo mục lục tự động trong Word</a></p>
<p>Chúc các bạn thành công! nếu có thắc mắc hoặc chưa rõ các bạn để lại thông tin bên dưới</p>
', N'https://i.imgur.com/4AKg45F.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 1, N'1', N'1')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [IsMainPost], [ProjectID]) VALUES (N'2', N'Đồ Án Tự Động Pass Môn', CAST(N'2022-03-10' AS Date), N'Võ Đức Minh', N'<p><strong>M&atilde; Ho&agrave;ng Nhật Phi ch&agrave;ng C&oacute;c V&agrave;ng ng&agrave;nh Kỹ thuật phần mềm kho&aacute; 11 vừa vinh dự nhận được danh hiệu C&oacute;c V&agrave;ng học kỳ Summer 2017 với kết quả 9.3. C&ugrave;ng tr&ograve; chuyện với Phi để lắng nghe qu&aacute; tr&igrave;nh chinh phục gi&aacute;o tr&igrave;nh &ldquo;d&agrave;y cộm&rdquo; của nh&oacute;m ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin nh&eacute;.</strong></p>

<p><strong>&nbsp;</strong></p>

<p><strong>Ch&agrave;o Phi, ch&uacute;c mừng bạn đ&atilde; nhận được danh hiệu danh gi&aacute; C&oacute;c V&agrave;ng trong học kỳ Summer 2017. Khi nhận được danh hiệu n&agrave;y bạn đ&atilde; nghĩ g&igrave;?</strong></p>

<p><strong>&nbsp;</strong></p>

<p>M&igrave;nh rất bất ngờ khi nghe bạn b&egrave; th&ocirc;ng b&aacute;o kết quả n&agrave;y. Trước giờ m&igrave;nh chưa từng nghĩ sẽ được trở th&agrave;nh C&oacute;c V&agrave;ng v&igrave; danh hiệu n&agrave;y chỉ d&agrave;nh cho bạn n&agrave;o xuất sắc nhất của học kỳ đ&oacute;, m&agrave; bản th&acirc;n m&igrave;nh th&igrave; học cũng t&agrave;m tạm th&ocirc;i<em>.</em></p>

<p><em>&nbsp;</em></p>

<p><strong>Học kỳ Summer l&agrave; học kỳ chuy&ecirc;n ng&agrave;nh thứ 3 của Phi, vậy c&ograve;n 2 học kỳ trước đ&oacute; kết quả &ldquo;học t&agrave;m tạm&rdquo; của bạn như thế n&agrave;o?</strong></p>

<p><strong>&nbsp;</strong></p>

<p>(Cười) M&igrave;nh cũng được sinh vi&ecirc;n giỏi. Thật ra kết quả học tập kh&ocirc;ng phải l&agrave; mục ti&ecirc;u của m&igrave;nh đ&acirc;u, m&igrave;nh chỉ cần đủ &ldquo;pass&rdquo; l&agrave; được rồi. Với m&igrave;nh, kiến thức m&igrave;nh học được sẽ quan trọng hơn điểm số.</p>

<p>&nbsp;</p>

<p><img alt="" src=''https://daihoc-fpt.cdn.vccloud.vn/media/2018/01/C1-910x511.png'' /></p>

<p><em>Nhật Phi (thứ 6 từ phải qua) chụp h&igrave;nh kỉ niệm với giảng vi&ecirc;n v&agrave; bạn b&egrave; trong một buổi học</em></p>

<p><em>&nbsp;</em></p>

<p><strong>Vậy danh hiệu n&agrave;y c&oacute; &yacute; nghĩa g&igrave; với Phi?</strong></p>

<p><strong>&nbsp;</strong></p>

<p>Đ&acirc;y thực sự l&agrave; một sự kh&iacute;ch lệ cho m&igrave;nh trong tương lai. Kết quả n&agrave;y c&oacute; được cũng l&agrave; nhờ sự quan t&acirc;m của c&aacute;c giảng vi&ecirc;n khi giảng dạy trong lớp cho tụi m&igrave;nh nữa.</p>

<p>&nbsp;</p>

<p><strong>X&aacute;c định mục ti&ecirc;u của bản th&acirc;n l&agrave; &ldquo;học thật, thi</strong><strong>thật&rdquo; chắc chắn bạn đ&atilde; phấn đấu rất nhiều. Vậy Phi đ&atilde; phải sắp xếp giữa thời gian học v&agrave; h&agrave;nh như thế n&agrave;o khi m&agrave; gi&aacute;o tr&igrave;nh của nh&oacute;m ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin kh&aacute; d&agrave;y v&agrave; c&ograve;n t&igrave;m hiểu th&ecirc;m những sản phẩm ứng dụng c&ocirc;ng nghệ mới?</strong></p>

<p><strong>&nbsp;</strong></p>

<p>Khi theo học nh&oacute;m ng&agrave;nh C&ocirc;ng nghệ Th&ocirc;ng tin, m&igrave;nh thực sự rất th&iacute;ch v&igrave; đ&oacute; l&agrave; đam m&ecirc; của m&igrave;nh. V&agrave; thực sự khi theo đuổi thứ m&igrave;nh th&iacute;ch, chắc chắn bạn sẽ c&oacute; rất nhiều động lực hơn.</p>

<p>&nbsp;</p>

<p>C&aacute;ch của m&igrave;nh l&agrave; mỗi khi đến lớp, m&igrave;nh sẽ ghi nhớ kiến thức cũ v&agrave; chuẩn bị b&agrave;i học mới để c&oacute; thể tiếp thu tốt nhất b&agrave;i giảng. B&ecirc;n cạnh đ&oacute;, m&igrave;nh d&agrave;nh thời gian &ocirc;n tập c&aacute;c kiến thức đ&atilde; học trong những m&ocirc;n học trước nhằm tr&aacute;nh qu&ecirc;n những kiến thức quan trọng cần thiết cho c&aacute;c m&ocirc;n học đang học v&agrave; sẽ học. Đối với m&igrave;nh, việc nhắc đi nhắc lại những g&igrave; đ&atilde; học sẽ gi&uacute;p hiểu v&agrave; nhớ r&otilde; hơn những kiến thức quan trọng.</p>

<p>&nbsp;</p>

<p><strong>Ở trường Đại học FPT c&oacute; rất nhiều CLB s&ocirc;i động, Phi c&oacute; đang tham gia v&agrave;o CLB n&agrave;o của trường kh&ocirc;ng?</strong></p>

<p><strong>&nbsp;</strong></p>

<p>Trước đ&acirc;y, Phi c&oacute; tham gia CLB học thuật F-Code. M&igrave;nh nhận thấy F-Code l&agrave; cầu nối giữa những th&agrave;nh vi&ecirc;n c&oacute; c&ugrave;ng đam m&ecirc;, ham th&iacute;ch học hỏi th&ecirc;m những kiến thức li&ecirc;n quan đến c&ocirc;ng nghệ.</p>

<p>&nbsp;</p>

<p>Với m&igrave;nh, tất cả c&aacute;c m&ocirc;n đều quan trọng v&agrave; c&oacute; độ kh&oacute; ri&ecirc;ng của từng m&ocirc;n. Việc tham gia c&aacute;c CLB sẽ gi&uacute;p c&acirc;n bằng thời gian học tập v&agrave; thư gi&atilde;n, gi&uacute;p đầu &oacute;c c&acirc;n bằng v&agrave; dễ tiếp thu c&aacute;i mới hơn cũng như ph&aacute;t triển khả năng s&aacute;ng tạo hơn.</p>

<p>&nbsp;</p>

<p><strong>Theo đuổi ng&agrave;nh học n&agrave;y, sau n&agrave;y em mong muốn sẽ l&agrave;m trong lĩnh vực n&agrave;o. Với em, định nghĩa về m&ocirc;i trường l&agrave;m việc l&yacute; tưởng trong tương lai l&agrave; g&igrave;?</strong></p>

<p><strong>&nbsp;</strong></p>

<p>M&igrave;nh vẫn c&ograve;n ph&acirc;n v&acirc;n, chưa x&aacute;c định lĩnh vực cụ thể m&agrave; m&igrave;nh theo đuổi trong ng&agrave;nh CNTT. M&igrave;nh nghĩ hiện tại m&igrave;nh cần học tập, x&acirc;y dựng tốt kiến thức nền để tạo nền tảng vững chắc hơn th&igrave; tương lai c&oacute; thể thuận lợi hơn khi theo đuổi bất k&igrave; lĩnh vực n&agrave;o.</p>

<p>&nbsp;</p>

<p>M&ocirc;i trường l&agrave;m việc l&yacute; tưởng trong tương lai với m&igrave;nh l&agrave; một m&ocirc;i trường thoải m&aacute;i về thời gian, kh&ocirc;ng gian, đồng nghiệp vui vẻ, h&ograve;a đồng, sẳn s&agrave;ng trao đổi kinh nghiệm, học tập lẫn nhau.</p>

<p>&nbsp;</p>

<p><strong>Cơ duy&ecirc;n n&agrave;o khiến bạn chọn Đại học FPT?</strong></p>

<p><strong>&nbsp;</strong></p>

<p>ĐH FPT l&agrave; sự lựa chọn duy nhất của m&igrave;nh khi c&ograve;n học THPT. Đến b&acirc;y giờ th&igrave; m&igrave;nh vẫn h&agrave;i l&ograve;ng về sự lựa chọn n&agrave;y v&igrave; m&igrave;nh to&agrave;n được học những gi&aacute;o tr&igrave;nh c&oacute; kiến thức mới được cập nhật s&aacute;t với thực tế, giảng vi&ecirc;n th&igrave; lu&ocirc;n quan t&acirc;m, gi&uacute;p đỡ, hỗ trợ tận t&igrave;nh sinh vi&ecirc;n, từng b&agrave;i học l&agrave; sự kết hợp giữa l&yacute; thuyết v&agrave; thực h&agrave;nh.</p>

<p>&nbsp;</p>

<table style="width:100%">
	<tbody>
		<tr>
			<td>C&oacute;c V&agrave;ng l&agrave; danh hiệu cao qu&yacute; ở ĐH FPT d&agrave;nh cho sinh vi&ecirc;n c&oacute; th&agrave;nh t&iacute;ch học tập cao nhất của 3 nh&oacute;m CNTT, Kinh tế v&agrave; c&aacute;c ng&agrave;nh c&ograve;n lại được x&eacute;t tr&ecirc;n to&agrave;n quốc. 2 C&oacute;c V&agrave;ng học kỳ Summer năm 2017 sẽ được t&ocirc;n vinh trong Lễ tổng kết học kỳ Fall 2017 tổ chức tại Hội trường Innovation, C&ocirc;ng vi&ecirc;n Phần mềm Quang Trung, TP.HCM v&agrave;o ng&agrave;y 19/01 tới đ&acirc;y.</td>
		</tr>
	</tbody>
</table>
', N'https://i.imgur.com/j50MXql.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 1, 1, N'2', N'2')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [IsMainPost], [ProjectID]) VALUES (N'3', N'Đồ Án Đỗ Xe Máy Tự Động 12312312', CAST(N'2022-03-21' AS Date), N'admin', N'<p>ok</p>
', N'https://i.imgur.com/t4CElhX.png', N'admin', 0, 1, N'3', N'3')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [IsMainPost], [ProjectID]) VALUES (N'4', N'Cách Làm Đồ Án Tốt Nghiệp', CAST(N'2022-03-11' AS Date), N'Võ Đức Minh', N'<h1 style="text-align: justify;">Đồ án tốt nghiệp / môn học là gì ?</h1>
<p style="text-align: justify;">Thông thường đồ án tốt nghiệp/môn học là một bài viết dài. Mục tiêu của nó là giúp người đọc có thể hiểu một cách khá chi tiết về một lĩnh vực hay triển khai được một ứng dụng/dịch vụ nào đó. Đồng thời, đồ án có thể chỉ ra được những ưu nhược điểm của hệ thống hay một vấn đề nào đó.</p>
<p style="text-align: justify;">Công dụng của một đồ án là gì: giúp người đọc, vốn chưa biết/chưa quen thuộc với lĩnh vực mà đồ án nghiên cứu, có thể hiểu được một cách khái quát về vấn đề.</p>
<p style="text-align: justify;">Ví dụ: Có hàng chục quyển sách, hàng trăm bài báo viết về mã độc, Domain, Firewall, IDS/IPS</p>
<p style="text-align: justify;">Hàng nghìn tài liệu viết về cách ứng dụng Firewall vào một hệ thống mạng cụ thể.</p>
<p style="text-align: justify;">Nói một cách bình dân, đồ án tốt nghiệp/môn học là một tài liệu khảo sát một lĩnh vực nào đó, mà chỉ cần người đọc, đọc qua đồ án là có thể nắm bắt được và biết được nguồn gốc tài liệu, để khi cần biết thêm chi tiết là có thể tự tìm đọc được.</p>
<p style="text-align: justify;">Vậy quá trình cần thiết để tạo ra một đồ án tốt nghiệp/môn học, các quy trình viết cũng như các kỹ thuật để viết là gì ? Chúng ta cùng làm rõ nhé!.</p>
<h1>Quá trình viết đồ án</h1>
<p style="text-align: justify;">Thông thường, quá trình viết có thể bao gồm 4 bước:</p>
<p style="text-align: justify;">            1) Đọc và ghi chú tài liệu</p>
<p style="text-align: justify;">            2) Sắp xếp dàn ý</p>
<p style="text-align: justify;">            3) Viết và trích dẫn</p>
<p style="text-align: justify;">            4) Quay lại bước (1)</p>
<h2 style="text-align: justify;">1. Đọc và ghi chú tài liệu</h2>
<p style="text-align: justify;">Bản chất của một đồ án là tìm hiểu, Nghiên cứu hay khảo sát một công nghệ, một vấn đề, cũng có thể là triển khai một dịch vụ nào đó nên việc đọc là phần đầu tiên rất quan trọng của đồ án.</p>
<p style="text-align: justify;">Nhưng đọc xong phải ghi lại những ý chính. Mục tiêu của việc ghi chú là để tóm tắt 1 vấn đề theo cách hiểu của mình. Một bảng ghi chú đạt yêu cầu là thông qua việc đọc bảng ghi chú đó, các bạn sẽ không cần đọc lại nguyên tác mà vẫn có thể tóm tắt được ý chính của bản gốc.</p>
<p style="text-align: justify;"><strong>Loại tài liệu cần đọc:</strong></p>
<p style="text-align: justify;">&#8211; Bài báo khoa học đăng tạp chí</p>
<p style="text-align: justify;">&#8211; Bài báo khoa học đăng hội nghị</p>
<p style="text-align: justify;">&#8211; Sách giáo khoa, sách tham khảo</p>
<p style="text-align: justify;">&#8211; Tài liệu của hãng.</p>
<p style="text-align: justify;">Thông thường, các bài báo khoa học dù là tạp chí hay hội nghị chỉ nêu 1 đến 2 ý chính. Rất phù hợp để trích dẫn trong bài viết.</p>
<p style="text-align: justify;">Ví dụ: Weiser, 1991, đã khai sinh ra hướng ngành tính toán khắp mọi nơi [1].</p>
<p style="text-align: justify;">[1] Weiser, M., The computer for the 21st century, Scientific American, 1991, 265, 66-75</p>
<p style="text-align: justify;">Nhìn chung, sự khác biệt cơ bản nhất của bài báo hội nghị và bài báo tạp chí là: chất lượng và độ tin cậy của bài báo đăng tạp chí cao hơn so với bài báo đăng hội nghị. Tất nhiên là cũng phụ thuộc vào độ tin cậy của tạp chí và hội nghị nữa. Tất cả chỉ mang tính tương đối. Các bài báo hội nghị sau khi trình bày, nhận góp ý, các tác giả có thể viết lên thành bài báo và gửi tạp chí. Hơn nữa, những nhà phản biện của tạp chí thường là những ngườii có uy tín trong ngành nên độ tin cậy sẽ cao hơn.</p>
<p style="text-align: justify;">Sách giáo khoa, sách tham khảo là tập hợp nhiều bài báo, nhiều phần của một lĩnh vực và nội dung rất rộng cho nên sẽ mất rất nhiều thời gian để đọc và ghi chú. Hơn nữa, nó cũng là sản phẩm xuất phát từ các bài báo được viết lại theo dạng giáo khoa để dễ hiểu và tập trung.</p>
<p style="text-align: justify;">Tài liệu của hãng công nghệ là tài liệu tham khảo tốt nhất cần đọc khi chúng ta triển khai các ứng dụng công nghệ hay dịch vụ;</p>
<p style="text-align: justify;">Ví dụ khi bạn làm đề tài; “Triển khai HA cho Ms Exchange” thì tài liệu của microsoft là nguồn tham khảo tốt nhất</p>
<p style="text-align: justify;">Các tài liệu trên diễn đàn, website, link, báo lá cải, nhật báo, wikipedia, chỉ mang tính chất tham khảo <span style="color: #0000ff;">không nên</span> đưa vào mục tài liệu tham khảo.</p>
<h2 style="text-align: justify;">2. Sắp xếp dàn ý</h2>
<p style="text-align: justify;"> Sau khi đã đọc được một ít, điều tiếp theo là lập dàn ý để viết.</p>
<p style="text-align: justify;">Một dàn ý tốt sẽ cho ra một bài viết tốt</p>
<p style="text-align: justify;">Các phần ghi chú ở <span style="color: #0000ff;">bước 1.</span> sẽ được đưa vào dàn ý này.</p>
<p style="text-align: justify;">Thông qua dàn ý, các bạn sẽ rõ hơn về đồ án của mình.</p>
<p style="text-align: justify;">==&gt; Các bạn nên nhờ Giáo viên hướng dẫn góp ý ngay từ lúc này.</p>
<h2 style="text-align: justify;">3. Viết và trích dẫn</h2>
<p style="text-align: justify;">Sau khi có dàn ý tốt, các bạn hãy bắt tay vào viết. Nói nôm na, dàn ý là phần khung xương, bây giờ là đến phần chúng ta đắp da thịt vào bộ xương đó để tạo nên một tác phẩm nghệ thuật.</p>
<p style="text-align: justify;">Nhưng khi viết, ta cần phải đưa những nội dung ta đã ghi chú trong phần đọc vào, và ghi trích dẫn rõ ràng. Để làm gì vậy ?</p>
<p style="text-align: justify;">Tại sao lại phải trích dẫn.</p>
<p style="text-align: justify;">Tôn trọng về bản quyền, tránh đạo văn</p>
<p style="text-align: justify;">Dùng những ý kiến đã được chứng thực để bổ sung, làm mạnh lên chính kiến của mình. Thuyết phục người khác tin mình. Chứng tỏ rằng, tôi đang làm cái việc mà cũng có những người khác làm, chứ không phải là tôi tự chế. Đứng trên vai người khổng lồ.</p>
<p style="text-align: justify;">Thực ra, trong cuộc sống, chúng ta dùng rất nhiều trích dẫn, đến mức hết sức tự nhiên mà ta không để ý. Đó là lý do tại sao người ta hay dùng ca dao, tục ngữ, những tri thức đã xác lập để bảo vệ chính kiến và thuyết phục người khác tin.</p>
<h2 style="text-align: justify;">4. Quay lại <span style="color: #0000ff;">bước 1</span></h2>
<p style="text-align: justify;">Trước khi quay lại bước 1, các bạn kiểm tra lại những gì đã viết, chỉnh sửa câu cú, chính tả.</p>
<h1 style="text-align: justify;">Cấu trúc một đồ án</h1>
<p style="text-align: justify;">Thực ra, không có một mẫu đồ án chuẩn, vì lĩnh vực nghiên cứu của mỗi đề tài sẽ rất khác nhau. Cấu trúc cũng sẽ rất linh họat.</p>
<p style="text-align: justify;">Để cụ thể hóa, chúng ta xét ví dụ dưới đây để xem cấu trúc có những phần cơ bản:</p>
<p style="text-align: justify;">Ví dụ: Đồ án: Tìm hiểu Công Nghệ GPS ứng dụng trong Location-Based Services.</p>
<p style="text-align: justify;">Việc đầu tiên cần làm là phân tích các keywords trong tên đồ án (tô màu khác nhau).</p>
<p style="text-align: justify;">Toàn bộ đồ án sẽ là những phần chi tiết của các keywords này.</p>
<p style="text-align: justify;">Chẳng hạn như trong đồ án này &#8221; Tìm hiểu Công Nghệ GPS ứng dụng trong Location-Based Services.&#8221; Người đọc sẽ cần biết GPS là gì, Location-Based Services là gì, và qua đó GPS hỗ trợ thế nào cho LBS. Các ứng dụng có thể có của LBS với sự trợ giúp của GPS.</p>
<p style="text-align: justify;">Qua đó, ta có thể cấu trúc 1 đồ án cơ bản như sau:</p>
<p style="text-align: justify;">Chương 1: Giới thiệu</p>
<p style="text-align: justify;">Chương 2: Khảo sát lý thuyết</p>
<p style="text-align: justify;">Chương &#8230;</p>
<p style="text-align: justify;">Chương n-2: Thực nghiệm</p>
<p style="text-align: justify;">Chương n-1: Thảo luận &amp; đánh giá</p>
<p style="text-align: justify;">Chương n: Kết luận</p>
<p style="text-align: justify;">Giám khảo, phản biện sẽ đọc Chương 1 và Chương kết luận đầu tiên. Đó cũng chính là lý do ta cần phải đầu tư thật nghiêm túc 2 chương này. Để nguời đọc có thể hiểu được ta muốn viết gì.</p>
<p style="text-align: justify;">Từ chương 3 trở đi, các bạn tự thiết kế nội dung xoay quanh các vấn đề để giải thích cho keywords đã phân tích và tập trung làm rõ đề tài.</p>
<p style="text-align: justify;">Chương n-2: Thực nghiệm: từ lý thuyết -&gt; triển khai áp dụng thực tế.</p>
<p style="text-align: justify;">Chương n-1: Thảo luận &amp; đánh giá: Quan trọng, đây là chương mà công sức của bạn sẽ được giáo viên chấm điểm ở đây !</p>
<p style="text-align: justify;">Vì sao: Khi đã đọc được rất nhiều sách vở, trình bày từ chương 1 đến chương n-2, chương n-1 là chương mà bạn nêu lên chính kiến của mình, hoặc đánh giá của mình (dựa trên các tài liệu thu thập được). Các bạn phát hiện được những ưu nhược nào của vấn đề, các lỗ hổng lớn nào cần phải được xử lý (không cần bạn phải xử lý, hoặc đưa ra giải pháp).</p>
<p style="text-align: justify;">Nên có những bản so sánh để đánh giá.</p>
<p style="text-align: justify;">Chương kết luận: Rất quan trọng: nó chốt lại những gì các bạn đã tìm hiểu, cho ra những kết luận quan trọng, và tóm gọn nội dung đã làm.</p>
<p style="text-align: justify;">Ví dụ:</p>
<p style="text-align: justify;">Đề tài đã tìm hiểu về GPS  và LBS ở những khía cạnh: 1,2,3,&#8230;..</p>
<p style="text-align: justify;">Chúng tôi nhận thấy rằng, GPS rất quan trọng và hữu ích cho LBS vì những lý do sau: i)&#8230;. ii)&#8230;, iii)&#8230;., iv) &#8230;..</p>
<p style="text-align: justify;">Tuy nhiên, LBS đòi hỏi những yếu tố 1)&#8230;., 2)&#8230;., 3)&#8230;.. mà GPS có những hạn chế. Qua đó ta thấy để đáp ứng được những nhu cầu nâng cao của LBS, cần phải có những cải tiến x,y,z&#8230;</p>
<p style="text-align: justify;">Tóm lại, kỹ thuật GPS là một thành phần không thể thiếu cho LBS&#8230;.</p>
<p style="text-align: justify;"><strong>Kỷ luật viết &amp; Nguyên tắc 2 giờ vàng</strong></p>
<p style="text-align: justify;">Mặc dù việc viết bài ngày nay đã đựơc hỗ trợ rất nhiều từ máy tính, <a href="http://sinhvientot.net/category/van-phong/word/" target="_blank" rel="noopener noreferrer">phần mềm soạn thảo văn bản</a>, máy in&#8230; Tuy nhiên, nếu bạn không bắt tay vào viết thì Đồ Án sẽ không bao giờ được hoàn thành.</p>
<p style="text-align: justify;">Việc viết đồ án đòi hỏi sự kiên trì, nhất quán và kỷ luật. Con người rất dễ bị chi phối bởi ngoại cảnh, nên việc ngồi tập trung 2h để viết là 1 việc vô cùng gian khổ!</p>
<p style="text-align: justify;"><span style="color: #0000ff;">Ví dụ:</span></p>
<p style="text-align: justify;">Khi đang ngồi trong phòng viết bài, tự dưng có bạn rủ chơi game, chat, hay đi cafe (Thường rất khó từ chối :)) ==&gt; Quên mất việc chính là viết bài, khi quay lại viết thì hết cảm hứng, lại phải tốn thời gian tập trung.</p>
<p style="text-align: justify;"><strong>Nguyên tắc 2 giờ vàng:</strong> Một người làm việc trí óc có thể tập trung và làm việc hiệu quả nhất trong từng khoảng thời gian là 2 tiếng. Cho nên khi bắt tay vào viết, bạn phải chuẩn bị cho mình 2h rảnh, không được đi đâu hết. Không được phân tán, đi đây đó, nghe điện thoại, chat chit, lướt web, hoặc vào facebook !!!</p>
<p style="text-align: justify;">Một khi có một &#8220;tạp niệm&#8221; khởi lên, bạn đừng làm ngay theo sự dẫn dắt của nó, mà chỉ cần hỏi 1 câu: việc chính của mình lúc này đang làm gì ? Đang viết bài à, thì hãy bỏ qua tạp niệm đó, đừng để nó dẫn dắt, quay lại viết bài đi !</p>
<p style="text-align: justify;">Đây là một việc khó, cần phải rèn luyện.</p>
<h1>Vai trò của giáo viên hướng dẫn (GVHD)</h1>
<h2 style="text-align: justify;">Các sai lầm thường thấy của sinh viên khi bỏ qua vai trò của GVHD</h2>
<p style="text-align: justify;">Một trong những <span style="color: #0000ff;">sai lầm lớn nhất</span> của các sinh viên là không tham khảo ý kiến của giáo viên hướng dẫn. Tự mình làm đến sát ngày hết hạn nộp đồ án mới chạy đến nhờ giáo viên hướng dẫn xem, góp ý, thậm chí còn tự ý in đem đi nộp (Khả năng Fail là rất cao 🙂 lúc này chẳng có ai có thể giúp bạn được) !</p>
<p style="text-align: justify;">==&gt; Giáo viên hướng dẫn lúc đó cũng bó tay luôn, không tài nào sửa chữa, góp ý kịp một công trình mà các bạn đã làm trong vòng hai đến sáu tháng !</p>
<p style="text-align: justify;">Sai lầm thứ 2, do đồ án là tìm hiểu, nghiên cứu công nghệ, triển khai ứng dụng mà việc đọc tài liệu và làm lab là chính sẽ dẫn đến tình trạng là không biết đọc bao nhiêu sách, lab thì đủ, bỏ cái nào, viết cái nào, hay là viết hết. Đồ án sẽ trở thành 1 bách khoa toàn thư và toàn là copy paste</p>
<h2 style="text-align: justify;">Vai trò của GVHD</h2>
<p style="text-align: justify;">GVHD là người có kinh nghiệm trong giảng dạy, nghiên cứu, và đã trải qua hết các giai đoạn mà các bạn đã và đang trải qua. Cho nên phải thường xuyên gặp gỡ, trao đổi (trực tiếp hay qua email) với GVHD để có được góp ý kịp thời.</p>
<p style="text-align: justify;">GVHD không phải là người nghe, nói, đọc, viết thay cho các bạn, nhưng sẽ là người định hướng để các bạn có thể tự mình tìm ra con đường của mình thông qua việc cung cấp tài liệu, chỉ sách cho đọc, và qua các buổi gặp mặt, thảo luận trực tiếp.</p>
<p style="text-align: justify;">GVHD là người biết tầm vóc của vấn đề các bạn đang nghiên cứu và nắm rõ chuẩn đầu ra của trường. Cho nên việc trao đổi thường xuyên sẽ giúp các bạn hoàn thiện đồ án không ở mức quá sơ sài, cũng như không phải là xây dựng bách khoa toàn thư.</p>
<h2 style="text-align: justify;">Kết luận</h2>
<p style="text-align: justify;">Tóm lại, viết đồ án là việc gian nan nhưng không kém phần thú vị, vì khi viết được, có nghĩa là bạn đã hiểu được. có thể nó sẽ là sản phẩm chúng ta sẽ sử dụng để bổ sung vào CV xin việc.</p>
<p style="text-align: justify;">Bài viết này có tham khảo một số tư liệu của <strong>TS. Nguyễn Anh Tuấn</strong> – Trưởng Khoa Truyền thông và Mạng máy tính. Trường ĐHCNTT</p>
<h1><strong>Mẫu hướng dẫn viết đồ án tốt nghiệp</strong></h1>
<p>Một số mẫu và hướng dẫn cách viết đồ án bạn có thể tham khảo:</p>
<ol>
<li>Mẫu báo cáo Đồ án tốt nghiệp trường đại học công nghiệp thực phẩm: <a href="http://sinhvientot.net/wp-content/uploads/2016/06/Mau-4_trinh-bay-do-an-tot-nghiep.doc">Mau 4_trinh bay do an tot nghiep</a></li>
<li>Mẫu báo cáo Khóa luận tốt nghiệp trường đại học công nghiệp thực phẩm: <a href="http://sinhvientot.net/wp-content/uploads/2016/06/Mau-3_trinh-bay-khoa-luan.doc">Mau 3_trinh bay khoa luan</a></li>
<li>Mẫu báo cáo Luận văn tốt nghiệp trường đại học công nghiệp thực phẩm: <a href="http://sinhvientot.net/wp-content/uploads/2016/06/Mau-3_trinh-bay-luan-van.doc">Mau 3_trinh bay luan van</a></li>
<li>Hướng dẫn viết đồ án/khóa luận trường đại học Sư phạm kỹ thuật</li>
<li><a class="seoquake-nofollow" href="http://ouo.io/QPfsI" target="_blank" rel="nofollow noopener noreferrer">Hướng dẫn viết đồ án/khóa luận trườ</a>ng đại học Hutech</li>
</ol>
<p>Đồ án tham khảo:</p>
<p><a href="http://sinhvientot.net/xay-dung-va-trien-khai-he-thong-voip-cho-doanh-nghiep-vua-va-nho/" target="_blank" rel="noopener noreferrer">Xây dựng và triển khai hệ thống VoIP cho doanh nghiệp vừa và nhỏ</a></p>
<p><strong>XÂY DỰNG HỆ THỐNG MAIL </strong><strong>CHO DOANH NGHIỆP ĐẠI NAM</strong></p>
<p><iframe width="100%" height="480" src="https://drive.google.com/file/d/13hPXeT75mS7QZVrjrwQz7VkdBzSwiTor/preview"></iframe></p>
<p><strong>Xem thêm các bài viết:</strong></p>
<p><a href="http://sinhvientot.net/tao-ngat-trang-danh-so-trang-tieu-de-trang-trong-word/" target="_blank" rel="noopener noreferrer">Tạo ngắt trang, đánh số trang, tiêu đề trang trong Word</a></p>
<p><a href="http://sinhvientot.net/huong-dan-tao-muc-luc-tu-dong-trong-word/" target="_blank" rel="noopener noreferrer">Hướng dẫn tạo mục lục tự động trong Word</a></p>
<p>Chúc các bạn thành công! nếu có thắc mắc hoặc chưa rõ các bạn để lại thông tin bên dưới</p>
', N'https://xaynhangaviet.com/wp-content/uploads/2021/05/do-an-tot-nghiep.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 1, NULL, NULL)
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [IsMainPost], [ProjectID]) VALUES (N'71e6a646-baf4-490e-9661-97360450f989', N'Test đăng po post', CAST(N'2022-03-14' AS Date), N'Trần Quang Quyền', N'<p>okokokokok</p>
', N'https://i.imgur.com/6KO8LlD.jpg', N'SE150111', 0, 1, N'1', N'1')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [IsMainPost], [ProjectID]) VALUES (N'89297957-2ada-447b-983d-75ae24be3376', N'Đồ Án Demo Môn SWP', CAST(N'2022-03-12' AS Date), N'admin', N'<h1>Đồ &aacute;n tốt nghiệp / m&ocirc;n học l&agrave; g&igrave; ?</h1>

<p>Th&ocirc;ng thường đồ &aacute;n tốt nghiệp/m&ocirc;n học l&agrave; một b&agrave;i viết d&agrave;i. Mục ti&ecirc;u của n&oacute; l&agrave; gi&uacute;p người đọc c&oacute; thể hiểu một c&aacute;ch kh&aacute; chi tiết về một lĩnh vực hay triển khai được một ứng dụng/dịch vụ n&agrave;o đ&oacute;. Đồng thời, đồ &aacute;n c&oacute; thể chỉ ra được những ưu nhược điểm của hệ thống hay một vấn đề n&agrave;o đ&oacute;.</p>

<p>C&ocirc;ng dụng của một đồ &aacute;n l&agrave; g&igrave;: gi&uacute;p người đọc, vốn chưa biết/chưa quen thuộc với lĩnh vực m&agrave; đồ &aacute;n nghi&ecirc;n cứu, c&oacute; thể hiểu được một c&aacute;ch kh&aacute;i qu&aacute;t về vấn đề.</p>

<p>V&iacute; dụ: C&oacute; h&agrave;ng chục quyển s&aacute;ch, h&agrave;ng trăm b&agrave;i b&aacute;o viết về mã đ&ocirc;̣c, Domain, Firewall, IDS/IPS</p>

<p>H&agrave;ng ngh&igrave;n t&agrave;i liệu viết về c&aacute;ch ứng dụng Firewall v&agrave;o một h&ecirc;̣ th&ocirc;́ng mạng cụ thể.</p>

<p>N&oacute;i một c&aacute;ch b&igrave;nh d&acirc;n,&nbsp;đồ &aacute;n tốt nghiệp/m&ocirc;n học l&agrave; một t&agrave;i liệu khảo s&aacute;t một lĩnh vực n&agrave;o đ&oacute;, m&agrave; chỉ cần người đọc, đọc qua đồ &aacute;n l&agrave; c&oacute; thể nắm bắt được v&agrave; biết được nguồn gốc t&agrave;i liệu, để khi cần biết th&ecirc;m chi tiết l&agrave; c&oacute; thể tự t&igrave;m đọc được.</p>

<p>Vậy qu&aacute; tr&igrave;nh cần thiết để tạo ra một đồ &aacute;n tốt nghiệp/m&ocirc;n học, c&aacute;c quy tr&igrave;nh viết cũng như c&aacute;c kỹ thuật để viết l&agrave; g&igrave; ? Ch&uacute;ng ta c&ugrave;ng l&agrave;m r&otilde; nh&eacute;!.</p>

<h1>Qu&aacute; tr&igrave;nh viết đồ &aacute;n</h1>

<p>Th&ocirc;ng thường, qu&aacute; tr&igrave;nh viết c&oacute; thể bao gồm 4 bước:</p>

<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 1) Đọc v&agrave; ghi ch&uacute; t&agrave;i liệu</p>

<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;2) Sắp xếp d&agrave;n &yacute;</p>

<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;3) Viết v&agrave; tr&iacute;ch dẫn</p>

<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;4) Quay lại bước (1)</p>

<h2>1. Đọc v&agrave; ghi ch&uacute; t&agrave;i liệu</h2>

<p>Bản chất của một đồ &aacute;n l&agrave; t&igrave;m hiểu, Nghi&ecirc;n cứu hay khảo s&aacute;t một c&ocirc;ng nghệ, một vấn đề, cũng c&oacute; thể l&agrave;&nbsp;triển khai một dịch vụ n&agrave;o đ&oacute; n&ecirc;n việc đọc l&agrave; phần đầu ti&ecirc;n rất quan trọng của đồ &aacute;n.</p>

<p>Nhưng đọc xong phải ghi lại những &yacute; ch&iacute;nh. Mục ti&ecirc;u của việc ghi ch&uacute; l&agrave; để t&oacute;m tắt 1 vấn đề theo c&aacute;ch hiểu của m&igrave;nh. Một bảng ghi ch&uacute; đạt y&ecirc;u cầu l&agrave; th&ocirc;ng qua việc đọc bảng ghi ch&uacute; đ&oacute;, c&aacute;c bạn sẽ kh&ocirc;ng cần đọc lại nguy&ecirc;n t&aacute;c m&agrave; vẫn c&oacute; thể t&oacute;m tắt được &yacute; ch&iacute;nh của bản gốc.</p>

<p><strong>Loại t&agrave;i liệu cần đọc:</strong></p>

<p>&ndash; B&agrave;i b&aacute;o khoa học đăng tạp ch&iacute;</p>

<p>&ndash; B&agrave;i b&aacute;o khoa học đăng hội nghị</p>

<p>&ndash; S&aacute;ch gi&aacute;o khoa, s&aacute;ch tham khảo</p>

<p>&ndash; T&agrave;i liệu của h&atilde;ng.</p>

<p>Th&ocirc;ng thường, c&aacute;c b&agrave;i b&aacute;o khoa học d&ugrave; l&agrave; tạp ch&iacute; hay hội nghị chỉ n&ecirc;u 1 đến 2 &yacute; ch&iacute;nh. Rất ph&ugrave; hợp để tr&iacute;ch dẫn trong b&agrave;i viết.</p>

<p>V&iacute; dụ: Weiser, 1991, đ&atilde; khai sinh ra hướng ng&agrave;nh t&iacute;nh to&aacute;n khắp mọi nơi [1].</p>

<p>[1]&nbsp;Weiser, M.,&nbsp;The computer for the 21st century,&nbsp;Scientific American,&nbsp;1991, 265, 66-75</p>

<p>Nh&igrave;n chung, sự kh&aacute;c biệt cơ bản nhất của b&agrave;i b&aacute;o hội nghị v&agrave; b&agrave;i b&aacute;o tạp ch&iacute; l&agrave;: chất lượng v&agrave; độ tin cậy của b&agrave;i b&aacute;o đăng tạp ch&iacute; cao hơn so với b&agrave;i b&aacute;o đăng hội nghị. Tất nhi&ecirc;n l&agrave; cũng phụ thuộc v&agrave;o độ tin cậy của tạp ch&iacute; v&agrave; hội nghị nữa. Tất cả chỉ mang t&iacute;nh tương đối. C&aacute;c b&agrave;i b&aacute;o hội nghị sau khi tr&igrave;nh b&agrave;y, nhận g&oacute;p &yacute;, c&aacute;c t&aacute;c giả c&oacute; thể viết l&ecirc;n th&agrave;nh b&agrave;i b&aacute;o v&agrave; gửi tạp ch&iacute;. Hơn nữa, những nh&agrave; phản biện của tạp ch&iacute; thường l&agrave; những ngườii c&oacute; uy t&iacute;n trong ng&agrave;nh n&ecirc;n độ tin cậy sẽ cao hơn.</p>

<p>S&aacute;ch gi&aacute;o khoa, s&aacute;ch tham khảo l&agrave; tập hợp nhiều b&agrave;i b&aacute;o, nhiều phần của một lĩnh vực v&agrave; nội dung rất rộng cho n&ecirc;n sẽ mất rất nhiều thời gian để đọc v&agrave; ghi ch&uacute;. Hơn nữa, n&oacute; cũng l&agrave; sản phẩm xuất ph&aacute;t từ c&aacute;c b&agrave;i b&aacute;o được viết lại theo dạng gi&aacute;o khoa để dễ hiểu v&agrave; tập trung.</p>

<p>T&agrave;i liệu của h&atilde;ng c&ocirc;ng nghệ l&agrave; t&agrave;i liệu tham khảo tốt nhất cần đọc khi ch&uacute;ng ta triển khai c&aacute;c ứng dụng c&ocirc;ng nghệ hay&nbsp;dịch vụ;</p>

<p>V&iacute; dụ khi bạn l&agrave;m đề t&agrave;i; &ldquo;Triển khai HA cho Ms Exchange&rdquo; th&igrave; t&agrave;i liệu của microsoft l&agrave; nguồn tham khảo tốt nhất</p>

<p>C&aacute;c t&agrave;i liệu tr&ecirc;n diễn đ&agrave;n, website, link, b&aacute;o l&aacute; cải, nhật b&aacute;o, wikipedia, chỉ mang t&iacute;nh chất tham khảo&nbsp;kh&ocirc;ng n&ecirc;n&nbsp;đưa v&agrave;o mục t&agrave;i liệu tham khảo.</p>

<h2>2. Sắp xếp d&agrave;n &yacute;</h2>

<p>&nbsp;Sau khi đ&atilde; đọc được một &iacute;t, điều tiếp theo l&agrave; lập d&agrave;n &yacute; để viết.</p>

<p>Một d&agrave;n &yacute; tốt sẽ cho ra một b&agrave;i viết tốt</p>

<p>C&aacute;c phần ghi ch&uacute; ở&nbsp;bước 1.&nbsp;sẽ được đưa v&agrave;o d&agrave;n &yacute; n&agrave;y.</p>

<p>Th&ocirc;ng qua d&agrave;n &yacute;, c&aacute;c bạn sẽ r&otilde; hơn về đồ &aacute;n của m&igrave;nh.</p>

<p>==&gt; C&aacute;c bạn n&ecirc;n nhờ Gi&aacute;o vi&ecirc;n hướng dẫn g&oacute;p &yacute; ngay từ l&uacute;c n&agrave;y.</p>

<h2>3. Viết v&agrave; tr&iacute;ch dẫn</h2>

<p>Sau khi c&oacute; d&agrave;n &yacute; tốt, c&aacute;c bạn h&atilde;y bắt tay v&agrave;o viết. N&oacute;i n&ocirc;m na, d&agrave;n &yacute; l&agrave; phần khung xương, b&acirc;y giờ l&agrave; đến phần ch&uacute;ng ta đắp da thịt v&agrave;o bộ xương đ&oacute; để tạo n&ecirc;n một t&aacute;c phẩm nghệ thuật.</p>

<p>Nhưng khi viết, ta cần phải đưa những nội dung ta đ&atilde; ghi ch&uacute; trong phần đọc v&agrave;o, v&agrave; ghi tr&iacute;ch dẫn r&otilde; r&agrave;ng. Để l&agrave;m g&igrave; vậy ?</p>

<p>Tại sao lại phải tr&iacute;ch dẫn.</p>

<p>T&ocirc;n trọng về bản quyền, tr&aacute;nh đạo văn</p>

<p>D&ugrave;ng những &yacute; kiến đ&atilde; được chứng thực để bổ sung, l&agrave;m mạnh l&ecirc;n ch&iacute;nh kiến của m&igrave;nh. Thuyết phục người kh&aacute;c tin m&igrave;nh. Chứng tỏ rằng, t&ocirc;i đang l&agrave;m c&aacute;i việc m&agrave; cũng c&oacute; những người kh&aacute;c l&agrave;m, chứ kh&ocirc;ng phải l&agrave; t&ocirc;i tự chế.&nbsp;Đứng tr&ecirc;n vai người khổng lồ.</p>

<p>Thực ra, trong cuộc sống, ch&uacute;ng ta d&ugrave;ng rất nhiều tr&iacute;ch dẫn, đến mức hết sức tự nhi&ecirc;n m&agrave; ta kh&ocirc;ng để &yacute;. Đ&oacute; l&agrave; l&yacute; do tại sao người ta hay d&ugrave;ng ca dao, tục ngữ, những tri thức đ&atilde; x&aacute;c lập để bảo vệ ch&iacute;nh kiến v&agrave; thuyết phục người kh&aacute;c tin.</p>

<h2>4. Quay lại&nbsp;bước&nbsp;1</h2>

<p>Trước khi quay lại bước 1, c&aacute;c bạn kiểm tra lại những g&igrave; đ&atilde; viết, chỉnh sửa c&acirc;u c&uacute;, ch&iacute;nh tả.</p>

<h1>Cấu tr&uacute;c một đồ &aacute;n</h1>

<p>Thực ra, kh&ocirc;ng c&oacute; một mẫu đồ &aacute;n chuẩn, v&igrave; lĩnh vực nghi&ecirc;n cứu của mỗi đề t&agrave;i sẽ rất kh&aacute;c nhau. Cấu tr&uacute;c cũng sẽ rất linh họat.</p>

<p>Để cụ thể h&oacute;a, ch&uacute;ng ta x&eacute;t v&iacute; dụ dưới đ&acirc;y để xem cấu tr&uacute;c c&oacute; những phần cơ bản:</p>

<p>V&iacute; dụ: Đồ &aacute;n:&nbsp;T&igrave;m hiểu&nbsp;C&ocirc;ng Nghệ GPS&nbsp;ứng dụng&nbsp;trong&nbsp;Location-Based Services.</p>

<p>Việc đầu ti&ecirc;n cần l&agrave;m l&agrave; ph&acirc;n t&iacute;ch c&aacute;c keywords trong t&ecirc;n đồ &aacute;n (t&ocirc; m&agrave;u kh&aacute;c nhau).</p>

<p>To&agrave;n bộ đồ &aacute;n sẽ l&agrave; những phần chi tiết của c&aacute;c keywords n&agrave;y.</p>

<p>Chẳng hạn như trong đồ &aacute;n n&agrave;y &rdquo;&nbsp;T&igrave;m hiểu&nbsp;C&ocirc;ng Nghệ GPS&nbsp;ứng dụng&nbsp;trong&nbsp;Location-Based Services.&rdquo; Người đọc sẽ cần biết GPS l&agrave; g&igrave;, Location-Based Services l&agrave; g&igrave;, v&agrave; qua đ&oacute; GPS hỗ trợ thế n&agrave;o cho LBS. C&aacute;c ứng dụng c&oacute; thể c&oacute; của LBS với sự trợ gi&uacute;p của GPS.</p>

<p>Qua đ&oacute;, ta c&oacute; thể cấu tr&uacute;c 1 đồ &aacute;n cơ bản như sau:</p>

<p>Chương 1: Giới thiệu</p>

<p>Chương 2: Khảo s&aacute;t l&yacute; thuyết</p>

<p>Chương &hellip;</p>

<p>Chương n-2: Thực nghi&ecirc;̣m</p>

<p>Chương n-1: Thảo luận &amp;&nbsp;đ&aacute;nh gi&aacute;</p>

<p>Chương n: Kết luận</p>

<p>Gi&aacute;m khảo, phản biện sẽ đọc Chương 1 v&agrave; Chương kết luận đầu ti&ecirc;n. Đ&oacute; cũng ch&iacute;nh l&agrave; l&yacute; do ta cần phải đầu tư thật nghi&ecirc;m t&uacute;c 2 chương n&agrave;y. Để nguời đọc c&oacute; thể hiểu được ta muốn viết g&igrave;.</p>

<p>Từ chương 3 trở đi, c&aacute;c bạn tự thiết kế nội dung xoay quanh c&aacute;c vấn đề để giải th&iacute;ch cho keywords đ&atilde; ph&acirc;n t&iacute;ch v&agrave; tập trung l&agrave;m r&otilde; đề t&agrave;i.</p>

<p>Chương n-2: Thực nghi&ecirc;̣m: từ lý thuy&ecirc;́t -&gt; tri&ecirc;̉n khai áp dụng thực t&ecirc;́.</p>

<p>Chương n-1: Thảo luận &amp; đ&aacute;nh gi&aacute;: Quan trọng, đ&acirc;y l&agrave; chương m&agrave; c&ocirc;ng sức của bạn sẽ được gi&aacute;o vi&ecirc;n chấm điểm ở đ&acirc;y !</p>

<p>V&igrave; sao: Khi đ&atilde; đọc được rất nhiều s&aacute;ch vở, tr&igrave;nh b&agrave;y từ chương 1 đến chương n-2, chương n-1 l&agrave; chương m&agrave; bạn n&ecirc;u l&ecirc;n ch&iacute;nh kiến của m&igrave;nh, hoặc đ&aacute;nh gi&aacute; của m&igrave;nh (dựa tr&ecirc;n c&aacute;c t&agrave;i liệu thu thập được). C&aacute;c bạn ph&aacute;t hiện được những ưu nhược n&agrave;o của vấn đề, c&aacute;c lỗ hổng lớn n&agrave;o cần phải được xử l&yacute; (kh&ocirc;ng cần bạn phải xử l&yacute;, hoặc đưa ra giải ph&aacute;p).</p>

<p>N&ecirc;n c&oacute; những bản so s&aacute;nh để đ&aacute;nh gi&aacute;.</p>

<p>Chương kết luận: Rất quan trọng: n&oacute; chốt lại những g&igrave; c&aacute;c bạn đ&atilde; t&igrave;m hiểu, cho ra những kết luận quan trọng, v&agrave; t&oacute;m gọn nội dung đ&atilde; l&agrave;m.</p>

<p>V&iacute; dụ:</p>

<p>Đề t&agrave;i đ&atilde; t&igrave;m hiểu về GPS &nbsp;v&agrave; LBS ở những kh&iacute;a cạnh: 1,2,3,&hellip;..</p>

<p>Ch&uacute;ng t&ocirc;i nhận thấy rằng, GPS rất quan trọng v&agrave; hữu &iacute;ch cho LBS v&igrave; những l&yacute; do sau: i)&hellip;. ii)&hellip;, iii)&hellip;., iv) &hellip;..</p>

<p>Tuy nhi&ecirc;n, LBS đ&ograve;i hỏi những yếu tố 1)&hellip;., 2)&hellip;., 3)&hellip;.. m&agrave; GPS c&oacute; những hạn chế. Qua đ&oacute; ta thấy để đ&aacute;p ứng được những nhu cầu n&acirc;ng cao của LBS, cần phải c&oacute; những cải tiến x,y,z&hellip;</p>

<p>T&oacute;m lại, kỹ thuật GPS l&agrave; một th&agrave;nh phần kh&ocirc;ng thể thiếu cho LBS&hellip;.</p>

<p><strong>Kỷ luật viết &amp; Nguy&ecirc;n tắc 2 giờ v&agrave;ng</strong></p>

<p>Mặc d&ugrave; việc viết b&agrave;i ng&agrave;y nay đ&atilde; đựơc hỗ trợ rất nhiều từ m&aacute;y t&iacute;nh,&nbsp;<a href=''http://sinhvientot.net/category/van-phong/word/'' rel=''noopener noreferrer'' target=''_blank''>phần mềm soạn thảo văn bản</a>, m&aacute;y in&hellip; Tuy nhi&ecirc;n, nếu bạn kh&ocirc;ng bắt tay v&agrave;o viết th&igrave; Đồ &Aacute;n sẽ kh&ocirc;ng bao giờ được ho&agrave;n th&agrave;nh.</p>

<p>Việc viết đồ &aacute;n đ&ograve;i hỏi sự ki&ecirc;n tr&igrave;, nhất qu&aacute;n v&agrave; kỷ luật. Con người rất dễ bị chi phối bởi ngoại cảnh, n&ecirc;n việc ngồi tập trung 2h để viết l&agrave; 1 việc v&ocirc; c&ugrave;ng gian khổ!</p>

<p>V&iacute; dụ:</p>

<p>Khi đang ngồi trong ph&ograve;ng&nbsp;viết b&agrave;i, tự dưng c&oacute; bạn rủ chơi game, chat, hay đi cafe (Thường rất kh&oacute; từ chối :))&nbsp;==&gt; Qu&ecirc;n mất việc ch&iacute;nh l&agrave; viết b&agrave;i, khi quay lại viết th&igrave; hết cảm hứng, lại phải tốn thời gian tập trung.</p>

<p><strong>Nguy&ecirc;n tắc 2 giờ v&agrave;ng:</strong>&nbsp;Một người l&agrave;m việc tr&iacute; &oacute;c c&oacute; thể tập trung v&agrave; l&agrave;m việc hiệu quả nhất trong từng khoảng thời gian l&agrave; 2 tiếng. Cho n&ecirc;n khi bắt tay v&agrave;o viết, bạn phải chuẩn bị cho m&igrave;nh 2h rảnh, kh&ocirc;ng được đi đ&acirc;u hết. Kh&ocirc;ng được ph&acirc;n t&aacute;n, đi đ&acirc;y đ&oacute;, nghe điện thoại, chat chit, lướt web, hoặc v&agrave;o facebook !!!</p>

<p>Một khi c&oacute; một &ldquo;tạp niệm&rdquo; khởi l&ecirc;n, bạn đừng l&agrave;m ngay theo sự dẫn dắt của n&oacute;, m&agrave; chỉ cần hỏi 1 c&acirc;u: việc ch&iacute;nh của m&igrave;nh l&uacute;c n&agrave;y đang l&agrave;m g&igrave; ? Đang viết b&agrave;i &agrave;, th&igrave; h&atilde;y bỏ qua tạp niệm đ&oacute;, đừng để n&oacute; dẫn dắt, quay lại viết b&agrave;i đi !</p>

<p>Đ&acirc;y l&agrave; một việc kh&oacute;, cần phải r&egrave;n luyện.</p>

<h1>Vai tr&ograve; của gi&aacute;o vi&ecirc;n hướng dẫn (GVHD)</h1>

<h2>C&aacute;c sai lầm thường thấy của sinh vi&ecirc;n khi bỏ qua vai tr&ograve; của GVHD</h2>

<p>Một trong những&nbsp;sai lầm lớn nhất&nbsp;của c&aacute;c sinh vi&ecirc;n l&agrave; kh&ocirc;ng tham khảo &yacute; kiến của gi&aacute;o vi&ecirc;n hướng dẫn. Tự m&igrave;nh l&agrave;m đến s&aacute;t ng&agrave;y hết hạn nộp đồ &aacute;n mới chạy đến nhờ gi&aacute;o vi&ecirc;n hướng dẫn xem, g&oacute;p &yacute;, thậm ch&iacute; c&ograve;n tự &yacute; in đem đi nộp (Khả năng Fail l&agrave; rất cao 🙂 l&uacute;c n&agrave;y chẳng c&oacute; ai c&oacute; thể gi&uacute;p bạn được) !</p>

<p>==&gt; Gi&aacute;o vi&ecirc;n hướng dẫn l&uacute;c đ&oacute; cũng b&oacute; tay lu&ocirc;n, kh&ocirc;ng t&agrave;i n&agrave;o sửa chữa, g&oacute;p &yacute; kịp một c&ocirc;ng tr&igrave;nh m&agrave; c&aacute;c bạn đ&atilde; l&agrave;m trong v&ograve;ng hai&nbsp;đến s&aacute;u th&aacute;ng !</p>

<p>Sai lầm thứ 2, do đồ &aacute;n l&agrave; t&igrave;m hiểu, nghi&ecirc;n cứu c&ocirc;ng nghệ, triển khai ứng dụng m&agrave; việc đọc t&agrave;i liệu v&agrave; l&agrave;m lab l&agrave; ch&iacute;nh sẽ dẫn đến t&igrave;nh trạng l&agrave; kh&ocirc;ng biết đọc bao nhi&ecirc;u s&aacute;ch, lab th&igrave; đủ, bỏ c&aacute;i n&agrave;o, viết c&aacute;i n&agrave;o, hay l&agrave; viết hết.&nbsp;Đồ &aacute;n sẽ trở th&agrave;nh 1 b&aacute;ch khoa to&agrave;n thư v&agrave; to&agrave;n l&agrave; copy paste</p>

<h2>Vai tr&ograve; của GVHD</h2>

<p>GVHD l&agrave; người c&oacute; kinh nghiệm trong giảng dạy, nghi&ecirc;n cứu, v&agrave; đ&atilde; trải qua hết c&aacute;c giai đoạn m&agrave; c&aacute;c bạn đ&atilde; v&agrave; đang trải qua. Cho n&ecirc;n phải thường xuy&ecirc;n gặp gỡ, trao đổi (trực tiếp hay qua email) với GVHD để c&oacute; được g&oacute;p &yacute; kịp thời.</p>

<p>GVHD kh&ocirc;ng phải l&agrave; người nghe, n&oacute;i, đọc, viết thay cho c&aacute;c bạn, nhưng sẽ l&agrave; người định hướng để c&aacute;c bạn c&oacute; thể tự m&igrave;nh t&igrave;m ra con đường của m&igrave;nh th&ocirc;ng qua việc cung cấp t&agrave;i liệu, chỉ s&aacute;ch cho đọc, v&agrave; qua c&aacute;c buổi gặp mặt, thảo luận trực tiếp.</p>

<p>GVHD l&agrave; người biết tầm v&oacute;c của vấn đề c&aacute;c bạn đang nghi&ecirc;n cứu v&agrave; nắm r&otilde; chuẩn đầu ra của trường. Cho n&ecirc;n việc trao đổi thường xuy&ecirc;n sẽ gi&uacute;p c&aacute;c bạn ho&agrave;n thiện đồ &aacute;n kh&ocirc;ng ở mức qu&aacute; sơ s&agrave;i, cũng như kh&ocirc;ng phải l&agrave; x&acirc;y dựng b&aacute;ch khoa to&agrave;n thư.</p>

<h2>Kết luận</h2>

<p>T&oacute;m lại, viết đồ &aacute;n l&agrave; việc gian nan nhưng kh&ocirc;ng k&eacute;m phần th&uacute; vị, v&igrave; khi viết được, c&oacute; nghĩa l&agrave; bạn đ&atilde; hiểu được. c&oacute; thể n&oacute; sẽ l&agrave; sản phẩm ch&uacute;ng ta sẽ sử dụng để bổ sung v&agrave;o CV xin việc.</p>

<p>B&agrave;i viết n&agrave;y c&oacute; tham khảo một số tư liệu của&nbsp;<strong>TS. Nguyễn Anh Tuấn</strong>&nbsp;&ndash; Trưởng Khoa Truyền th&ocirc;ng v&agrave; Mạng m&aacute;y t&iacute;nh. Trường ĐHCNTT</p>
', N'https://i.imgur.com/wOwT7In.jpg', N'admin', 0, 1, NULL, N'89297957-2ada-447b-983d-75ae24be3376')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [IsMainPost], [ProjectID]) VALUES (N'9b711186-40a1-420c-a7b8-4a00a5194331', N'Đồ Án Xây Nhà Tự Động Post', CAST(N'2022-03-11' AS Date), N'Võ Đức Minh', N'<h1 style=''text-align: justify;''>Đồ án tốt nghiệp / môn học là gì ?</h1>
<p style=''text-align: justify;''>Thông thường đồ án tốt nghiệp/môn học là một bài viết dài. Mục tiêu của nó là giúp người đọc có thể hiểu một cách khá chi tiết về một lĩnh vực hay triển khai được một ứng dụng/dịch vụ nào đó. Đồng thời, đồ án có thể chỉ ra được những ưu nhược điểm của hệ thống hay một vấn đề nào đó.</p>
<p style=''text-align: justify;''>Công dụng của một đồ án là gì: giúp người đọc, vốn chưa biết/chưa quen thuộc với lĩnh vực mà đồ án nghiên cứu, có thể hiểu được một cách khái quát về vấn đề.</p>
<p style=''text-align: justify;''>Ví dụ: Có hàng chục quyển sách, hàng trăm bài báo viết về mã độc, Domain, Firewall, IDS/IPS</p>
<p style=''text-align: justify;''>Hàng nghìn tài liệu viết về cách ứng dụng Firewall vào một hệ thống mạng cụ thể.</p>
<p style=''text-align: justify;''>Nói một cách bình dân, đồ án tốt nghiệp/môn học là một tài liệu khảo sát một lĩnh vực nào đó, mà chỉ cần người đọc, đọc qua đồ án là có thể nắm bắt được và biết được nguồn gốc tài liệu, để khi cần biết thêm chi tiết là có thể tự tìm đọc được.</p>
<p style=''text-align: justify;''>Vậy quá trình cần thiết để tạo ra một đồ án tốt nghiệp/môn học, các quy trình viết cũng như các kỹ thuật để viết là gì ? Chúng ta cùng làm rõ nhé!.</p>
<h1>Quá trình viết đồ án</h1>
<p style=''text-align: justify;''>Thông thường, quá trình viết có thể bao gồm 4 bước:</p>
<p style=''text-align: justify;''>            1) Đọc và ghi chú tài liệu</p>
<p style=''text-align: justify;''>            2) Sắp xếp dàn ý</p>
<p style=''text-align: justify;''>            3) Viết và trích dẫn</p>
<p style=''text-align: justify;''>            4) Quay lại bước (1)</p>
<h2 style=''text-align: justify;''>1. Đọc và ghi chú tài liệu</h2>
<p style=''text-align: justify;''>Bản chất của một đồ án là tìm hiểu, Nghiên cứu hay khảo sát một công nghệ, một vấn đề, cũng có thể là triển khai một dịch vụ nào đó nên việc đọc là phần đầu tiên rất quan trọng của đồ án.</p>
<p style=''text-align: justify;''>Nhưng đọc xong phải ghi lại những ý chính. Mục tiêu của việc ghi chú là để tóm tắt 1 vấn đề theo cách hiểu của mình. Một bảng ghi chú đạt yêu cầu là thông qua việc đọc bảng ghi chú đó, các bạn sẽ không cần đọc lại nguyên tác mà vẫn có thể tóm tắt được ý chính của bản gốc.</p>
<p style=''text-align: justify;''><strong>Loại tài liệu cần đọc:</strong></p>
<p style=''text-align: justify;''>– Bài báo khoa học đăng tạp chí</p>
<p style=''text-align: justify;''>– Bài báo khoa học đăng hội nghị</p>
<p style=''text-align: justify;''>– Sách giáo khoa, sách tham khảo</p>
<p style=''text-align: justify;''>– Tài liệu của hãng.</p>
<p style=''text-align: justify;''>Thông thường, các bài báo khoa học dù là tạp chí hay hội nghị chỉ nêu 1 đến 2 ý chính. Rất phù hợp để trích dẫn trong bài viết.</p>
<p style=''text-align: justify;''>Ví dụ: Weiser, 1991, đã khai sinh ra hướng ngành tính toán khắp mọi nơi [1].</p>
<p style=''text-align: justify;''>[1] Weiser, M., The computer for the 21st century, Scientific American, 1991, 265, 66-75</p>
<p style=''text-align: justify;''>Nhìn chung, sự khác biệt cơ bản nhất của bài báo hội nghị và bài báo tạp chí là: chất lượng và độ tin cậy của bài báo đăng tạp chí cao hơn so với bài báo đăng hội nghị. Tất nhiên là cũng phụ thuộc vào độ tin cậy của tạp chí và hội nghị nữa. Tất cả chỉ mang tính tương đối. Các bài báo hội nghị sau khi trình bày, nhận góp ý, các tác giả có thể viết lên thành bài báo và gửi tạp chí. Hơn nữa, những nhà phản biện của tạp chí thường là những ngườii có uy tín trong ngành nên độ tin cậy sẽ cao hơn.</p>
<p style=''text-align: justify;''>Sách giáo khoa, sách tham khảo là tập hợp nhiều bài báo, nhiều phần của một lĩnh vực và nội dung rất rộng cho nên sẽ mất rất nhiều thời gian để đọc và ghi chú. Hơn nữa, nó cũng là sản phẩm xuất phát từ các bài báo được viết lại theo dạng giáo khoa để dễ hiểu và tập trung.</p>
<p style=''text-align: justify;''>Tài liệu của hãng công nghệ là tài liệu tham khảo tốt nhất cần đọc khi chúng ta triển khai các ứng dụng công nghệ hay dịch vụ;</p>
<p style=''text-align: justify;''>Ví dụ khi bạn làm đề tài; “Triển khai HA cho Ms Exchange” thì tài liệu của microsoft là nguồn tham khảo tốt nhất</p>
<p style=''text-align: justify;''>Các tài liệu trên diễn đàn, website, link, báo lá cải, nhật báo, wikipedia, chỉ mang tính chất tham khảo <span style=''color: #0000ff;''>không nên</span> đưa vào mục tài liệu tham khảo.</p>
<h2 style=''text-align: justify;''>2. Sắp xếp dàn ý</h2>
<p style=''text-align: justify;''> Sau khi đã đọc được một ít, điều tiếp theo là lập dàn ý để viết.</p>
<p style=''text-align: justify;''>Một dàn ý tốt sẽ cho ra một bài viết tốt</p>
<p style=''text-align: justify;''>Các phần ghi chú ở <span style=''color: #0000ff;''>bước 1.</span> sẽ được đưa vào dàn ý này.</p>
<p style=''text-align: justify;''>Thông qua dàn ý, các bạn sẽ rõ hơn về đồ án của mình.</p>
<p style=''text-align: justify;''>==> Các bạn nên nhờ Giáo viên hướng dẫn góp ý ngay từ lúc này.</p>
<h2 style=''text-align: justify;''>3. Viết và trích dẫn</h2>
<p style=''text-align: justify;''>Sau khi có dàn ý tốt, các bạn hãy bắt tay vào viết. Nói nôm na, dàn ý là phần khung xương, bây giờ là đến phần chúng ta đắp da thịt vào bộ xương đó để tạo nên một tác phẩm nghệ thuật.</p>
<p style=''text-align: justify;''>Nhưng khi viết, ta cần phải đưa những nội dung ta đã ghi chú trong phần đọc vào, và ghi trích dẫn rõ ràng. Để làm gì vậy ?</p>
<p style=''text-align: justify;''>Tại sao lại phải trích dẫn.</p>
<p style=''text-align: justify;''>Tôn trọng về bản quyền, tránh đạo văn</p>
<p style=''text-align: justify;''>Dùng những ý kiến đã được chứng thực để bổ sung, làm mạnh lên chính kiến của mình. Thuyết phục người khác tin mình. Chứng tỏ rằng, tôi đang làm cái việc mà cũng có những người khác làm, chứ không phải là tôi tự chế. Đứng trên vai người khổng lồ.</p>
<p style=''text-align: justify;''>Thực ra, trong cuộc sống, chúng ta dùng rất nhiều trích dẫn, đến mức hết sức tự nhiên mà ta không để ý. Đó là lý do tại sao người ta hay dùng ca dao, tục ngữ, những tri thức đã xác lập để bảo vệ chính kiến và thuyết phục người khác tin.</p>
<h2 style=''text-align: justify;''>4. Quay lại <span style=''color: #0000ff;''>bước 1</span></h2>
<p style=''text-align: justify;''>Trước khi quay lại bước 1, các bạn kiểm tra lại những gì đã viết, chỉnh sửa câu cú, chính tả.</p>
<h1 style=''text-align: justify;''>Cấu trúc một đồ án</h1>
<p style=''text-align: justify;''>Thực ra, không có một mẫu đồ án chuẩn, vì lĩnh vực nghiên cứu của mỗi đề tài sẽ rất khác nhau. Cấu trúc cũng sẽ rất linh họat.</p>
<p style=''text-align: justify;''>Để cụ thể hóa, chúng ta xét ví dụ dưới đây để xem cấu trúc có những phần cơ bản:</p>
<p style=''text-align: justify;''>Ví dụ: Đồ án: Tìm hiểu Công Nghệ GPS ứng dụng trong Location-Based Services.</p>
<p style=''text-align: justify;''>Việc đầu tiên cần làm là phân tích các keywords trong tên đồ án (tô màu khác nhau).</p>
<p style=''text-align: justify;''>Toàn bộ đồ án sẽ là những phần chi tiết của các keywords này.</p>
<p style=''text-align: justify;''>Chẳng hạn như trong đồ án này ” Tìm hiểu Công Nghệ GPS ứng dụng trong Location-Based Services.” Người đọc sẽ cần biết GPS là gì, Location-Based Services là gì, và qua đó GPS hỗ trợ thế nào cho LBS. Các ứng dụng có thể có của LBS với sự trợ giúp của GPS.</p>
<p style=''text-align: justify;''>Qua đó, ta có thể cấu trúc 1 đồ án cơ bản như sau:</p>
<p style=''text-align: justify;''>Chương 1: Giới thiệu</p>
<p style=''text-align: justify;''>Chương 2: Khảo sát lý thuyết</p>
<p style=''text-align: justify;''>Chương …</p>
<p style=''text-align: justify;''>Chương n-2: Thực nghiệm</p>
<p style=''text-align: justify;''>Chương n-1: Thảo luận & đánh giá</p>
<p style=''text-align: justify;''>Chương n: Kết luận</p>
<p style=''text-align: justify;''>Giám khảo, phản biện sẽ đọc Chương 1 và Chương kết luận đầu tiên. Đó cũng chính là lý do ta cần phải đầu tư thật nghiêm túc 2 chương này. Để nguời đọc có thể hiểu được ta muốn viết gì.</p>
<p style=''text-align: justify;''>Từ chương 3 trở đi, các bạn tự thiết kế nội dung xoay quanh các vấn đề để giải thích cho keywords đã phân tích và tập trung làm rõ đề tài.</p>
<p style=''text-align: justify;''>Chương n-2: Thực nghiệm: từ lý thuyết -> triển khai áp dụng thực tế.</p>
<p style=''text-align: justify;''>Chương n-1: Thảo luận & đánh giá: Quan trọng, đây là chương mà công sức của bạn sẽ được giáo viên chấm điểm ở đây !</p>
<p style=''text-align: justify;''>Vì sao: Khi đã đọc được rất nhiều sách vở, trình bày từ chương 1 đến chương n-2, chương n-1 là chương mà bạn nêu lên chính kiến của mình, hoặc đánh giá của mình (dựa trên các tài liệu thu thập được). Các bạn phát hiện được những ưu nhược nào của vấn đề, các lỗ hổng lớn nào cần phải được xử lý (không cần bạn phải xử lý, hoặc đưa ra giải pháp).</p>
<p style=''text-align: justify;''>Nên có những bản so sánh để đánh giá.</p>
<p style=''text-align: justify;''>Chương kết luận: Rất quan trọng: nó chốt lại những gì các bạn đã tìm hiểu, cho ra những kết luận quan trọng, và tóm gọn nội dung đã làm.</p>
<p style=''text-align: justify;''>Ví dụ:</p>
<p style=''text-align: justify;''>Đề tài đã tìm hiểu về GPS  và LBS ở những khía cạnh: 1,2,3,…..</p>
<p style=''text-align: justify;''>Chúng tôi nhận thấy rằng, GPS rất quan trọng và hữu ích cho LBS vì những lý do sau: i)…. ii)…, iii)…., iv) …..</p>
<p style=''text-align: justify;''>Tuy nhiên, LBS đòi hỏi những yếu tố 1)…., 2)…., 3)….. mà GPS có những hạn chế. Qua đó ta thấy để đáp ứng được những nhu cầu nâng cao của LBS, cần phải có những cải tiến x,y,z…</p>
<p style=''text-align: justify;''>Tóm lại, kỹ thuật GPS là một thành phần không thể thiếu cho LBS….</p>
<p style=''text-align: justify;''><strong>Kỷ luật viết & Nguyên tắc 2 giờ vàng</strong></p>
<p style=''text-align: justify;''>Mặc dù việc viết bài ngày nay đã đựơc hỗ trợ rất nhiều từ máy tính, <a href=''http://sinhvientot.net/category/van-phong/word/'' target=''_blank'' rel=''noopener noreferrer''>phần mềm soạn thảo văn bản</a>, máy in… Tuy nhiên, nếu bạn không bắt tay vào viết thì Đồ Án sẽ không bao giờ được hoàn thành.</p>
<p style=''text-align: justify;''>Việc viết đồ án đòi hỏi sự kiên trì, nhất quán và kỷ luật. Con người rất dễ bị chi phối bởi ngoại cảnh, nên việc ngồi tập trung 2h để viết là 1 việc vô cùng gian khổ!</p>
<p style=''text-align: justify;''><span style=''color: #0000ff;''>Ví dụ:</span></p>
<p style=''text-align: justify;''>Khi đang ngồi trong phòng viết bài, tự dưng có bạn rủ chơi game, chat, hay đi cafe (Thường rất khó từ chối :)) ==> Quên mất việc chính là viết bài, khi quay lại viết thì hết cảm hứng, lại phải tốn thời gian tập trung.</p>
<p style=''text-align: justify;''><strong>Nguyên tắc 2 giờ vàng:</strong> Một người làm việc trí óc có thể tập trung và làm việc hiệu quả nhất trong từng khoảng thời gian là 2 tiếng. Cho nên khi bắt tay vào viết, bạn phải chuẩn bị cho mình 2h rảnh, không được đi đâu hết. Không được phân tán, đi đây đó, nghe điện thoại, chat chit, lướt web, hoặc vào facebook !!!</p>
<p style=''text-align: justify;''>Một khi có một “tạp niệm” khởi lên, bạn đừng làm ngay theo sự dẫn dắt của nó, mà chỉ cần hỏi 1 câu: việc chính của mình lúc này đang làm gì ? Đang viết bài à, thì hãy bỏ qua tạp niệm đó, đừng để nó dẫn dắt, quay lại viết bài đi !</p>
<p style=''text-align: justify;''>Đây là một việc khó, cần phải rèn luyện.</p>
<h1>Vai trò của giáo viên hướng dẫn (GVHD)</h1>
<h2 style=''text-align: justify;''>Các sai lầm thường thấy của sinh viên khi bỏ qua vai trò của GVHD</h2>
<p style=''text-align: justify;''>Một trong những <span style=''color: #0000ff;''>sai lầm lớn nhất</span> của các sinh viên là không tham khảo ý kiến của giáo viên hướng dẫn. Tự mình làm đến sát ngày hết hạn nộp đồ án mới chạy đến nhờ giáo viên hướng dẫn xem, góp ý, thậm chí còn tự ý in đem đi nộp (Khả năng Fail là rất cao 🙂 lúc này chẳng có ai có thể giúp bạn được) !</p>
<p style=''text-align: justify;''>==> Giáo viên hướng dẫn lúc đó cũng bó tay luôn, không tài nào sửa chữa, góp ý kịp một công trình mà các bạn đã làm trong vòng hai đến sáu tháng !</p>
<p style=''text-align: justify;''>Sai lầm thứ 2, do đồ án là tìm hiểu, nghiên cứu công nghệ, triển khai ứng dụng mà việc đọc tài liệu và làm lab là chính sẽ dẫn đến tình trạng là không biết đọc bao nhiêu sách, lab thì đủ, bỏ cái nào, viết cái nào, hay là viết hết. Đồ án sẽ trở thành 1 bách khoa toàn thư và toàn là copy paste</p>
<h2 style=''text-align: justify;''>Vai trò của GVHD</h2>
<p style=''text-align: justify;''>GVHD là người có kinh nghiệm trong giảng dạy, nghiên cứu, và đã trải qua hết các giai đoạn mà các bạn đã và đang trải qua. Cho nên phải thường xuyên gặp gỡ, trao đổi (trực tiếp hay qua email) với GVHD để có được góp ý kịp thời.</p>
<p style=''text-align: justify;''>GVHD không phải là người nghe, nói, đọc, viết thay cho các bạn, nhưng sẽ là người định hướng để các bạn có thể tự mình tìm ra con đường của mình thông qua việc cung cấp tài liệu, chỉ sách cho đọc, và qua các buổi gặp mặt, thảo luận trực tiếp.</p>
<p style=''text-align: justify;''>GVHD là người biết tầm vóc của vấn đề các bạn đang nghiên cứu và nắm rõ chuẩn đầu ra của trường. Cho nên việc trao đổi thường xuyên sẽ giúp các bạn hoàn thiện đồ án không ở mức quá sơ sài, cũng như không phải là xây dựng bách khoa toàn thư.</p>
<h2 style=''text-align: justify;''>Kết luận</h2>
<p style=''text-align: justify;''>Tóm lại, viết đồ án là việc gian nan nhưng không kém phần thú vị, vì khi viết được, có nghĩa là bạn đã hiểu được. có thể nó sẽ là sản phẩm chúng ta sẽ sử dụng để bổ sung vào CV xin việc.</p>
<p style=''text-align: justify;''>Bài viết này có tham khảo một số tư liệu của <strong>TS. Nguyễn Anh Tuấn</strong> – Trưởng Khoa Truyền thông và Mạng máy tính. Trường ĐHCNTT</p>
<h1><strong>Mẫu hướng dẫn viết đồ án tốt nghiệp</strong></h1>
<p>Một số mẫu và hướng dẫn cách viết đồ án bạn có thể tham khảo:</p>
<ol>
<li>Mẫu báo cáo Đồ án tốt nghiệp trường đại học công nghiệp thực phẩm: <a href=''http://sinhvientot.net/wp-content/uploads/2016/06/Mau-4_trinh-bay-do-an-tot-nghiep.doc''>Mau 4_trinh bay do an tot nghiep</a></li>
<li>Mẫu báo cáo Khóa luận tốt nghiệp trường đại học công nghiệp thực phẩm: <a href=''http://sinhvientot.net/wp-content/uploads/2016/06/Mau-3_trinh-bay-khoa-luan.doc''>Mau 3_trinh bay khoa luan</a></li>
<li>Mẫu báo cáo Luận văn tốt nghiệp trường đại học công nghiệp thực phẩm: <a href=''http://sinhvientot.net/wp-content/uploads/2016/06/Mau-3_trinh-bay-luan-van.doc''>Mau 3_trinh bay luan van</a></li>
<li>Hướng dẫn viết đồ án/khóa luận trường đại học Sư phạm kỹ thuật</li>
<li><a class=''seoquake-nofollow'' href=''http://ouo.io/QPfsI'' target=''_blank'' rel=''nofollow noopener noreferrer''>Hướng dẫn viết đồ án/khóa luận trườ</a>ng đại học Hutech</li>
</ol>
<p>Đồ án tham khảo:</p>
<p><a href=''http://sinhvientot.net/xay-dung-va-trien-khai-he-thong-voip-cho-doanh-nghiep-vua-va-nho/'' target=''_blank'' rel=''noopener noreferrer''>Xây dựng và triển khai hệ thống VoIP cho doanh nghiệp vừa và nhỏ</a></p>
<p><strong>XÂY DỰNG HỆ THỐNG MAIL </strong><strong>CHO DOANH NGHIỆP ĐẠI NAM</strong></p>
<p><iframe width=''100%'' height=''480'' src=''https://drive.google.com/file/d/13hPXeT75mS7QZVrjrwQz7VkdBzSwiTor/preview''></iframe></p>
<p><strong>Xem thêm các bài viết:</strong></p>
<p><a href=''http://sinhvientot.net/tao-ngat-trang-danh-so-trang-tieu-de-trang-trong-word/'' target=''_blank'' rel=''noopener noreferrer''>Tạo ngắt trang, đánh số trang, tiêu đề trang trong Word</a></p>
<p><a href=''http://sinhvientot.net/huong-dan-tao-muc-luc-tu-dong-trong-word/'' target=''_blank'' rel=''noopener noreferrer''>Hướng dẫn tạo mục lục tự động trong Word</a></p>
<p>Chúc các bạn thành công! nếu có thắc mắc hoặc chưa rõ các bạn để lại thông tin bên dưới</p>
', N'https://afamilycdn.com/150157425591193600/2020/7/3/quy-trinh-trinh-tu-cac-buoc-xay-dung-nha-o-15937457651411019864884.jpg', N'admin', 1, 2, N'9b711186-40a1-420c-a7b8-4a00a5194331', N'9b711186-40a1-420c-a7b8-4a00a5194331')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [IsMainPost], [ProjectID]) VALUES (N'a0c77d94-43a2-4b55-b015-45ea40cf16ec', N'Test đăng', CAST(N'2022-03-11' AS Date), N'Võ Đức Minh', N'<h3>Ưu điểm của hệ thống giữ xe th&ocirc;ng minh:</h3>

<ul>
	<li>N&acirc;ng cao năng suất hoạt động của b&atilde;i xe. Tăng thời gian tương t&aacute;c.</li>
	<li>Hạn chế sự ảnh hưởng con người.</li>
	<li>An to&agrave;n, an ninh được đảm bảo cao hơn nhiều so với phương ph&aacute;p truyền thống.</li>
	<li>Dễ d&agrave;ng lưu trữ v&agrave; truy suất dữ liệu khi cần thiết.</li>
</ul>

<h3>B&atilde;i giữ xe th&ocirc;ng minh cần c&oacute; những thiết bị g&igrave;</h3>

<p>Sự phức tạp v&agrave; số lượng thiết bị của hệ thống b&atilde;i giữ xe phụ thuộc v&agrave;o nhu cầu của kh&aacute;ch h&agrave;ng v&agrave; sự cần thiết trong từng ho&agrave;n cảnh thực tế.</p>

<p>Ngo&agrave;i ra hệ thống giữ xe d&agrave;nh cho xe m&aacute;y thường c&oacute; y&ecirc;u cầu đơn giản hơn so với hệ thống giữ xe d&agrave;nh cho oto.</p>

<p>Về cơ bản, một hệ thống giữ xe tự động cần c&oacute; những thiết bị sau:</p>

<ul>
	<li>
	<h4>M&aacute;y t&iacute;nh điều khiển.</h4>
	</li>
</ul>

<p>Do nhu cầu hoạt động li&ecirc;n tục, m&aacute;y t&iacute;nh được sử dụng n&ecirc;n l&agrave; loại m&aacute;y t&iacute;nh c&ocirc;ng nghiệp. M&aacute;y c&oacute; hiệu suất cao v&agrave; hoạt động bền bỉ.</p>

<p><img alt="Máy tính công nghiệp IPC 7132 dành cho Bãi giữ xe thông minh" height="214" sizes="(max-width: 300px) 100vw, 300px" src=''https://dienmayglobal.vn/wp-content/uploads/2018/10/may-tinh-cong-nghiep-ipc-7132-300x214.jpg" srcset="https://dienmayglobal.vn/wp-content/uploads/2018/10/may-tinh-cong-nghiep-ipc-7132-300x214.jpg 300w, https://dienmayglobal.vn/wp-content/uploads/2018/10/may-tinh-cong-nghiep-ipc-7132.jpg 350w" width="300'' /></p>

<p>M&aacute;y t&iacute;nh c&ocirc;ng nghiệp IPC 7132</p>

<p><strong>M&aacute;y t&iacute;nh c&ocirc;ng nghiệp IPC 7132</strong>&nbsp;với cấu h&igrave;nh đề xuất như sau:</p>

<p>&ndash; Khung:&nbsp;CHASSIS, Cost-effective ATX/mATX chassis</p>

<p>&ndash; Bo mạch chủ:&nbsp;AIMB-705G2-00A1E CIRCUIT BOARD, LGA1151 ATX IMB H110, Dual LAN, Dual display</p>

<p>&ndash; Nguồn:&nbsp;PS8-300ATX-ZBE: POWER SUPPLY, 80+ Bronze PS/2 SPS 300W ATX (DELTA) RoHS</p>

<p>&ndash; Main:&nbsp;96MPI3S-3.7-3M11T CORE 3.7G 3M 1151P 2 CORE I3-6100</p>

<p>&ndash; Ram: 4GGB.&nbsp;Ổ cứng: HDD 500GGb</p>

<ul>
	<li>
	<h4>Phần mềm chuy&ecirc;n dụng quản l&yacute; b&atilde;i đỗ xe.</h4>
	</li>
</ul>

<p>Phần mềm c&oacute; chức năng điều khiển, hiển thị h&igrave;nh ảnh trực tiếp. Điều khiển chụp ảnh khi c&oacute; xe ra v&agrave;o.</p>

<p>&ndash; T&iacute;ch hợp chức năng nhận diện biển số, khả năng nhận diện biển số cao l&ecirc;n tới hơn 90%.</p>

<p>&ndash; Xử l&yacute; đổi l&agrave;n trong giờ cao điểm</p>

<p>&ndash; Giao diện đơn giản, dễ sử dụng</p>

<p>&ndash; T&iacute;nh năng bảo mật cao, quản l&yacute; chặt chẽ, kh&ocirc;ng để thất thu bất cứ một khoản ph&iacute; n&agrave;o.</p>

<p>&ndash; Dự to&aacute;n, ph&acirc;n chia tất cả c&aacute;c trường hợp c&oacute; thể xảy ra, đồng thời x&acirc;y dựng hướng giải quyết cho c&aacute;c trường hợp một c&aacute;ch tối ưu nhất</p>

<p><img alt="Phần mềm quản lý bãi giữ xe" height="576" sizes="(max-width: 1024px) 100vw, 1024px" src=''https://dienmayglobal.vn/wp-content/uploads/2018/10/phan-mem-quan-ly-bai-giu-xe-1024x576.png" srcset="https://dienmayglobal.vn/wp-content/uploads/2018/10/phan-mem-quan-ly-bai-giu-xe-1024x576.png 1024w, https://dienmayglobal.vn/wp-content/uploads/2018/10/phan-mem-quan-ly-bai-giu-xe-300x169.png 300w, https://dienmayglobal.vn/wp-content/uploads/2018/10/phan-mem-quan-ly-bai-giu-xe-768x432.png 768w, https://dienmayglobal.vn/wp-content/uploads/2018/10/phan-mem-quan-ly-bai-giu-xe-1170x658.png 1170w, https://dienmayglobal.vn/wp-content/uploads/2018/10/phan-mem-quan-ly-bai-giu-xe-800x450.png 800w, https://dienmayglobal.vn/wp-content/uploads/2018/10/phan-mem-quan-ly-bai-giu-xe.png 1366w" width="1024'' /></p>

<p>Phần mềm quản l&yacute; b&atilde;i giữ xe &ndash; h&igrave;nh ảnh minh họa</p>

<ul>
	<li>
	<h4>Camera chụp biển số</h4>
	</li>
</ul>

<p>Camera d&ugrave;ng để chụp v&agrave; lưu lại h&igrave;nh ảnh v&agrave;o phần mềm mỗi khi c&oacute; xe ra v&agrave;o.</p>

<p>Mỗi l&agrave;n xe thường được thiết kế gồm 3 camera: 1 camera chụp trước (mặt kh&aacute;ch), 1 camera chụp biển số v&agrave; 1 camera chụp to&agrave;n cảnh.</p>

<p>Ch&uacute;ng t&ocirc;i sử dụng&nbsp;<a href="https://dienmayglobal.vn/product-category/camera-an-ninh/camera-ip/">camera IP</a>&nbsp;cho chất lượng h&igrave;nh ảnh vượt trội, kể cả trong điều kiện b&atilde;i xe thiếu s&aacute;ng.</p>

<ul>
	<li>
	<h4>Barrier tự động</h4>
	</li>
</ul>

<p><a href="https://dienmayglobal.vn/product-category/cong-cua-tu-dong/barrier-tu-dong/">Barrier tự động</a>&nbsp;được sử dụng để n&acirc;ng hạ tự động, sau khi xe đ&atilde; quẹt thẻ v&agrave; được hệ thống ghi nhận l&agrave; hợp lệ.</p>

<p>Trong một số trường hợp, kh&aacute;ch h&agrave;ng c&oacute; thể kh&ocirc;ng cần sử dụng barrier để tiết giảm chi ph&iacute; đầu tư.</p>

<p>Tuy nhi&ecirc;n, việc lắp barrier vẫn thực sự cần thiết đối với b&atilde;i giữ xe th&ocirc;ng minh do c&oacute; thể hạn chế được những h&agrave;nh vi cố t&igrave;nh vượt qua kiểm so&aacute;t. Đặc biệt hiệu quả trong trường hợp b&atilde;i giữ xe tự động ho&agrave;n to&agrave;n v&agrave; kh&ocirc;ng c&oacute; người kiểm so&aacute;t.</p>

<p>Sản phẩm được ưu chuộng nhất hiện nay l&agrave; d&ograve;ng BS-306. Với việc t&ugrave;y biến được cần thẳng hoặc cần gập v&agrave; chiều d&agrave;i barrier, BS-306 th&iacute;ch hợp với cả kh&ocirc;ng gian rộng cũng như chật hẹp.</p>

<table border="0">
	<tbody>
		<tr>
			<td><img alt="Barrier tự động BS-306" height="300" sizes="(max-width: 300px) 100vw, 300px" src=''https://dienmayglobal.vn/wp-content/uploads/2018/08/barrier-tu-dong-bs-306-300x300.jpg" srcset="https://dienmayglobal.vn/wp-content/uploads/2018/08/barrier-tu-dong-bs-306-300x300.jpg 300w, https://dienmayglobal.vn/wp-content/uploads/2018/08/barrier-tu-dong-bs-306-150x150.jpg 150w, https://dienmayglobal.vn/wp-content/uploads/2018/08/barrier-tu-dong-bs-306-768x768.jpg 768w, https://dienmayglobal.vn/wp-content/uploads/2018/08/barrier-tu-dong-bs-306-100x100.jpg 100w, https://dienmayglobal.vn/wp-content/uploads/2018/08/barrier-tu-dong-bs-306-400x400.jpg 400w, https://dienmayglobal.vn/wp-content/uploads/2018/08/barrier-tu-dong-bs-306.jpg 800w, https://dienmayglobal.vn/wp-content/uploads/2018/08/barrier-tu-dong-bs-306-120x120.jpg 120w, https://dienmayglobal.vn/wp-content/uploads/2018/08/barrier-tu-dong-bs-306-600x600.jpg 600w" width="300'' />
			<p>Barrier tự động BS-306</p>
			</td>
			<td><img alt="Barrier cần gập thích hợp cho không gian hẹp" height="225" sizes="(max-width: 300px) 100vw, 300px" src=''https://dienmayglobal.vn/wp-content/uploads/2018/10/barrier-can-gap-300x225.jpg" srcset="https://dienmayglobal.vn/wp-content/uploads/2018/10/barrier-can-gap-300x225.jpg 300w, https://dienmayglobal.vn/wp-content/uploads/2018/10/barrier-can-gap-768x576.jpg 768w, https://dienmayglobal.vn/wp-content/uploads/2018/10/barrier-can-gap-800x600.jpg 800w, https://dienmayglobal.vn/wp-content/uploads/2018/10/barrier-can-gap.jpg 960w" width="300'' />
			<p>Barrier cần gập th&iacute;ch hợp cho kh&ocirc;ng gian hẹp</p>
			</td>
		</tr>
	</tbody>
</table>

<ul>
	<li>
	<h4>Bộ d&ograve; v&ograve;ng từ</h4>
	</li>
</ul>

<p>Bộ d&ograve; v&ograve;ng từ l&agrave; một bộ phần quan trọng kh&ocirc;ng thể thiếu của b&atilde;i giữ xe th&ocirc;ng minh. N&oacute; được sử dụng trong c&aacute;c b&agrave;i to&aacute;n ph&aacute;t hiện xe, đếm xe hay ph&acirc;n loại xe.</p>

<p>Cấu tạo của một v&ograve;ng từ bao gồm 1 cu&ocirc;n d&acirc;y điện được sắp xếp th&agrave;nh 1 mạch v&ograve;ng.</p>

<p>C&oacute; xe đi v&agrave;o bộ d&ograve; v&ograve;ng từ sẽ k&iacute;ch hoạt hệ thống nhận dạng thẻ từ xa đối với oto. Bộ d&ograve; v&ograve;ng từ cũng c&oacute; thể điều khiển n&acirc;ng hạ tự động barrier khi c&oacute; xe qua.</p>

<p>Ch&uacute;ng ta c&oacute; thể kết hợp nhiều bộ d&ograve; v&ograve;ng từ để thực hiện c&aacute;c chức năng kh&aacute;c nhau.</p>

<p>N&oacute;i chung việc lắp đặt v&agrave; bố tr&iacute; bộ d&ograve; v&ograve;ng từ như thế n&agrave;o phụ thuộc v&agrave;o y&ecirc;u cầu v&agrave; b&agrave;i to&aacute;n m&agrave; kh&aacute;ch h&agrave;ng đề ra.</p>

<ul>
	<li>
	<h4>Đầu đọc thẻ</h4>
	</li>
</ul>

<p>Đầu đọc thẻ được sử dụng để qu&eacute;t thẻ từ tr&ecirc;n oto hoặc thẻ của người đi xe m&aacute;y. T&iacute;n hiệu từ đầu đọc thẻ được gửi về m&aacute;y t&iacute;nh trung t&acirc;m để xử l&yacute;.</p>

<p>Đối với hệ thống kiểm so&aacute;t oto, thường sẽ sử dụng đầu đọc thẻ tầm trung hoặc xa để thuận tiện cho người sử dụng.</p>

<table border="0">
	<tbody>
		<tr>
			<td><img alt="Bãi giữ xe thông minh" height="191" sizes="(max-width: 300px) 100vw, 300px" src=''https://dienmayglobal.vn/wp-content/uploads/2018/10/dau-doc-the-tam-trung-300x191.jpg" srcset="https://dienmayglobal.vn/wp-content/uploads/2018/10/dau-doc-the-tam-trung-300x191.jpg 300w, https://dienmayglobal.vn/wp-content/uploads/2018/10/dau-doc-the-tam-trung-768x489.jpg 768w, https://dienmayglobal.vn/wp-content/uploads/2018/10/dau-doc-the-tam-trung-800x509.jpg 800w, https://dienmayglobal.vn/wp-content/uploads/2018/10/dau-doc-the-tam-trung.jpg 955w" width="300'' />
			<p>Đầu đọc thẻ từ tầm trung d&ugrave;ng để kiểm so&aacute;t thẻ xe oto</p>
			</td>
			<td><img alt="Đầu đọc thẻ từ tầm trung" height="300" sizes="(max-width: 236px) 100vw, 236px" src=''https://dienmayglobal.vn/wp-content/uploads/2018/10/dau-doc-the-tam-trung-GP-99-236x300.jpg" srcset="https://dienmayglobal.vn/wp-content/uploads/2018/10/dau-doc-the-tam-trung-GP-99-236x300.jpg 236w, https://dienmayglobal.vn/wp-content/uploads/2018/10/dau-doc-the-tam-trung-GP-99-768x976.jpg 768w, https://dienmayglobal.vn/wp-content/uploads/2018/10/dau-doc-the-tam-trung-GP-99-806x1024.jpg 806w, https://dienmayglobal.vn/wp-content/uploads/2018/10/dau-doc-the-tam-trung-GP-99-1170x1486.jpg 1170w, https://dienmayglobal.vn/wp-content/uploads/2018/10/dau-doc-the-tam-trung-GP-99-800x1016.jpg 800w, https://dienmayglobal.vn/wp-content/uploads/2018/10/dau-doc-the-tam-trung-GP-99.jpg 1188w" width="236'' />
			<p>Đầu đọc thẻ từ tầm trung</p>
			</td>
		</tr>
	</tbody>
</table>

<ul>
	<li>
	<h4>Thẻ từ</h4>
	</li>
</ul>

<p>Cuối c&ugrave;ng, th&agrave;nh phần kh&ocirc;ng thể thiếu của b&atilde;i giữ xe th&ocirc;ng minh, đ&oacute; l&agrave; thẻ từ.</p>

<p>Thẻ từ c&oacute; thể gắn l&ecirc;n mặt trước của oto để nhận dạng xe đ&atilde; đăng k&yacute;.</p>

<p>Hoặc c&oacute; thể l&agrave; thẻ d&ugrave;ng 1 lần ứng dụng cho c&aacute;c si&ecirc;u thị hay b&atilde;i giữ xe c&ocirc;ng cộng.</p>

<ul>
	<li>
	<h4>Th&agrave;nh phần phụ:</h4>
	</li>
</ul>

<p>Th&agrave;nh phần phụ c&oacute; thể c&oacute; của b&atilde;i giữ xe th&ocirc;ng minh thường c&oacute;:</p>

<p>&ndash; Gờ giảm tốc</p>

<p>&ndash; Lan can ph&acirc;n l&agrave;n</p>

<p>&ndash; Gi&aacute; đỡ cột đ&egrave;n</p>

<p>&ndash; Bốt bảo vệ&hellip;</p>

<h3>Thiết kế b&atilde;i giữ xe th&ocirc;ng minh như thế n&agrave;o?</h3>

<p>Thiết kế v&agrave; lựa chọn thiết bị cho b&atilde;i giữ xe để đảm bảo t&iacute;nh kinh tế v&agrave; hiệu quả l&agrave; một thử th&aacute;ch đối với người thiết kế.</p>

<p>Trước ti&ecirc;n, ta phải lựa chọn được ph&acirc;n l&agrave;n xe như thế n&agrave;o: l&agrave;n xe m&aacute;y, l&agrave;n oto, l&agrave;n hỗn hợp.</p>

<p>Căn cứ v&agrave;o đặc th&ugrave; của b&atilde;i giữ xe v&agrave; y&ecirc;u cầu của kh&aacute;ch h&agrave;ng, b&atilde;i giữ xe th&ocirc;ng minh c&oacute; thể phục vụ nhu cầu như sau:</p>

<ul>
	<li>D&ugrave;ng cho t&ograve;a nh&agrave;, khu d&acirc;n cư, nơi c&aacute;c xe ra v&agrave;o phải đăng k&yacute; thẻ để ra v&agrave;o. Trường hợp n&agrave;y thường phải bố tr&iacute; th&ecirc;m barrier. Bộ d&ograve; v&ograve;ng từ cũng thường được thiết kế 3 v&ograve;ng. Một v&ograve;ng từ để ph&aacute;t hiện xe đến. Một v&ograve;ng từ để điều khiển n&acirc;ng hạ barrier. V&ograve;ng từ cuối c&ugrave;ng để x&aacute;c định xe đ&atilde; đi khỏi phạm vi kiểm so&aacute;t. Giải ph&aacute;p n&agrave;y c&ograve;n được sử dụng cho c&aacute;c trạm thu ph&iacute; 1 dừng.</li>
	<li>D&ugrave;ng cho c&aacute;c si&ecirc;u thị, trung t&acirc;m thương mại, nơi đa phần l&agrave; kh&aacute;ch ra v&agrave;o trong thời gian ngắn. Trường hợp n&agrave;y thường kh&ocirc;ng phải lắp đặt barrier do lượng kh&aacute;ch ra v&agrave;o rất lớn, y&ecirc;u cầu thời gian nhanh.</li>
	<li>Trạm c&acirc;n tải trọng: Sử dụng 2 bộ d&ograve; v&ograve;ng từ để ph&aacute;t hiện xe v&agrave;o v&agrave; ra khỏi phạm vi kiểm so&aacute;t.</li>
</ul>

<p>Như vậy, một hệ thống kiểm so&aacute;t ra v&agrave;o cho xe l&agrave; một hệ thống đồng bộ. Kinh ph&iacute; đầu tư lớn, do đ&oacute; cần được nghi&ecirc;n cứu v&agrave; t&iacute;nh to&aacute;n cụ thể, chi tiết.</p>
', N'https://i.imgur.com/c6TjMza.png', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 1, NULL, N'1')
INSERT [dbo].[Posts] ([PostID], [PostTitle], [PostDate], [PostAuthor], [PostContent], [PostImage], [LastEditedUser], [Upvote], [PostStatusID], [IsMainPost], [ProjectID]) VALUES (N'cbe0f33a-6928-4f04-a15b-4e42ea51a2bd', N'Bài Viết Đỉnh Nhất Sub', CAST(N'2022-03-11' AS Date), N'Võ Đức Minh', N'<p>ok</p>
', N'https://i.imgur.com/WselWiP.jpg', N'5a1e40f4-a2a3-4078-a257-21863e042b12', 0, 1, NULL, N'2')
GO
SET IDENTITY_INSERT [dbo].[PostStatuses] ON 

INSERT [dbo].[PostStatuses] ([PostStatusID], [PostStatusName]) VALUES (1, N'Đã Xuất Bản')
INSERT [dbo].[PostStatuses] ([PostStatusID], [PostStatusName]) VALUES (2, N'Đang Chờ Duyệt')
INSERT [dbo].[PostStatuses] ([PostStatusID], [PostStatusName]) VALUES (3, N'Đã Xóa')
SET IDENTITY_INSERT [dbo].[PostStatuses] OFF
GO
INSERT [dbo].[ProjectInstructor] ([ProjectID], [InstructorID]) VALUES (N'1', N'1')
INSERT [dbo].[ProjectInstructor] ([ProjectID], [InstructorID]) VALUES (N'2', N'4')
INSERT [dbo].[ProjectInstructor] ([ProjectID], [InstructorID]) VALUES (N'2', N'6')
INSERT [dbo].[ProjectInstructor] ([ProjectID], [InstructorID]) VALUES (N'3', N'5')
INSERT [dbo].[ProjectInstructor] ([ProjectID], [InstructorID]) VALUES (N'89297957-2ada-447b-983d-75ae24be3376', N'4')
INSERT [dbo].[ProjectInstructor] ([ProjectID], [InstructorID]) VALUES (N'9b711186-40a1-420c-a7b8-4a00a5194331', N'1')
GO
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [ProjectDescription], [ProjectImage], [ProjectScore], [MajorID], [SemesterID]) VALUES (N'1', N'Đồ Án Đỗ Xe Máy Tự Động', N'', N'https://i.imgur.com/4AKg45F.jpg', 9.8000001907348633, N'1', N'1')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [ProjectDescription], [ProjectImage], [ProjectScore], [MajorID], [SemesterID]) VALUES (N'2', N'Đồ Án Tự Động Pass Môn', N'', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0Qh8AMAWqukQpGe4zYNYeP0b0WYXh6c3tjJcVuUxT10od1kXgfDkgNPKpODJUC0jERaM&usqp=CAU', 9.5, N'1', N'2')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [ProjectDescription], [ProjectImage], [ProjectScore], [MajorID], [SemesterID]) VALUES (N'3', N'Đồ Án Đỗ Xe Máy Tự Động 12312312', N'<p>ok</p>
', N'https://i.imgur.com/t4CElhX.png', 10, N'1', N'1')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [ProjectDescription], [ProjectImage], [ProjectScore], [MajorID], [SemesterID]) VALUES (N'89297957-2ada-447b-983d-75ae24be3376', N'Đồ Án Demo Môn SWP', N'', N'', 9.5, N'1', N'1')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [ProjectDescription], [ProjectImage], [ProjectScore], [MajorID], [SemesterID]) VALUES (N'9b711186-40a1-420c-a7b8-4a00a5194331', N'Đồ Án Xây Nhà Tự Động', N' https://afamilycdn.com/150157425591193600/2020/7/3/quy-trinh-trinh-tu-cac-buoc-xay-dung-nha-o-15937457651411019864884.jpg', N'https://afamilycdn.com/150157425591193600/2020/7/3/quy-trinh-trinh-tu-cac-buoc-xay-dung-nha-o-15937457651411019864884.jpg', 8, N'1', N'1')
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'User')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Moderator')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[Semesters] ([SemesterID], [SemesterName]) VALUES (N'1', N'Fall 2021')
INSERT [dbo].[Semesters] ([SemesterID], [SemesterName]) VALUES (N'2', N'Spring 2021')
GO
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE111111', N'Lê Đức Anh', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'1')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE111112', N'Lê Đức Chị', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'1')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE111113', N'Lê Văn Long', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'1')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE111114', N'Trần Đức Thọ', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'1')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE111118', N'Nguyễn Văn An', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'3')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE150111', N'Trần Quang Quyền', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'1')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE150122', N'Nguyễn Khắc Trung Nguyên', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'89297957-2ada-447b-983d-75ae24be3376')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE150123', N'Hoàng Trung Thông', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'9b711186-40a1-420c-a7b8-4a00a5194331')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE150155', N'Võ Đức Minh', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'9b711186-40a1-420c-a7b8-4a00a5194331')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE150321', N'Trần Thiện Tú', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'89297957-2ada-447b-983d-75ae24be3376')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE150515', N'Lê Hồng Anh', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'9b711186-40a1-420c-a7b8-4a00a5194331')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE150987', N'Võ Hoàng Vy', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'89297957-2ada-447b-983d-75ae24be3376')
INSERT [dbo].[Students] ([StudentID], [StudentName], [MajorID], [StudentImage], [TeamID]) VALUES (N'SE151515', N'Trần Hoàng Phúc', N'1', N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'89297957-2ada-447b-983d-75ae24be3376')
GO
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'068b353f-2da9-471b-ad07-0ec1848329d2', N'711')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'0c4eb40e-db82-45d3-a728-1663f60280d7', N'10 diem')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'10c21347-32d5-46b4-9bc3-74c54f406ddf', N'Okoko')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'1921f38f-631e-44d4-ae5e-f713532888bf', N'ok')
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
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'59b667d4-fd47-4caa-83c5-2e87aaeead8c', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'5abc0f0a-6349-4ee7-b664-15eee7f7a9cc', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'60aab4b6-5e68-41d7-bb2b-7f80f90ba13b', N'hcmu')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'6795925a-f0c8-43ec-8898-1f19a7138f6b', N'testtag')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'6f7894ca-23a2-49c7-a5b6-2c683d748e76', N'ok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'73dbeead-16c6-41ff-82d5-ca9e582b2481', N'alo')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'77be3b33-6a1c-4d82-9e38-112c8c8e3af2', N'pass mon')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'8363d738-351c-4bc2-9c1d-bda7d71cb323', N'ok')
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
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'd5bcdb21-e253-4e2e-8e5a-4283c6ef3dc0', N'teamid')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'dc134bdf-8341-40ac-ba51-150e083e80d1', N'fptu')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'deae5a32-bece-4877-b92c-0d057fd994c8', N'testtagnha')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'e0808248-a87e-457e-b6b2-5d5c5e6f7be0', N'okok')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'e192e096-a94b-4fab-ae37-22a56cc96027', N'coc vang')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'e63d73a8-16ca-49c4-af5d-35e2012d80ab', N'testtag')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'ebdd3ee9-a863-4924-8b57-c08109632a28', N'gôd')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'f1246c6b-d677-4e50-9fd3-5d991ad391b4', N'ghe gom')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'f2af66c2-4ed7-4a90-abeb-19225c2f3dad', N'oi')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'f3688faf-d6d9-4cd0-9791-1ebfb9ad6683', N'bai nay hay lam')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'fb3dde67-d583-4882-9b3a-00564d1b5401', N'bai nay hay lam')
INSERT [dbo].[TagDetails] ([TagDetailID], [TagDetailName]) VALUES (N'fcce1d49-4f16-4fcb-98ea-4ed0d875f7e0', N'hcmu')
GO
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'1', N'1e4a9e98-868f-4cba-8d25-fcf8a6891474')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'1', N'd5bcdb21-e253-4e2e-8e5a-4283c6ef3dc0')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'2', N'0c4eb40e-db82-45d3-a728-1663f60280d7')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'2', N'1e4a9e98-868f-4cba-8d25-fcf8a6891474')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'2', N'77be3b33-6a1c-4d82-9e38-112c8c8e3af2')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'2', N'dc134bdf-8341-40ac-ba51-150e083e80d1')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'2', N'e192e096-a94b-4fab-ae37-22a56cc96027')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'3', N'1921f38f-631e-44d4-ae5e-f713532888bf')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'71e6a646-baf4-490e-9661-97360450f989', N'e0808248-a87e-457e-b6b2-5d5c5e6f7be0')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'89297957-2ada-447b-983d-75ae24be3376', N'1921f38f-631e-44d4-ae5e-f713532888bf')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'9b711186-40a1-420c-a7b8-4a00a5194331', N'59b667d4-fd47-4caa-83c5-2e87aaeead8c')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'9b711186-40a1-420c-a7b8-4a00a5194331', N'6f7894ca-23a2-49c7-a5b6-2c683d748e76')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'9b711186-40a1-420c-a7b8-4a00a5194331', N'f3688faf-d6d9-4cd0-9791-1ebfb9ad6683')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'9b711186-40a1-420c-a7b8-4a00a5194331', N'fb3dde67-d583-4882-9b3a-00564d1b5401')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'a0c77d94-43a2-4b55-b015-45ea40cf16ec', N'8363d738-351c-4bc2-9c1d-bda7d71cb323')
INSERT [dbo].[Tags] ([PostID], [TagDetailID]) VALUES (N'cbe0f33a-6928-4f04-a15b-4e42ea51a2bd', N'1921f38f-631e-44d4-ae5e-f713532888bf')
GO
INSERT [dbo].[Teams] ([TeamID], [TeamName]) VALUES (N'1', N'GaoTeam')
INSERT [dbo].[Teams] ([TeamID], [TeamName]) VALUES (N'2', N'SecondTeam')
INSERT [dbo].[Teams] ([TeamID], [TeamName]) VALUES (N'3', N'Team 3')
INSERT [dbo].[Teams] ([TeamID], [TeamName]) VALUES (N'89297957-2ada-447b-983d-75ae24be3376', N'Team 2')
INSERT [dbo].[Teams] ([TeamID], [TeamName]) VALUES (N'9b711186-40a1-420c-a7b8-4a00a5194331', N'Team 1')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'1', N'1', CAST(N'2021-01-01T00:00:00.000' AS DateTime), 3, N'1         ', N'1@1.com', NULL, N'1', N'1', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'4d301e43-5cf3-4f2e-a3bd-60a945cfb672', N'Võ Đức Minh', CAST(N'2022-03-07T11:57:37.000' AS DateTime), 2, N'', N'voducminh140201@gmail.com', NULL, N'', N'', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'4f9a70eb-b736-4d59-8ed7-ffceaef6efb6', N'Min Min', CAST(N'2022-02-09T17:45:59.000' AS DateTime), 2, N'', N'voducminh01@gmail.com', NULL, N'1', N'', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'5a1e40f4-a2a3-4078-a257-21863e042b12', N'Võ Đức Minh', CAST(N'2022-01-16T21:42:19.000' AS DateTime), 2, N'          ', N'minhvdse150114@fpt.edu.vn', NULL, N'1', N'', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'admin', N'admin', CAST(N'2022-03-11T00:00:00.000' AS DateTime), 2, N' ', N'admin@admin.com', NULL, N'admin', NULL, 2)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'SE150111', N'Trần Quang Quyền', CAST(N'2022-03-11T08:12:42.163' AS DateTime), 2, N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'quyentqse150111@fpt.edu.vn', NULL, N'123456', NULL, 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'SE150122', N'Nguyễn Khắc Trung Nguyên', CAST(N'2022-03-11T08:12:42.283' AS DateTime), 2, N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'nguyenntkse150122@fpt.edu.vn', NULL, N'123456', NULL, 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'SE150123', N'Hoàng Trung Thông', CAST(N'2022-03-11T08:12:42.223' AS DateTime), 2, N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'thonghtse150123@fpt.edu.vn', NULL, N'123456', NULL, 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'SE150155', N'Võ Đức Minh', CAST(N'2022-03-11T08:12:42.107' AS DateTime), 2, N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'minhvdse150155@fpt.edu.vn', NULL, N'123456', NULL, 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'SE150321', N'Trần Thiện Tú', CAST(N'2022-03-11T08:12:42.357' AS DateTime), 2, N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'tuttse150321@fpt.edu.vn', NULL, N'123456', NULL, 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'SE150515', N'Lê Hồng Anh', CAST(N'2022-03-11T08:12:41.430' AS DateTime), 2, N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'anhlhse150515@fpt.edu.vn', NULL, N'123456', NULL, 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'SE150987', N'Võ Hoàng Vy', CAST(N'2022-03-11T08:12:42.417' AS DateTime), 2, N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'vyvhse150987@fpt.edu.vn', NULL, N'123456', NULL, 1)
INSERT [dbo].[Users] ([UserID], [UserName], [DateCreated], [UserStatusID], [UserImage], [Email], [SubEmail], [Password], [OTP], [RoleID]) VALUES (N'SE151515', N'Trần Hoàng Phúc', CAST(N'2022-03-11T08:12:42.490' AS DateTime), 2, N'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png', N'phucthse151515@fpt.edu.vn', NULL, N'123456', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[UserStatus] ON 

INSERT [dbo].[UserStatus] ([UserStatusID], [UserStatusName]) VALUES (2, N'Active')
INSERT [dbo].[UserStatus] ([UserStatusID], [UserStatusName]) VALUES (3, N'Inactive')
SET IDENTITY_INSERT [dbo].[UserStatus] OFF
GO
INSERT [dbo].[Votes] ([UserID], [PostID]) VALUES (N'5a1e40f4-a2a3-4078-a257-21863e042b12', N'2')
INSERT [dbo].[Votes] ([UserID], [PostID]) VALUES (N'admin', N'9b711186-40a1-420c-a7b8-4a00a5194331')
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
