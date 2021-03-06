USE [master]
GO
/****** Object:  Database [SchoolManagement]    Script Date: 31-03-2020 00:28:18 ******/
CREATE DATABASE [SchoolManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SchoolManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SchoolManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SchoolManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SchoolManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [SchoolManagement] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SchoolManagement', N'ON'
GO
ALTER DATABASE [SchoolManagement] SET QUERY_STORE = OFF
GO
USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[EnquiryDetails]    Script Date: 31-03-2020 00:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryDetails](
	[EnquiryId] [int] IDENTITY(1,1) NOT NULL,
	[EnquiryDetails] [varchar](max) NOT NULL,
	[ParentId] [int] NOT NULL,
 CONSTRAINT [PK_EnquiryDetails] PRIMARY KEY CLUSTERED 
(
	[EnquiryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeesDetails]    Script Date: 31-03-2020 00:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeesDetails](
	[FeesId] [int] IDENTITY(1,1) NOT NULL,
	[FeesPaid] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[StdId] [int] NOT NULL,
 CONSTRAINT [PK_FeesDetails] PRIMARY KEY CLUSTERED 
(
	[FeesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParentDetails]    Script Date: 31-03-2020 00:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParentDetails](
	[ParentId] [int] IDENTITY(1,1) NOT NULL,
	[ParentName] [varchar](50) NOT NULL,
	[ParentEmail] [varchar](50) NOT NULL,
	[ParentMobileNumber] [int] NOT NULL,
	[ParentPassword] [varchar](50) NOT NULL,
	[ParentAddress] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ParentDetails] PRIMARY KEY CLUSTERED 
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StdDetails]    Script Date: 31-03-2020 00:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StdDetails](
	[StdId] [int] IDENTITY(1,1) NOT NULL,
	[Std] [varchar](50) NOT NULL,
	[Fees] [int] NOT NULL,
 CONSTRAINT [PK_StdDetails] PRIMARY KEY CLUSTERED 
(
	[StdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentDetails]    Script Date: 31-03-2020 00:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentDetails](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
	[ParentId] [int] NOT NULL,
	[StdId] [int] NOT NULL,
 CONSTRAINT [PK_StudentDetails] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EnquiryDetails]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryDetails_ParentDetails] FOREIGN KEY([ParentId])
REFERENCES [dbo].[ParentDetails] ([ParentId])
GO
ALTER TABLE [dbo].[EnquiryDetails] CHECK CONSTRAINT [FK_EnquiryDetails_ParentDetails]
GO
ALTER TABLE [dbo].[FeesDetails]  WITH CHECK ADD  CONSTRAINT [FK_FeesDetails_StdDetails] FOREIGN KEY([StdId])
REFERENCES [dbo].[StdDetails] ([StdId])
GO
ALTER TABLE [dbo].[FeesDetails] CHECK CONSTRAINT [FK_FeesDetails_StdDetails]
GO
ALTER TABLE [dbo].[FeesDetails]  WITH CHECK ADD  CONSTRAINT [FK_FeesDetails_StudentDetails] FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentDetails] ([StudentId])
GO
ALTER TABLE [dbo].[FeesDetails] CHECK CONSTRAINT [FK_FeesDetails_StudentDetails]
GO
ALTER TABLE [dbo].[StudentDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentDetails_ParentDetails] FOREIGN KEY([ParentId])
REFERENCES [dbo].[ParentDetails] ([ParentId])
GO
ALTER TABLE [dbo].[StudentDetails] CHECK CONSTRAINT [FK_StudentDetails_ParentDetails]
GO
ALTER TABLE [dbo].[StudentDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentDetails_StdDetails] FOREIGN KEY([StdId])
REFERENCES [dbo].[StdDetails] ([StdId])
GO
ALTER TABLE [dbo].[StudentDetails] CHECK CONSTRAINT [FK_StudentDetails_StdDetails]
GO
USE [master]
GO
ALTER DATABASE [SchoolManagement] SET  READ_WRITE 
GO
