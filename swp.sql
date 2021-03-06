USE [master]
GO
/****** Object:  Database [SWPG2]    Script Date: 11/9/2021 8:15:23 PM ******/
CREATE DATABASE [SWPG2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWPG2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SWPG2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWPG2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SWPG2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWPG2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWPG2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWPG2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWPG2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWPG2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWPG2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWPG2] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWPG2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWPG2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWPG2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWPG2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWPG2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWPG2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWPG2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWPG2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWPG2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWPG2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWPG2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWPG2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWPG2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWPG2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWPG2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWPG2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWPG2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWPG2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWPG2] SET  MULTI_USER 
GO
ALTER DATABASE [SWPG2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWPG2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWPG2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWPG2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWPG2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWPG2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWPG2] SET QUERY_STORE = OFF
GO
USE [SWPG2]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jobid] [int] NULL,
	[statusid] [int] NULL,
	[image] [varchar](200) NULL,
	[expired] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[fullname] [varchar](100) NULL,
	[dob] [date] NULL,
	[gender] [bit] NULL,
	[locationid] [int] NULL,
	[phone] [varchar](20) NULL,
	[contact] [varchar](200) NULL,
	[educationid] [int] NULL,
	[school] [varchar](100) NULL,
	[experience] [varchar](500) NULL,
	[image] [varchar](200) NULL,
	[statusid] [int] NULL,
	[jobid] [int] NULL,
	[time] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Education]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Education](
	[id] [int] NOT NULL,
	[name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[type] [int] NULL,
	[amount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[company] [varchar](150) NULL,
	[website] [varchar](200) NULL,
	[address] [varchar](150) NULL,
	[salary] [float] NULL,
	[description] [varchar](500) NULL,
	[requirement] [varchar](500) NULL,
	[time] [date] NULL,
	[email] [varchar](150) NULL,
	[phone] [varchar](50) NULL,
	[image] [varchar](200) NULL,
	[username] [varchar](100) NULL,
	[locationid] [int] NULL,
	[majorid] [int] NULL,
	[jobtypeid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobtype]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobtype](
	[id] [int] NOT NULL,
	[name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[id] [int] NOT NULL,
	[name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[id] [int] NOT NULL,
	[name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] NOT NULL,
	[name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [varchar](100) NOT NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](150) NULL,
	[fullname] [varchar](100) NULL,
	[dob] [date] NULL,
	[gender] [bit] NULL,
	[address] [varchar](200) NULL,
	[phone] [varchar](20) NULL,
	[image] [varchar](200) NULL,
	[roleid] [int] NULL,
	[locationid] [int] NULL,
	[majorid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallet](
	[username] [varchar](100) NULL,
	[balance] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wishlist]    Script Date: 11/9/2021 8:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wishlist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[jobid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([id], [jobid], [statusid], [image], [expired]) VALUES (1, 2, 2, NULL, NULL)
INSERT [dbo].[Banner] ([id], [jobid], [statusid], [image], [expired]) VALUES (2, 3, 2, NULL, NULL)
INSERT [dbo].[Banner] ([id], [jobid], [statusid], [image], [expired]) VALUES (3, 4, 1, NULL, NULL)
INSERT [dbo].[Banner] ([id], [jobid], [statusid], [image], [expired]) VALUES (4, 5, 1, NULL, NULL)
INSERT [dbo].[Banner] ([id], [jobid], [statusid], [image], [expired]) VALUES (5, 6, 1, NULL, NULL)
INSERT [dbo].[Banner] ([id], [jobid], [statusid], [image], [expired]) VALUES (6, 7, 1, NULL, NULL)
INSERT [dbo].[Banner] ([id], [jobid], [statusid], [image], [expired]) VALUES (7, 8, 2, NULL, CAST(N'2021-12-09' AS Date))
INSERT [dbo].[Banner] ([id], [jobid], [statusid], [image], [expired]) VALUES (8, 7, 1, NULL, NULL)
INSERT [dbo].[Banner] ([id], [jobid], [statusid], [image], [expired]) VALUES (9, 2, 1, N'abc', CAST(N'2021-12-09' AS Date))
INSERT [dbo].[Banner] ([id], [jobid], [statusid], [image], [expired]) VALUES (10, 2, 3, N'image/Untitled.png', CAST(N'2021-12-09' AS Date))
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[CV] ON 

INSERT [dbo].[CV] ([id], [username], [fullname], [dob], [gender], [locationid], [phone], [contact], [educationid], [school], [experience], [image], [statusid], [jobid], [time]) VALUES (1, N'kiennt', N'Nguyen Trung Kien', CAST(N'2001-11-02' AS Date), 1, 15, N'0976972241', N'facebook.com', 3, N'FPT University', N'hi', N'./image/Hearthstone Screenshot 10-18-20 00.23.37.png', 1, NULL, CAST(N'2021-10-21' AS Date))
INSERT [dbo].[CV] ([id], [username], [fullname], [dob], [gender], [locationid], [phone], [contact], [educationid], [school], [experience], [image], [statusid], [jobid], [time]) VALUES (2, N'kiennt', N'Nguyen Trung Kien', CAST(N'2001-11-02' AS Date), 1, 15, N'0976972241', N'facebook.com', 3, N'FPT University', N'Hello ', NULL, 2, 7, NULL)
INSERT [dbo].[CV] ([id], [username], [fullname], [dob], [gender], [locationid], [phone], [contact], [educationid], [school], [experience], [image], [statusid], [jobid], [time]) VALUES (3, N'kiennt', N'Nguyen Trung Kien', CAST(N'2001-11-02' AS Date), 1, 15, N'0976972241', N'facebook.com', 3, N'FPT University', N'Hello ', NULL, 1, 7, NULL)
INSERT [dbo].[CV] ([id], [username], [fullname], [dob], [gender], [locationid], [phone], [contact], [educationid], [school], [experience], [image], [statusid], [jobid], [time]) VALUES (1003, N'kiennt', N'Nguyen Trung Kien', CAST(N'2001-11-02' AS Date), 1, 15, N'0976972241', N'facebook.com', 3, N'FPT University', N'Hello ', NULL, 1, 45, NULL)
INSERT [dbo].[CV] ([id], [username], [fullname], [dob], [gender], [locationid], [phone], [contact], [educationid], [school], [experience], [image], [statusid], [jobid], [time]) VALUES (1004, N'kiennt', N'Nguyen Trung Kien', CAST(N'2001-11-02' AS Date), 0, 15, N'0976972241', N'23456789', 1, N'FPT University', N'alqjzckjzkczx', NULL, 1, NULL, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[CV] ([id], [username], [fullname], [dob], [gender], [locationid], [phone], [contact], [educationid], [school], [experience], [image], [statusid], [jobid], [time]) VALUES (1005, N'kiennt', N'Nguyen Trung Kien', CAST(N'2001-11-02' AS Date), 1, 15, N'0976972241', N'facebook.com', 3, N'FPT University', N'Hello ', NULL, 1, 21, NULL)
INSERT [dbo].[CV] ([id], [username], [fullname], [dob], [gender], [locationid], [phone], [contact], [educationid], [school], [experience], [image], [statusid], [jobid], [time]) VALUES (1006, N'kiennt', N'Nguyen Trung Kien', CAST(N'2001-11-02' AS Date), 1, 15, N'0976972241', N'facebook.com', 3, N'FPT University', N'Hello ', NULL, 1, 7, NULL)
INSERT [dbo].[CV] ([id], [username], [fullname], [dob], [gender], [locationid], [phone], [contact], [educationid], [school], [experience], [image], [statusid], [jobid], [time]) VALUES (1007, N'kiennt', N'Nguyen Trung Kien', CAST(N'2001-11-02' AS Date), 1, 15, N'0976972241', N'facebook.com', 3, N'FPT University', N'Hello ', NULL, 1, 7, NULL)
INSERT [dbo].[CV] ([id], [username], [fullname], [dob], [gender], [locationid], [phone], [contact], [educationid], [school], [experience], [image], [statusid], [jobid], [time]) VALUES (1008, N'kiennt', N'Nguyen Trung Kien', CAST(N'2001-11-02' AS Date), 1, 15, N'0976972241', N'facebook.com', 3, N'FPT University', N'Hello ', NULL, 1, 7, NULL)
INSERT [dbo].[CV] ([id], [username], [fullname], [dob], [gender], [locationid], [phone], [contact], [educationid], [school], [experience], [image], [statusid], [jobid], [time]) VALUES (1009, N'kiennt', N'Nguyen Trung Kien', CAST(N'2001-11-02' AS Date), 1, 15, N'0976972241', N'facebook.com', 3, N'FPT University', N'Hello ', NULL, 1, 40, NULL)
INSERT [dbo].[CV] ([id], [username], [fullname], [dob], [gender], [locationid], [phone], [contact], [educationid], [school], [experience], [image], [statusid], [jobid], [time]) VALUES (1010, N'kiennt', N'Nguyen Trung Kien', CAST(N'2001-11-02' AS Date), 0, 1, N'0976972241', N'as', 1, N'FPT University', N'a', NULL, 1, NULL, CAST(N'2021-11-06' AS Date))
SET IDENTITY_INSERT [dbo].[CV] OFF
GO
INSERT [dbo].[Education] ([id], [name]) VALUES (1, N'secondary school')
INSERT [dbo].[Education] ([id], [name]) VALUES (2, N'high school')
INSERT [dbo].[Education] ([id], [name]) VALUES (3, N'university')
INSERT [dbo].[Education] ([id], [name]) VALUES (4, N'others')
GO
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([id], [username], [type], [amount]) VALUES (11, N'hoangosaka', 0, 30)
INSERT [dbo].[History] ([id], [username], [type], [amount]) VALUES (12, N'hoangosaka', 1, 100000)
INSERT [dbo].[History] ([id], [username], [type], [amount]) VALUES (13, N'hoangosaka', 1, 100000)
INSERT [dbo].[History] ([id], [username], [type], [amount]) VALUES (14, N'hoangosaka', 0, 5)
SET IDENTITY_INSERT [dbo].[History] OFF
GO
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (2, N'Python programming', N'ABCD', N'workflow.com', N'Ha Noi', 1200, N'Hi have a good day', N'python knowledge', CAST(N'2021-10-10' AS Date), N'ABC@gmail.com', N'1234567890', N'image', N'MonLeo', 1, 3, 1)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (3, N'C programming', N'DEFG', N'workflow.com', N'Ha Noi', 1400, N'Hi have a good day', N'C knowledge', CAST(N'2021-10-11' AS Date), N'DEFG@gmail.com', N'1234567890', N'image', N'MonLeo', 1, 2, 1)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (4, N'C+ programming', N'EDGD', N'workflow.com', N'Ha Noi', 1600, N'Hi have a good day', N'C+ knowledge', CAST(N'2021-10-12' AS Date), N'EDGD@gmail.com', N'1234567890', N'image', N'Satthuxx', 1, 4, 2)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (5, N'Seller', N'AERT', N'workflow.com', N'Ha Noi', 1800, N'Hi have a good day', N'Knowledge about market', CAST(N'2021-10-13' AS Date), N'AERT@gmail.com', N'1234567890', N'image', N'Satthuxx', 1, 2, 4)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (6, N'Developer Java', N'TNHH Youmed', N'website', N'Ha Noi', 1000, N'Software Development', N'love and join Software Development', CAST(N'2021-10-12' AS Date), N'a@gmail.fpt.vn', N'10987654321', N'image', N'Satthuxx', 51, 7, 1)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (7, N'Developer C#', N'TNHH VINBRAIN', N'website', N'Ha Noi', 1500, N'Software Development', N'love and join Software Development', CAST(N'2021-10-12' AS Date), N'monleo@gmail.com', N'123456890', N'image', N'MonLeo', 15, 6, 2)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (8, N'Developer Python', N'TNHH VINCOM', N'website', N'Ho Chi Minh', 500, N'Software Development', N'love and join Software Development', CAST(N'2021-10-12' AS Date), N'quangnv@fpt.edu.vn', N'0348530999', N'image', N'quangnv', 51, 4, 3)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (9, N'Developer Javascript', N'FPT SOFTWARE', N'website', N'Ho Chi Minh', 500, N'Software Development', N'love and join Software Development', CAST(N'2021-10-12' AS Date), N'quangnv@fpt.edu.vn', N'0348530997', N'image', N'hoangosaka', 15, 14, 4)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (15, N'Front-end ', N'ABCD', N'workflow.com', N'Ha Noi', 1000, N'Good with frontend development and maintain graphic standards and branding throughout the product’s interface', N'love and Fornt End Development', CAST(N'2021-10-10' AS Date), N'ABC@gmail.com', N'1234567890', N'image', N'MonLeo', 1, 3, 1)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (16, N'Network Administrator', N'ABCD', N'workflow.com', N'Ha Noi', 500, N'Building and deploying website systems and online solutions.', N'Proficient in one of the popular client frameworks such as Angular, Reactjs, Vuejs… ', CAST(N'2021-10-10' AS Date), N'ABC@gmail.com', N'1234567890', N'image', N'MonLeo', 1, 3, 1)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (17, N'Back-end', N'ABCD', N'workflow.com', N'Ha Noi', 1300, N'Installs or removes hardware and/or software, and associated connections, using supplied
installation instructions and tools.', N' Knowledge of Cisco IOS software upgrades/patch management best practices in an
Enterprise Cisco environment.', CAST(N'2021-10-10' AS Date), N'ABC@gmail.com', N'1234567890', N'image', N'MonLeo', 1, 3, 1)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (18, N'MVC .Net C# ', N'ABCD', N'workflow.com', N'Ha Noi', 600, N'Research, provide solutions and participate in the product development process. ', N'Proficient in .NET framework/.NET core, preferably with knowledge of Entity Framework, Identity, SignalR ', CAST(N'2021-10-10' AS Date), N'ABC@gmail.com', N'1234567890', N'image', N'MonLeo', 1, 3, 1)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (19, N'Application Developer/ Programmer', N'ABCD', N'workflow.com', N'Ha Noi', 2500, N'Building and deploying website systems and online solutions. ', N'Knowledge of mobile application programming using one of the frameworks such as: Flutter/React Native/Xamarin... is an advantage ', CAST(N'2021-10-10' AS Date), N'ABC@gmail.com', N'1234567890', N'image', N'MonLeo', 1, 3, 1)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (20, N'Application Quality Tester', N'FPT SOFTWARE', N'website', N'Ho Chi Minh', 800, N'Collaborate and work closely with Data Analyst to get the job done and achieve high performance in data usage. ', N'xperience with data pipeline design and data flow management tools: Airflow, Kafka, etc. is a plus', CAST(N'2021-10-10' AS Date), N'quangnv@fpt.edu.vn', N'0348530999', N'image', N'hoangosaka', 15, 14, 4)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (21, N'Database Developer', N'FPT SOFTWARE', N'website', N'Ho Chi Minh', 1000, N'Proficient in relational databases (Relational SQL) and NoSQL: MySQL, MongoDB, PostgreSQL. Knowledge of Google BigQuery is a plus. ', N'Collaborate and work closely with Data Analyst to get the job done and achieve high performance in data usage. ', CAST(N'2021-10-10' AS Date), N'quangnv@fpt.edu.vn', N'0348530999', N'image', N'hoangosaka', 15, 14, 4)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (22, N'Database Administrator', N'FPT SOFTWARE', N'website', N'Ho Chi Minh', 2500, N'Proficient in relational databases (Relational SQL) and NoSQL: MySQL, MongoDB, PostgreSQL. Knowledge of Google BigQuery is a plus. ', N'Collaborate and work closely with Data Analyst to get the job done and achieve high performance in data usage. ', CAST(N'2021-10-10' AS Date), N'quangnv@fpt.edu.vn', N'0348530999', N'image', N'hoangosaka', 15, 14, 4)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (23, N'IT Security Staff', N'FPT SOFTWARE', N'website', N'Ho Chi Minh', 2100, N'Regular research; update new security solutions, technologies and newsletters. Analyze, suggest prevention, prevent or warn in time', N'Proactively assess the possibilities of risks and vulnerabilities in networks, systems, software, and mobile apps. ', CAST(N'2021-10-10' AS Date), N'quangnv@fpt.edu.vn', N'0348530999', N'image', N'hoangosaka', 15, 14, 4)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (24, N'Helpdesk Technician', N'FPT SOFTWARE', N'website', N'Ho Chi Minh', 1800, N'Regular research; update new security solutions, technologies and newsletters. Analyze, suggest prevention, prevent or warn in time', N'Proactively assess the possibilities of risks and vulnerabilities in networks, systems, software, and mobile apps. ', CAST(N'2021-10-10' AS Date), N'quangnv@fpt.edu.vn', N'0348530999', N'image', N'hoangosaka', 15, 14, 4)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (30, N'Chief Technical Officer (CTO)', N'TNHH Youmed', N'website', N'Ha Noi', 2300, N'Software Development', N' University graduated, major in IT, Computer, Engineering or related', CAST(N'2021-10-10' AS Date), N'a@gmail.fpt.vn', N'10987654321', N'image', N'Satthuxx', 51, 7, 3)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (31, N'Project Manager', N'TNHH Youmed', N'website', N'Ha Noi', 500, N'Software Development', N' University graduated, major in IT, Computer, Engineering or related', CAST(N'2021-10-10' AS Date), N'a@gmail.fpt.vn', N'10987654321', N'image', N'Satthuxx', 51, 7, 3)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (32, N'Full Stack JS', N'TNHH Youmed', N'website', N'Ha Noi', 1500, N'Software Development', N' University graduated, major in IT, Computer, Engineering or related', CAST(N'2021-10-10' AS Date), N'a@gmail.fpt.vn', N'10987654321', N'image', N'Satthuxx', 51, 7, 3)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (33, N'Android', N'TNHH Youmed', N'website', N'Ha Noi', 2500, N'Software Development', N' University graduated, major in IT, Computer, Engineering or related', CAST(N'2021-10-10' AS Date), N'a@gmail.fpt.vn', N'10987654321', N'image', N'Satthuxx', 51, 7, 4)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (34, N'Game (Javscript, C#)', N'TNHH Youmed', N'website', N'Ha Noi', 3500, N'Software Development', N' University graduated, major in IT, Computer, Engineering or related', CAST(N'2021-10-10' AS Date), N'a@gmail.fpt.vn', N'10987654321', N'image', N'Satthuxx', 51, 7, 3)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (37, N'IOS', N'TNHH VINCOM', N'website', N'Ho Chi Minh', 1000, N'Software Development', N' University graduated, major in IT, Computer, Engineering or related', CAST(N'2021-10-10' AS Date), N'quangnv@fpt.edu.vn', N'0348530999', N'image', N'quangnv', 51, 4, 3)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (38, N'Windows', N'TNHH VINCOM', N'website', N'Ho Chi Minh', 1200, N'Software Development', N' University graduated, major in IT, Computer, Engineering or related', CAST(N'2021-10-10' AS Date), N'quangnv@fpt.edu.vn', N'0348530999', N'image', N'quangnv', 51, 4, 3)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (39, N'PHP', N'TNHH VINCOM', N'website', N'Ho Chi Minh', 3000, N'Software Development', N' University graduated, major in IT, Computer, Engineering or related', CAST(N'2021-10-10' AS Date), N'quangnv@fpt.edu.vn', N'0348530999', N'image', N'quangnv', 51, 4, 3)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (40, N'AI', N'TNHH VINBRAIN', N'website', N'Ha Noi', 1200, N'Building and deploying website systems and online solutions. ', N'Proficient in one of the popular client frameworks such as Angular, Reactjs, Vuejs… ', CAST(N'2021-10-10' AS Date), N'monleo@gmail.com', N'123456890', N'image', N'MonLeo', 15, 6, 2)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (41, N'Application Quality Tester', N'TNHH VINBRAIN', N'website', N'Ha Noi', 1000, N'Building and deploying website systems and online solutions. ', N'Knowledge of mobile application programming using one of the frameworks such as: Flutter/React Native/Xamarin... is an advantage ', CAST(N'2021-10-10' AS Date), N'monleo@gmail.com', N'123456890', N'image', N'MonLeo', 15, 6, 2)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (42, N'IT Manager/ IT Director', N'TNHH VINBRAIN', N'website', N'Ha Noi', 2500, N'Good manager SoftWare', N'Love job and take care team, University graduated, major in IT, Computer, Engineering or related', CAST(N'2021-10-10' AS Date), N'monleo@gmail.com', N'123456890', N'image', N'MonLeo', 15, 6, 3)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (43, N'IT Security Staff', N'TNHH VINBRAIN', N'website', N'Ha Noi', 500, N'Regular research; update new security solutions, technologies and newsletters. Analyze, suggest prevention, prevent or warn in time', N'Proactively assess the possibilities of risks and vulnerabilities in networks, systems, software, and mobile apps. ', CAST(N'2021-10-10' AS Date), N'monleo@gmail.com', N'123456890', N'image', N'MonLeo', 15, 6, 3)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (44, N'Python ', N'ABC', N'abc.xyz', N'Ha Noi', 1200, N'welcome to company', N'1 year with python ', CAST(N'2021-10-27' AS Date), N'monleo@fpt.edu.vn', N'12345678', NULL, N'MonLeo', 15, 2, 1)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (45, N'q', N'q', N'q', N'q', 1222, N'q', N'q', CAST(N'2021-11-04' AS Date), N'monleo@fpt.edu.vn', N'1234567890', NULL, N'MonLeo', 15, 1, 4)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (46, N'William Peterson', N'Lá»?c', N'a', N'Sá»? nhÃ  43 Ä?Æ°á»ng Cáº§u Vá»?ng Quáº­n Báº¯c Tá»« LiÃªm HÃ  Ná»?i', 1222, N'a', N'a', CAST(N'2021-11-05' AS Date), N'socmummim220401@gmail.com', N'0815647388', N'./uploads/005540.jpg', N'MonLeo', 20, 13, 1)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (47, N'Nguen Loc', N'Lá»?c', N'a', N'Sá»? nhÃ  43 Ä?Æ°á»ng Cáº§u Vá»?ng Quáº­n Báº¯c Tá»« LiÃªm HÃ  Ná»?i', 1222, N'a', N'a', CAST(N'2021-11-06' AS Date), N'socmummim220401@gmail.com', N'0815647388', N'./uploads/005540.jpg', N'MonLeo', 19, 13, 2)
INSERT [dbo].[Job] ([id], [name], [company], [website], [address], [salary], [description], [requirement], [time], [email], [phone], [image], [username], [locationid], [majorid], [jobtypeid]) VALUES (49, N'William Peterson', N'Lá»?c', N'e', N'Sá»? nhÃ  43 Ä?Æ°á»ng Cáº§u Vá»?ng Quáº­n Báº¯c Tá»« LiÃªm HÃ  Ná»?i', 1222, N'q', N'q', CAST(N'2021-11-09' AS Date), N'socmummim220401@gmail.com', N'0815647388', N'image/hoangosaka_job_img.png', N'hoangosaka', 19, 13, 1)
SET IDENTITY_INSERT [dbo].[Job] OFF
GO
INSERT [dbo].[Jobtype] ([id], [name]) VALUES (1, N'Part-time')
INSERT [dbo].[Jobtype] ([id], [name]) VALUES (2, N'Full-time')
INSERT [dbo].[Jobtype] ([id], [name]) VALUES (3, N'Remote')
INSERT [dbo].[Jobtype] ([id], [name]) VALUES (4, N'Intern')
GO
INSERT [dbo].[Location] ([id], [name]) VALUES (1, N'Ha Giang')
INSERT [dbo].[Location] ([id], [name]) VALUES (2, N'Cao Bang')
INSERT [dbo].[Location] ([id], [name]) VALUES (3, N'Bac Kan')
INSERT [dbo].[Location] ([id], [name]) VALUES (4, N'Tuyen Quang')
INSERT [dbo].[Location] ([id], [name]) VALUES (5, N'Lao Cai')
INSERT [dbo].[Location] ([id], [name]) VALUES (6, N'Yen Bai')
INSERT [dbo].[Location] ([id], [name]) VALUES (7, N'Thai Nguyen')
INSERT [dbo].[Location] ([id], [name]) VALUES (8, N'Lang Son')
INSERT [dbo].[Location] ([id], [name]) VALUES (9, N'Bac Giang')
INSERT [dbo].[Location] ([id], [name]) VALUES (10, N'Phu Tho')
INSERT [dbo].[Location] ([id], [name]) VALUES (11, N'Dien Bien')
INSERT [dbo].[Location] ([id], [name]) VALUES (12, N'Lai Chau')
INSERT [dbo].[Location] ([id], [name]) VALUES (13, N'Son La')
INSERT [dbo].[Location] ([id], [name]) VALUES (14, N'Hoa Binh')
INSERT [dbo].[Location] ([id], [name]) VALUES (15, N'Ha Noi')
INSERT [dbo].[Location] ([id], [name]) VALUES (16, N'Vinh Phuc')
INSERT [dbo].[Location] ([id], [name]) VALUES (17, N'Bac Ninh')
INSERT [dbo].[Location] ([id], [name]) VALUES (18, N'Quang Ninh')
INSERT [dbo].[Location] ([id], [name]) VALUES (19, N'Hai Duong')
INSERT [dbo].[Location] ([id], [name]) VALUES (20, N'Hai Phong')
INSERT [dbo].[Location] ([id], [name]) VALUES (21, N'Hung Yen')
INSERT [dbo].[Location] ([id], [name]) VALUES (22, N'Thai Binh')
INSERT [dbo].[Location] ([id], [name]) VALUES (23, N'Ha Nam')
INSERT [dbo].[Location] ([id], [name]) VALUES (24, N'Nam Dinh')
INSERT [dbo].[Location] ([id], [name]) VALUES (25, N'Ninh Binh')
INSERT [dbo].[Location] ([id], [name]) VALUES (26, N'Thanh Hoa')
INSERT [dbo].[Location] ([id], [name]) VALUES (27, N'Nghe An')
INSERT [dbo].[Location] ([id], [name]) VALUES (28, N'Ha Tinh')
INSERT [dbo].[Location] ([id], [name]) VALUES (29, N'Quang Binh')
INSERT [dbo].[Location] ([id], [name]) VALUES (30, N'Quang Tri')
INSERT [dbo].[Location] ([id], [name]) VALUES (31, N'Thua Thien Heu')
INSERT [dbo].[Location] ([id], [name]) VALUES (32, N'Ða Nang')
INSERT [dbo].[Location] ([id], [name]) VALUES (33, N'Quang Nam')
INSERT [dbo].[Location] ([id], [name]) VALUES (34, N'Quang Ngai')
INSERT [dbo].[Location] ([id], [name]) VALUES (35, N'Binh Ðinh')
INSERT [dbo].[Location] ([id], [name]) VALUES (36, N'Phu Yen')
INSERT [dbo].[Location] ([id], [name]) VALUES (37, N'Khanh Hoa')
INSERT [dbo].[Location] ([id], [name]) VALUES (38, N'Ninh Thuan')
INSERT [dbo].[Location] ([id], [name]) VALUES (39, N'Binh Thuan')
INSERT [dbo].[Location] ([id], [name]) VALUES (40, N'Tay Nguyen')
INSERT [dbo].[Location] ([id], [name]) VALUES (41, N'Kon Tum')
INSERT [dbo].[Location] ([id], [name]) VALUES (42, N'Gia Lai')
INSERT [dbo].[Location] ([id], [name]) VALUES (43, N'Dak Lak')
INSERT [dbo].[Location] ([id], [name]) VALUES (44, N'Dak Nong')
INSERT [dbo].[Location] ([id], [name]) VALUES (45, N'Lam Ðong')
INSERT [dbo].[Location] ([id], [name]) VALUES (46, N'Binh Phuoc')
INSERT [dbo].[Location] ([id], [name]) VALUES (47, N'Tay Ninh')
INSERT [dbo].[Location] ([id], [name]) VALUES (48, N'Binh Duong')
INSERT [dbo].[Location] ([id], [name]) VALUES (49, N'Dong Nai')
INSERT [dbo].[Location] ([id], [name]) VALUES (50, N'Ba Ria - Vung Tau')
INSERT [dbo].[Location] ([id], [name]) VALUES (51, N'TP.Ho Chi Minh')
INSERT [dbo].[Location] ([id], [name]) VALUES (52, N'Long An')
INSERT [dbo].[Location] ([id], [name]) VALUES (53, N'Tien Giang')
INSERT [dbo].[Location] ([id], [name]) VALUES (54, N'Ben Tre')
INSERT [dbo].[Location] ([id], [name]) VALUES (55, N'Tra Vinh')
INSERT [dbo].[Location] ([id], [name]) VALUES (56, N'Vinh Long')
INSERT [dbo].[Location] ([id], [name]) VALUES (57, N'Ðong Thap')
INSERT [dbo].[Location] ([id], [name]) VALUES (58, N'An Giang')
INSERT [dbo].[Location] ([id], [name]) VALUES (59, N'Kien Giang')
INSERT [dbo].[Location] ([id], [name]) VALUES (60, N'Can Tho')
INSERT [dbo].[Location] ([id], [name]) VALUES (61, N'Hau Giang')
INSERT [dbo].[Location] ([id], [name]) VALUES (62, N'Bac Lieu')
INSERT [dbo].[Location] ([id], [name]) VALUES (63, N'Ca Mau')
GO
INSERT [dbo].[Major] ([id], [name]) VALUES (1, N'Biology')
INSERT [dbo].[Major] ([id], [name]) VALUES (2, N'Business')
INSERT [dbo].[Major] ([id], [name]) VALUES (3, N'Communications')
INSERT [dbo].[Major] ([id], [name]) VALUES (4, N'Computer science')
INSERT [dbo].[Major] ([id], [name]) VALUES (5, N'Criminal justice')
INSERT [dbo].[Major] ([id], [name]) VALUES (6, N'Economics')
INSERT [dbo].[Major] ([id], [name]) VALUES (7, N'Engineering')
INSERT [dbo].[Major] ([id], [name]) VALUES (8, N'English')
INSERT [dbo].[Major] ([id], [name]) VALUES (9, N'History')
INSERT [dbo].[Major] ([id], [name]) VALUES (10, N'Mathematics')
INSERT [dbo].[Major] ([id], [name]) VALUES (11, N'Political science')
INSERT [dbo].[Major] ([id], [name]) VALUES (12, N'Psychology')
INSERT [dbo].[Major] ([id], [name]) VALUES (13, N'Sociology')
INSERT [dbo].[Major] ([id], [name]) VALUES (14, N'Visual and performing arts')
GO
INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'employer')
INSERT [dbo].[Role] ([id], [name]) VALUES (3, N'employee')
GO
INSERT [dbo].[Salary] ([id], [name]) VALUES (1, N'Less than 500')
INSERT [dbo].[Salary] ([id], [name]) VALUES (2, N'500-1000')
INSERT [dbo].[Salary] ([id], [name]) VALUES (3, N'1000-1500')
INSERT [dbo].[Salary] ([id], [name]) VALUES (4, N'More than 1500')
GO
INSERT [dbo].[Status] ([id], [name]) VALUES (1, N'pending')
INSERT [dbo].[Status] ([id], [name]) VALUES (2, N'approved')
INSERT [dbo].[Status] ([id], [name]) VALUES (3, N'declined')
GO
INSERT [dbo].[User] ([username], [password], [email], [fullname], [dob], [gender], [address], [phone], [image], [roleid], [locationid], [majorid]) VALUES (N'admin', N'1234', N'admin@gmail.com', N'Nguyen Tien Loc', CAST(N'1900-01-01' AS Date), 1, N'Ha Noi', N'0815647388', N'', 1, 15, 2)
INSERT [dbo].[User] ([username], [password], [email], [fullname], [dob], [gender], [address], [phone], [image], [roleid], [locationid], [majorid]) VALUES (N'hoangosaka', N'1234', N'hoangnv@fpt.edu.vn', N'Nguyen Van Hoang', CAST(N'1995-02-22' AS Date), 1, N'Ha Noi', N'0348530997', N'image', 2, 12, 8)
INSERT [dbo].[User] ([username], [password], [email], [fullname], [dob], [gender], [address], [phone], [image], [roleid], [locationid], [majorid]) VALUES (N'kiennt', N'1234', N'kiennt@fpt.edu.vn', N'Nguyen Trung Kien', CAST(N'2001-11-02' AS Date), 1, N'Ha Noi', N'0976972241', N'image', 3, 15, 6)
INSERT [dbo].[User] ([username], [password], [email], [fullname], [dob], [gender], [address], [phone], [image], [roleid], [locationid], [majorid]) VALUES (N'MonLeo', N'1234', N'monleo@gmail.com', N'Nguyen Thi Mon Leo', CAST(N'2001-10-01' AS Date), 0, N'Ha Noi', N'1234568902', N'image', 2, 1, 2)
INSERT [dbo].[User] ([username], [password], [email], [fullname], [dob], [gender], [address], [phone], [image], [roleid], [locationid], [majorid]) VALUES (N'quangnv', N'1234', N'quangnv@fpt.edu.vn', N'Nguyen Van Quang', CAST(N'1999-02-22' AS Date), 0, N'Ha Noi', N'0348530999', N'image', 2, 13, 8)
INSERT [dbo].[User] ([username], [password], [email], [fullname], [dob], [gender], [address], [phone], [image], [roleid], [locationid], [majorid]) VALUES (N'Satthuxx', N'1234', N'a@gmail.fpt.vn', N'Nguyen Xuan A', CAST(N'2000-04-05' AS Date), 1, N'Ha Noi', N'0987654321', N'image', 2, 12, 10)
GO
INSERT [dbo].[Wallet] ([username], [balance]) VALUES (N'hoangosaka', 200055)
GO
SET IDENTITY_INSERT [dbo].[wishlist] ON 

INSERT [dbo].[wishlist] ([id], [username], [jobid]) VALUES (1, N'kiennt', 7)
SET IDENTITY_INSERT [dbo].[wishlist] OFF
GO
ALTER TABLE [dbo].[Banner]  WITH CHECK ADD FOREIGN KEY([jobid])
REFERENCES [dbo].[Job] ([id])
GO
ALTER TABLE [dbo].[Banner]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD FOREIGN KEY([educationid])
REFERENCES [dbo].[Education] ([id])
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD FOREIGN KEY([jobid])
REFERENCES [dbo].[Job] ([id])
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD FOREIGN KEY([locationid])
REFERENCES [dbo].[Location] ([id])
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD FOREIGN KEY([jobtypeid])
REFERENCES [dbo].[Jobtype] ([id])
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD FOREIGN KEY([locationid])
REFERENCES [dbo].[Location] ([id])
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD FOREIGN KEY([majorid])
REFERENCES [dbo].[Major] ([id])
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([locationid])
REFERENCES [dbo].[Location] ([id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([majorid])
REFERENCES [dbo].[Major] ([id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Wallet]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[wishlist]  WITH CHECK ADD FOREIGN KEY([jobid])
REFERENCES [dbo].[Job] ([id])
GO
ALTER TABLE [dbo].[wishlist]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
USE [master]
GO
ALTER DATABASE [SWPG2] SET  READ_WRITE 
GO
