USE [master]
GO
/****** Object:  Database [hospital]    Script Date: 28/05/2024 12:41:15 SA ******/
CREATE DATABASE [hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SA\MSSQL\DATA\hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SA\MSSQL\DATA\hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [hospital] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hospital] SET RECOVERY FULL 
GO
ALTER DATABASE [hospital] SET  MULTI_USER 
GO
ALTER DATABASE [hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'hospital', N'ON'
GO
ALTER DATABASE [hospital] SET QUERY_STORE = ON
GO
ALTER DATABASE [hospital] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [hospital]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 28/05/2024 12:41:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[full_name] [nvarchar](100) NULL,
	[image] [nvarchar](500) NULL,
	[gender] [nvarchar](50) NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appointment]    Script Date: 28/05/2024 12:41:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment](
	[appointment_id] [nvarchar](45) NOT NULL,
	[patient_id] [bigint] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[gender] [nvarchar](10) NULL,
	[description] [nvarchar](500) NULL,
	[diagnosis] [nvarchar](500) NULL,
	[treatment] [nvarchar](500) NULL,
	[mobile_number] [bigint] NULL,
	[address] [nvarchar](200) NULL,
	[date] [datetime] NOT NULL,
	[date_modify] [datetime] NULL,
	[date_delete] [datetime] NULL,
	[schedule] [datetime] NULL,
	[total_pay] [decimal](10, 2) NULL,
	[payment_status] [nvarchar](50) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appointment_detail]    Script Date: 28/05/2024 12:41:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment_detail](
	[appointment_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[appointment_id] [nvarchar](50) NOT NULL,
	[service_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[payment_status] [nvarchar](50) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[description] [nvarchar](200) NULL,
	[diagnosis] [nvarchar](200) NULL,
	[treatment] [nvarchar](200) NULL,
	[re_examination_date] [datetime] NULL,
	[doctor] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[appointment_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctor]    Script Date: 28/05/2024 12:41:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[doctor_id] [nvarchar](45) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[gender] [nvarchar](100) NULL,
	[mobile_number] [bigint] NULL,
	[specialized] [nvarchar](100) NULL,
	[address] [nvarchar](200) NULL,
	[date_created] [date] NULL,
	[date] [date] NOT NULL,
	[modify_date] [date] NULL,
	[delete_date] [date] NULL,
	[status] [nvarchar](50) NOT NULL,
	[image] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient]    Script Date: 28/05/2024 12:41:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [bigint] NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[full_name] [nvarchar](100) NULL,
	[mobile_number] [bigint] NULL,
	[address] [nvarchar](200) NULL,
	[description] [nvarchar](200) NULL,
	[diagnosis] [nvarchar](200) NULL,
	[treatment] [nvarchar](200) NULL,
	[date] [date] NOT NULL,
	[date_modify] [date] NULL,
	[date_delete] [date] NULL,
	[status] [nvarchar](100) NOT NULL,
	[gender] [nvarchar](50) NULL,
	[patients_EmergencyNumber] [bigint] NULL,
	[patients_ccid] [nvarchar](100) NULL,
	[patients_bloodGroup] [nvarchar](10) NULL,
	[patients_insurance] [nvarchar](100) NULL,
	[note] [nvarchar](500) NULL,
	[date_created] [date] NULL,
	[image] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 28/05/2024 12:41:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[doctor] [nvarchar](250) NULL,
	[patient_name] [nvarchar](100) NULL,
	[gender] [nvarchar](50) NULL,
	[services] [nvarchar](200) NULL,
	[total_days] [int] NULL,
	[total_price] [decimal](18, 2) NULL,
	[date] [datetime] NULL,
	[date_checkout] [datetime] NULL,
	[status_pay] [nvarchar](100) NULL,
	[date_pay] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[services]    Script Date: 28/05/2024 12:41:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[services](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](45) NOT NULL,
	[description] [nvarchar](200) NULL,
	[price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([admin_id], [email], [username], [password], [full_name], [image], [gender], [date]) VALUES (1, N'admin@example.com', N'admin', N'123123', N'Admin User', N'D:\Aptech\HK2\Project\code\HospitalManagementSystem\src\Admin_Directory\2.jpg', N'Male', CAST(N'2024-05-02' AS Date))
INSERT [dbo].[admin] ([admin_id], [email], [username], [password], [full_name], [image], [gender], [date]) VALUES (2, N'hoang@gmail.com', N'hoang', N'123123', NULL, N'D:\Aptech\HK2\Project\code\HospitalManagementSystem\src\Admin_Directory\2.jpg', N'Male', CAST(N'2024-05-06' AS Date))
INSERT [dbo].[admin] ([admin_id], [email], [username], [password], [full_name], [image], [gender], [date]) VALUES (3, N'hoang@gmail.com', N'hoang123', N'12341234', NULL, NULL, NULL, CAST(N'2024-05-14' AS Date))
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
INSERT [dbo].[appointment] ([appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [schedule], [total_pay], [payment_status], [quantity]) VALUES (N'AID-6', 1001, N'John Doe', N'Male', N'12341234', N'1234', N'1234', 12341234, N'aaaaaaaa', CAST(N'2024-05-28T00:00:00.000' AS DateTime), CAST(N'2024-05-28T00:00:00.000' AS DateTime), NULL, CAST(N'2024-05-01T00:00:00.000' AS DateTime), CAST(0.00 AS Decimal(10, 2)), N'Pending', 0)
INSERT [dbo].[appointment] ([appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [schedule], [total_pay], [payment_status], [quantity]) VALUES (N'AID-7', 1001, N'John Doe', N'Male', N'sđầ', N'ádf', N'ádf', 123123, N'123123', CAST(N'2024-05-28T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2024-05-28T00:00:00.000' AS DateTime), CAST(0.00 AS Decimal(10, 2)), N'Pending', 0)
INSERT [dbo].[appointment] ([appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [schedule], [total_pay], [payment_status], [quantity]) VALUES (N'APPT001', 1001, N'John Doe', N'Male', N'General check-up', N'Flu symptoms', N'Rest and hydration', 1234567890, N'123 Main St', CAST(N'2024-05-01T10:00:00.000' AS DateTime), NULL, NULL, CAST(N'2024-05-01T10:00:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)), N'Pending', 1)
INSERT [dbo].[appointment] ([appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [schedule], [total_pay], [payment_status], [quantity]) VALUES (N'APPT002', 1002, N'Jane Smith', N'Female', N'Follow-up visit', N'Mild improvement', N'Continue medication', 2345678901, N'456 Elm St', CAST(N'2024-05-02T11:00:00.000' AS DateTime), NULL, NULL, CAST(N'2024-05-02T11:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)), N'Completed', 1)
INSERT [dbo].[appointment] ([appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [schedule], [total_pay], [payment_status], [quantity]) VALUES (N'APPT003', 1003, N'Bob Johnson', N'Male', N'Routine check-up', NULL, NULL, 3456789012, N'789 Oak St', CAST(N'2024-05-03T09:30:00.000' AS DateTime), NULL, NULL, CAST(N'2024-05-03T09:30:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)), N'Pending', 1)
INSERT [dbo].[appointment] ([appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [schedule], [total_pay], [payment_status], [quantity]) VALUES (N'APPT004', 1004, N'Alice Brown', N'Female', N'Dental cleaning', N'Plaque buildup', N'Scaling', 4567890123, N'321 Pine St', CAST(N'2024-05-04T14:00:00.000' AS DateTime), NULL, NULL, CAST(N'2024-05-04T14:00:00.000' AS DateTime), CAST(250.00 AS Decimal(10, 2)), N'Pending', 1)
INSERT [dbo].[appointment] ([appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [schedule], [total_pay], [payment_status], [quantity]) VALUES (N'APPT005', 1005, N'Chris White', N'Male', N'Vaccination', N'Routine', N'None', 5678901234, N'654 Cedar St', CAST(N'2024-05-05T15:00:00.000' AS DateTime), NULL, NULL, CAST(N'2024-05-05T15:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), N'Completed', 1)
GO
SET IDENTITY_INSERT [dbo].[appointment_detail] ON 

INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (1, N'APPT001', 1, CAST(N'2024-05-01T10:00:00.000' AS DateTime), N'Pending', CAST(100.00 AS Decimal(18, 2)), N'Initial consultation', N'Flu symptoms', N'Rest and hydration', NULL, N'Dr. Smith')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (2, N'APPT002', 2, CAST(N'2024-05-02T11:00:00.000' AS DateTime), N'Completed', CAST(200.00 AS Decimal(18, 2)), N'Follow-up', N'Mild improvement', N'Continue medication', CAST(N'2024-05-09T11:00:00.000' AS DateTime), N'Dr. Jones')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (3, N'APPT003', 1, CAST(N'2024-05-03T09:30:00.000' AS DateTime), N'Pending', CAST(150.00 AS Decimal(18, 2)), N'Routine check-up', NULL, NULL, NULL, N'Dr. Taylor')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (4, N'APPT004', 3, CAST(N'2024-05-04T14:00:00.000' AS DateTime), N'Pending', CAST(250.00 AS Decimal(18, 2)), N'Dental cleaning', N'Plaque buildup', N'Scaling', CAST(N'2024-06-04T14:00:00.000' AS DateTime), N'Dr. Brown')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (5, N'APPT005', 4, CAST(N'2024-05-05T15:00:00.000' AS DateTime), N'Completed', CAST(300.00 AS Decimal(18, 2)), N'Vaccination', N'Routine', N'None', NULL, N'Dr. White')
SET IDENTITY_INSERT [dbo].[appointment_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[doctor] ON 

INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (1, N'DID-1', N'password1', N'Dr. John Doe', N'john.doe@example.com', N'Male', 1234567890, N'Cardiology', N'123 Heart St, Health City', CAST(N'2024-05-21' AS Date), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (2, N'DID-2', N'password2', N'Dr. Jane Smith', N'jane.smith@example.com', N'Female', 1234567891, N'Neurology', N'456 Brain Ave, Neuro Town', CAST(N'2024-05-21' AS Date), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (3, N'DID-3', N'password3', N'Dr. Emily White', N'emily.white@example.com', N'Female', 1234567892, N'Pediatrics', N'789 Child Rd, Kids City', CAST(N'2024-05-21' AS Date), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (4, N'DID-4', N'password4', N'Dr. Michael Brown', N'michael.brown@example.com', N'Male', 1234567893, N'Orthopedics', N'101 Bone St, Skeletal Town', CAST(N'2024-05-21' AS Date), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (5, N'DID-5', N'password5', N'Sarah Green', N'sarah.green@example.com', N'Female', 1234567894, N'Dermatology', N'Dr. Sarah Green', CAST(N'2024-05-21' AS Date), CAST(N'2024-05-21' AS Date), CAST(N'2024-05-22' AS Date), NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (6, N'DID-6', N'password6', N'Dr. David Black', N'david.black@example.com', N'Male', 1234567895, N'Gastroenterology', N'303 Stomach St, Digest Town', CAST(N'2024-05-21' AS Date), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (7, N'DID-7', N'password7', N'Dr. Laura Blue', N'laura.blue@example.com', N'Female', 1234567896, N'Endocrinology', N'404 Hormone Ave, Gland City', CAST(N'2024-05-21' AS Date), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (8, N'DID-8', N'password8', N'Dr. Robert Red', N'robert.red@example.com', N'Male', 1234567897, N'Oncology', N'505 Cancer Blvd, Tumor Town', CAST(N'2024-05-21' AS Date), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (9, N'DID-9', N'password9', N'Dr. Linda Yellow', N'linda.yellow@example.com', N'Female', 1234567898, N'Nephrology', N'606 Kidney Rd, Renal City', CAST(N'2024-05-21' AS Date), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (10, N'DID-10', N'password10', N'Dr. William Purple', N'william.purple@example.com', N'Male', 1234567899, N'Urology', N'707 Bladder Ave, Urinary Town', CAST(N'2024-05-21' AS Date), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (11, N'DID-11', N'123123123', N'hoang', N'123123', N'Female', 12312312, N'Eye Exam', N'123123', CAST(N'0026-11-14' AS Date), CAST(N'0015-02-11' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (12, N'DID-12', N'123123123', N'nguyen van hoa', N'hoa.doctor@gmail.com', N'Female', 12312312, N'X-Ray', N'aaaaaaaaaaaaaaaa', CAST(N'0030-11-14' AS Date), CAST(N'0015-02-11' AS Date), CAST(N'2024-05-25' AS Date), CAST(N'2024-05-25' AS Date), N'Deleted', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (13, N'DID-13', N'123123123', N'dsadsa', N'hoang@gmail.com', N'Others', 123213, N'X-Ray', N'', CAST(N'0031-11-14' AS Date), CAST(N'0015-02-11' AS Date), NULL, NULL, N'Active', NULL)
SET IDENTITY_INSERT [dbo].[doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[patient] ON 

INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created], [image]) VALUES (1, 1001, N'password123', N'John Doe', 1234567890, N'123 Elm St', N'Headache', N'Migraine', N'Painkillers', CAST(N'2024-01-01' AS Date), NULL, NULL, N'Active', N'Male', 9876543210, N'CCID12345', N'O+', N'Insurance123', N'No notes', CAST(N'2024-01-01' AS Date), NULL)
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created], [image]) VALUES (2, 1002, N'password234', N'Jane Smith', 2345678901, N'456 Oak St', N'Fever', N'Viral Infection', N'Antivirals', CAST(N'2024-02-01' AS Date), NULL, NULL, N'Active', N'Female', 8765432109, N'CCID23456', N'A+', N'Insurance234', N'No notes', CAST(N'2024-02-01' AS Date), NULL)
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created], [image]) VALUES (3, 1003, N'password345', N'Alice Johnson', 3456789012, N'789 Pine St', N'Cough', N'Common Cold', N'Cough Syrup', CAST(N'2024-03-01' AS Date), NULL, NULL, N'Active', N'Female', 7654321098, N'CCID34567', N'B+', N'Insurance345', N'No notes', CAST(N'2024-03-01' AS Date), NULL)
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created], [image]) VALUES (4, 1004, N'password456', N'Bob Brown', 4567890123, N'321 Birch St', N'Back Pain', N'Muscle Strain', N'Physical Therapy', CAST(N'2024-04-01' AS Date), NULL, NULL, N'Active', N'Male', 6543210987, N'CCID45678', N'AB+', N'Insurance456', N'No notes', CAST(N'2024-04-01' AS Date), NULL)
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created], [image]) VALUES (5, 1005, N'password567', N'Charlie Green', 5678901234, N'654 Cedar St', N'Stomach Ache', N'Indigestion', N'Antacids', CAST(N'2024-05-01' AS Date), NULL, NULL, N'Active', N'Male', 5432109876, N'CCID56789', N'O-', N'Insurance567', N'No notes', CAST(N'2024-05-01' AS Date), NULL)
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created], [image]) VALUES (6, 1006, N'password678', N'David White', 6789012345, N'987 Maple St', N'Sore Throat', N'Throat Infection', N'Antibiotics', CAST(N'2024-06-01' AS Date), NULL, NULL, N'Active', N'Male', 4321098765, N'CCID67890', N'A-', N'Insurance678', N'No notes', CAST(N'2024-06-01' AS Date), NULL)
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created], [image]) VALUES (7, 1007, N'password789', N'Eve Black', 7890123456, N'123 Spruce St', N'Ear Pain', N'Ear Infection', N'Ear Drops', CAST(N'2024-07-01' AS Date), NULL, NULL, N'Active', N'Female', 3210987654, N'CCID78901', N'B-', N'Insurance789', N'No notes', CAST(N'2024-07-01' AS Date), NULL)
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created], [image]) VALUES (8, 1008, N'password890', N'Frank Gray', 8901234567, N'456 Willow St', N'Rash', N'Allergic Reaction', N'Antihistamines', CAST(N'2024-08-01' AS Date), NULL, NULL, N'Active', N'Male', 2109876543, N'CCID89012', N'AB-', N'Insurance890', N'No notes', CAST(N'2024-08-01' AS Date), NULL)
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created], [image]) VALUES (9, 1009, N'password901', N'Grace Pink', 9012345678, N'789 Fir St', N'Fatigue', N'Anemia', N'Iron Supplements', CAST(N'2024-09-01' AS Date), NULL, NULL, N'Active', N'Female', 1098765432, N'CCID90123', N'O+', N'Insurance901', N'No notes', CAST(N'2024-09-01' AS Date), NULL)
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created], [image]) VALUES (10, 1010, N'password012', N'Hank Blue', 1234567890, N'321 Ash St', N'Anxiety', N'Anxiety Disorder', N'Therapy', CAST(N'2024-10-01' AS Date), NULL, NULL, N'Active', N'Male', 9876543210, N'CCID01234', N'A+', N'Insurance012', N'No notes', CAST(N'2024-10-01' AS Date), NULL)
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created], [image]) VALUES (12, 202401011, N'patient123', N'123123', 123123, N'', N'', NULL, NULL, CAST(N'0020-11-13' AS Date), NULL, NULL, N'Active', N'Female', 0, N'', N'', N'', NULL, CAST(N'0030-11-14' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[patient] OFF
GO
SET IDENTITY_INSERT [dbo].[payment] ON 

INSERT [dbo].[payment] ([id], [patient_id], [doctor], [patient_name], [gender], [services], [total_days], [total_price], [date], [date_checkout], [status_pay], [date_pay]) VALUES (1, 1, N'Dr. Smith', N'Alice Johnson', N'Female', N'Cardiology Consultation', 3, CAST(300.50 AS Decimal(18, 2)), CAST(N'2024-05-02T10:00:00.000' AS DateTime), CAST(N'2024-05-05T15:00:00.000' AS DateTime), N'Paid', CAST(N'2024-05-02T10:00:00.000' AS DateTime))
INSERT [dbo].[payment] ([id], [patient_id], [doctor], [patient_name], [gender], [services], [total_days], [total_price], [date], [date_checkout], [status_pay], [date_pay]) VALUES (2, 2, N'Dr. Johnson', N'Bob Smith', N'Male', N'Pediatrics Checkup', 2, CAST(200.25 AS Decimal(18, 2)), CAST(N'2024-05-03T09:30:00.000' AS DateTime), CAST(N'2024-05-05T14:30:00.000' AS DateTime), N'Paid', CAST(N'2024-05-03T09:30:00.000' AS DateTime))
INSERT [dbo].[payment] ([id], [patient_id], [doctor], [patient_name], [gender], [services], [total_days], [total_price], [date], [date_checkout], [status_pay], [date_pay]) VALUES (5, 202400005, N'Dr. Williams', N'Charlie Brown', N'Male', N'Dermatology Consultation', 1, CAST(150.75 AS Decimal(18, 2)), CAST(N'2024-05-04T11:00:00.000' AS DateTime), CAST(N'2024-05-04T13:00:00.000' AS DateTime), N'Paid', CAST(N'2024-05-04T11:00:00.000' AS DateTime))
INSERT [dbo].[payment] ([id], [patient_id], [doctor], [patient_name], [gender], [services], [total_days], [total_price], [date], [date_checkout], [status_pay], [date_pay]) VALUES (6, 4, N'Dr. Jones', N'David Wilson', N'Male', N'Orthopedics Consultation', 4, CAST(400.00 AS Decimal(18, 2)), CAST(N'2024-05-05T14:00:00.000' AS DateTime), CAST(N'2024-05-09T10:00:00.000' AS DateTime), N'Paid', CAST(N'2024-05-05T14:00:00.000' AS DateTime))
INSERT [dbo].[payment] ([id], [patient_id], [doctor], [patient_name], [gender], [services], [total_days], [total_price], [date], [date_checkout], [status_pay], [date_pay]) VALUES (7, 5, N'Dr. White', N'Eva Davis', N'Female', N'Gynecology Checkup', 1, CAST(120.00 AS Decimal(18, 2)), CAST(N'2024-05-06T08:30:00.000' AS DateTime), CAST(N'2024-05-06T12:00:00.000' AS DateTime), N'Paid', CAST(N'2024-05-06T08:30:00.000' AS DateTime))
INSERT [dbo].[payment] ([id], [patient_id], [doctor], [patient_name], [gender], [services], [total_days], [total_price], [date], [date_checkout], [status_pay], [date_pay]) VALUES (8, 6, N'Dr. Green', N'Frank Miller', N'Male', N'General Checkup', 2, CAST(220.50 AS Decimal(18, 2)), CAST(N'2024-05-07T13:15:00.000' AS DateTime), CAST(N'2024-05-09T16:45:00.000' AS DateTime), N'Paid', CAST(N'2024-05-07T13:15:00.000' AS DateTime))
INSERT [dbo].[payment] ([id], [patient_id], [doctor], [patient_name], [gender], [services], [total_days], [total_price], [date], [date_checkout], [status_pay], [date_pay]) VALUES (9, 7, N'Dr. Taylor', N'Grace Lee', N'Female', N'Neurology Consultation', 3, CAST(330.75 AS Decimal(18, 2)), CAST(N'2024-05-08T10:45:00.000' AS DateTime), CAST(N'2024-05-11T11:30:00.000' AS DateTime), N'Paid', CAST(N'2024-05-08T10:45:00.000' AS DateTime))
INSERT [dbo].[payment] ([id], [patient_id], [doctor], [patient_name], [gender], [services], [total_days], [total_price], [date], [date_checkout], [status_pay], [date_pay]) VALUES (10, 8, N'Dr. Brown', N'Hannah Martinez', N'Female', N'Ophthalmology Checkup', 1, CAST(180.00 AS Decimal(18, 2)), CAST(N'2024-05-09T09:00:00.000' AS DateTime), CAST(N'2024-05-09T13:30:00.000' AS DateTime), N'Paid', CAST(N'2024-05-09T09:00:00.000' AS DateTime))
INSERT [dbo].[payment] ([id], [patient_id], [doctor], [patient_name], [gender], [services], [total_days], [total_price], [date], [date_checkout], [status_pay], [date_pay]) VALUES (11, 9, N'Dr. Adams', N'Ian Thompson', N'Male', N'Cardiology Follow-up', 2, CAST(250.00 AS Decimal(18, 2)), CAST(N'2024-05-10T14:30:00.000' AS DateTime), CAST(N'2024-05-12T17:00:00.000' AS DateTime), N'Paid', CAST(N'2024-05-10T14:30:00.000' AS DateTime))
INSERT [dbo].[payment] ([id], [patient_id], [doctor], [patient_name], [gender], [services], [total_days], [total_price], [date], [date_checkout], [status_pay], [date_pay]) VALUES (12, 10, N'Dr. Campbell', N'Jane Harris', N'Female', N'Endocrinology Consultation', 3, CAST(310.00 AS Decimal(18, 2)), CAST(N'2024-05-11T12:00:00.000' AS DateTime), CAST(N'2024-05-14T15:00:00.000' AS DateTime), N'Paid', CAST(N'2024-05-11T12:00:00.000' AS DateTime))
INSERT [dbo].[payment] ([id], [patient_id], [doctor], [patient_name], [gender], [services], [total_days], [total_price], [date], [date_checkout], [status_pay], [date_pay]) VALUES (13, 202400013, N'Dr. Mitchell', N'Kevin Scott', N'Male', N'Pulmonology Consultation', 1, CAST(190.00 AS Decimal(18, 2)), CAST(N'2024-05-12T11:00:00.000' AS DateTime), CAST(N'2024-05-12T14:00:00.000' AS DateTime), N'Paid', CAST(N'2024-05-12T11:00:00.000' AS DateTime))
INSERT [dbo].[payment] ([id], [patient_id], [doctor], [patient_name], [gender], [services], [total_days], [total_price], [date], [date_checkout], [status_pay], [date_pay]) VALUES (14, 202400014, N'Dr. Parker', N'Laura Clark', N'Female', N'Rheumatology Checkup', 2, CAST(240.00 AS Decimal(18, 2)), CAST(N'2024-05-13T10:30:00.000' AS DateTime), CAST(N'2024-05-15T13:30:00.000' AS DateTime), N'Pending', CAST(N'2024-05-13T10:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[payment] OFF
GO
SET IDENTITY_INSERT [dbo].[services] ON 

INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (1, N'General Check-up', N'Routine general check-up', CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (2, N'Blood Test', N'Comprehensive blood test', CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (3, N'X-Ray', N'Chest X-Ray', CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (4, N'Blood Test', N'Comprehensive blood test', CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (5, N'Vaccination', N'Childhood vaccinations', CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (6, N'Consultation', N'Specialist consultation', CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (7, N'Physical Therapy', N'Physical therapy session', CAST(90.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (8, N'Dental Cleaning', N'Routine dental cleaning', CAST(75.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (9, N'Eye Exam', N'Comprehensive eye exam', CAST(600.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[services] OFF
GO
ALTER TABLE [dbo].[appointment_detail] ADD  DEFAULT ('Pending') FOR [payment_status]
GO
USE [master]
GO
ALTER DATABASE [hospital] SET  READ_WRITE 
GO
