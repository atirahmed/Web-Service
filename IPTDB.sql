USE [master]
GO
/****** Object:  Database [IPTDB]    Script Date: 4/23/2018 7:47:40 PM ******/
CREATE DATABASE [IPTDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IPTDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\IPTDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IPTDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\IPTDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IPTDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IPTDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IPTDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IPTDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IPTDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IPTDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IPTDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IPTDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IPTDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [IPTDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IPTDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IPTDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IPTDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IPTDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IPTDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IPTDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IPTDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IPTDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IPTDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IPTDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IPTDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IPTDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IPTDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IPTDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IPTDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IPTDB] SET RECOVERY FULL 
GO
ALTER DATABASE [IPTDB] SET  MULTI_USER 
GO
ALTER DATABASE [IPTDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IPTDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IPTDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IPTDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IPTDB', N'ON'
GO
USE [IPTDB]
GO
/****** Object:  Table [dbo].[Assesments]    Script Date: 4/23/2018 7:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assesments](
	[Assesment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Assesment_Type] [nchar](10) NOT NULL,
	[Assesment_Date] [date] NOT NULL,
 CONSTRAINT [PK_Assesments] PRIMARY KEY CLUSTERED 
(
	[Assesment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grades]    Script Date: 4/23/2018 7:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[Grade_Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [nchar](10) NOT NULL,
	[Assesment_Id] [int] NOT NULL,
	[Marks] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED 
(
	[Grade_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 4/23/2018 7:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Student_Id] [nchar](10) NOT NULL,
	[First_Name] [nchar](10) NOT NULL,
	[Last_Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Student_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Assesments] FOREIGN KEY([Assesment_Id])
REFERENCES [dbo].[Assesments] ([Assesment_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Grades_Assesments]
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Students] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Students] ([Student_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Grades_Students]
GO
USE [master]
GO
ALTER DATABASE [IPTDB] SET  READ_WRITE 
GO
