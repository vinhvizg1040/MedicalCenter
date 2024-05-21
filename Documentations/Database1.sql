USE [master]
GO
/****** Object:  Database [hospital]    Script Date: 21/05/2024 1:44:32 CH ******/
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
/****** Object:  Table [dbo].[admin]    Script Date: 21/05/2024 1:44:33 CH ******/
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
/****** Object:  Table [dbo].[appointment]    Script Date: 21/05/2024 1:44:33 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[appointment_id] [nvarchar](45) NOT NULL,
	[patient_id] [nvarchar](45) NOT NULL,
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
	[status] [nvarchar](50) NOT NULL,
	[schedule] [nvarchar](100) NULL,
	[total_pay] [decimal](10, 2) NULL,
	[payment_status] [nvarchar](50) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appointment_detail]    Script Date: 21/05/2024 1:44:33 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment_detail](
	[appointment_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[appointment_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
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
/****** Object:  Table [dbo].[doctor]    Script Date: 21/05/2024 1:44:33 CH ******/
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
	[date_created] [datetime] NULL,
	[date] [date] NOT NULL,
	[modify_date] [date] NULL,
	[delete_date] [date] NULL,
	[status] [nvarchar](50) NOT NULL,
	[image] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient]    Script Date: 21/05/2024 1:44:33 CH ******/
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
	[image] [nvarchar](500) NULL,
	[description] [nvarchar](200) NULL,
	[diagnosis] [nvarchar](200) NULL,
	[treatment] [nvarchar](200) NULL,
	[date] [datetime] NOT NULL,
	[date_modify] [datetime] NULL,
	[date_delete] [datetime] NULL,
	[status] [nvarchar](100) NOT NULL,
	[gender] [nvarchar](50) NULL,
	[patients_EmergencyNumber] [bigint] NULL,
	[patients_ccid] [nvarchar](100) NULL,
	[patients_bloodGroup] [nvarchar](10) NULL,
	[patients_insurance] [nvarchar](100) NULL,
	[note] [nvarchar](500) NULL,
	[date_created] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 21/05/2024 1:44:33 CH ******/
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
/****** Object:  Table [dbo].[services]    Script Date: 21/05/2024 1:44:33 CH ******/
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
SET IDENTITY_INSERT [dbo].[appointment] ON 

INSERT [dbo].[appointment] ([id], [appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [status], [schedule], [total_pay], [payment_status], [quantity]) VALUES (1, N'AID-1', N'1001', N'John Doe', N'Male', N'General checkup', N'Healthy', N'No treatment needed', 1234567890, N'123 Main St', CAST(N'2024-05-20T00:00:00.000' AS DateTime), NULL, NULL, N'Scheduled', N'Weekly', CAST(100.00 AS Decimal(10, 2)), N'Paid', 1)
INSERT [dbo].[appointment] ([id], [appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [status], [schedule], [total_pay], [payment_status], [quantity]) VALUES (2, N'AID-2', N'1002', N'Jane Smith', N'Female', N'Headache', N'Migraine', N'Pain relief medication', 2345678901, N'456 Elm St', CAST(N'2024-05-21T00:00:00.000' AS DateTime), NULL, NULL, N'Scheduled', N'Bi-weekly', CAST(200.00 AS Decimal(10, 2)), N'Pending', 2)
INSERT [dbo].[appointment] ([id], [appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [status], [schedule], [total_pay], [payment_status], [quantity]) VALUES (3, N'AID-3', N'1003', N'Bob Brown', N'Male', N'Chest pain', N'Heart condition', N'Lifestyle changes', 3456789012, N'789 Pine St', CAST(N'2024-05-22T00:00:00.000' AS DateTime), NULL, NULL, N'Completed', N'Monthly', CAST(300.00 AS Decimal(10, 2)), N'Paid', 3)
INSERT [dbo].[appointment] ([id], [appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [status], [schedule], [total_pay], [payment_status], [quantity]) VALUES (4, N'AID-4', N'1004', N'Alice White', N'Female', N'Back pain', N'Muscle strain', N'Physical therapy', 4567890123, N'101 Maple St', CAST(N'2024-05-23T00:00:00.000' AS DateTime), NULL, NULL, N'Cancelled', N'Weekly', CAST(150.00 AS Decimal(10, 2)), N'Refunded', 1)
INSERT [dbo].[appointment] ([id], [appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [status], [schedule], [total_pay], [payment_status], [quantity]) VALUES (5, N'AID-5', N'1005', N'Tom Green', N'Male', N'Skin rash', N'Allergy', N'Antihistamines', 5678901234, N'202 Oak St', CAST(N'2024-05-24T00:00:00.000' AS DateTime), NULL, NULL, N'Scheduled', N'One-time', CAST(50.00 AS Decimal(10, 2)), N'Paid', 1)
INSERT [dbo].[appointment] ([id], [appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [status], [schedule], [total_pay], [payment_status], [quantity]) VALUES (6, N'AID-6', N'1006', N'Mary Blue', N'Female', N'Fever', N'Viral infection', N'Rest and fluids', 6789012345, N'303 Birch St', CAST(N'2024-05-25T00:00:00.000' AS DateTime), NULL, NULL, N'Completed', N'One-time', CAST(75.00 AS Decimal(10, 2)), N'Paid', 1)
INSERT [dbo].[appointment] ([id], [appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [status], [schedule], [total_pay], [payment_status], [quantity]) VALUES (7, N'AID-7', N'1007', N'Steve Black', N'Male', N'Joint pain', N'Arthritis', N'Anti-inflammatory drugs', 7890123456, N'404 Cedar St', CAST(N'2024-05-26T00:00:00.000' AS DateTime), NULL, NULL, N'Scheduled', N'Bi-monthly', CAST(250.00 AS Decimal(10, 2)), N'Pending', 2)
INSERT [dbo].[appointment] ([id], [appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [status], [schedule], [total_pay], [payment_status], [quantity]) VALUES (8, N'AID-8', N'1008', N'Nancy Red', N'Female', N'Cough', N'Bronchitis', N'Antibiotics', 8901234567, N'505 Spruce St', CAST(N'2024-05-27T00:00:00.000' AS DateTime), NULL, NULL, N'Completed', N'Weekly', CAST(125.00 AS Decimal(10, 2)), N'Paid', 1)
INSERT [dbo].[appointment] ([id], [appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [status], [schedule], [total_pay], [payment_status], [quantity]) VALUES (9, N'AID-9', N'1009', N'Paul Purple', N'Male', N'Fatigue', N'Anemia', N'Iron supplements', 9012345678, N'606 Redwood St', CAST(N'2024-05-28T00:00:00.000' AS DateTime), NULL, NULL, N'Cancelled', N'Monthly', CAST(175.00 AS Decimal(10, 2)), N'Refunded', 1)
INSERT [dbo].[appointment] ([id], [appointment_id], [patient_id], [name], [gender], [description], [diagnosis], [treatment], [mobile_number], [address], [date], [date_modify], [date_delete], [status], [schedule], [total_pay], [payment_status], [quantity]) VALUES (10, N'AID-10', N'1010', N'Daisy Yellow', N'Female', N'Stomach ache', N'Gastritis', N'Antacids', 1234567890, N'707 Chestnut St', CAST(N'2024-05-29T00:00:00.000' AS DateTime), NULL, NULL, N'Scheduled', N'One-time', CAST(80.00 AS Decimal(10, 2)), N'Paid', 1)
SET IDENTITY_INSERT [dbo].[appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[appointment_detail] ON 

INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [quantity], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (1, 1, 101, 2, CAST(N'2024-05-10T10:00:00.000' AS DateTime), N'Pending', CAST(100.50 AS Decimal(18, 2)), N'Patient has a mild fever', N'Viral fever', N'Paracetamol', CAST(N'2024-05-17T10:00:00.000' AS DateTime), N'DID-1')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [quantity], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (2, 2, 102, 1, CAST(N'2024-05-11T11:00:00.000' AS DateTime), N'Pending', CAST(150.00 AS Decimal(18, 2)), N'Routine check-up', N'Healthy', N'No treatment needed', NULL, N'DID-2')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [quantity], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (3, 3, 103, 3, CAST(N'2024-05-12T12:00:00.000' AS DateTime), N'Pending', CAST(200.75 AS Decimal(18, 2)), N'Patient complains of headache', N'Migraine', N'Painkillers', CAST(N'2024-05-19T12:00:00.000' AS DateTime), N'DID-1')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [quantity], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (4, 4, 104, 1, CAST(N'2024-05-13T13:00:00.000' AS DateTime), N'Pending', CAST(250.00 AS Decimal(18, 2)), N'Follow-up for diabetes', N'Diabetes Type II', N'Insulin', CAST(N'2024-05-20T13:00:00.000' AS DateTime), N'DID-2')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [quantity], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (5, 5, 105, 2, CAST(N'2024-05-14T14:00:00.000' AS DateTime), N'Pending', CAST(300.25 AS Decimal(18, 2)), N'Childhood vaccinations', N'N/A', N'Vaccination', NULL, N'DID-1')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [quantity], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (6, 6, 106, 1, CAST(N'2024-05-15T15:00:00.000' AS DateTime), N'Pending', CAST(350.00 AS Decimal(18, 2)), N'Patient with high blood pressure', N'Hypertension', N'Blood pressure medication', CAST(N'2024-05-22T15:00:00.000' AS DateTime), N'DID-2')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [quantity], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (7, 7, 107, 2, CAST(N'2024-05-16T16:00:00.000' AS DateTime), N'Pending', CAST(400.50 AS Decimal(18, 2)), N'Annual physical exam', N'Healthy', N'No treatment needed', NULL, N'DID-1')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [quantity], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (8, 8, 108, 1, CAST(N'2024-05-17T17:00:00.000' AS DateTime), N'Pending', CAST(450.75 AS Decimal(18, 2)), N'Follow-up after surgery', N'Post-surgery recovery', N'Pain management', CAST(N'2024-05-24T17:00:00.000' AS DateTime), N'DID-2')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [quantity], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (9, 9, 109, 3, CAST(N'2024-05-18T18:00:00.000' AS DateTime), N'Pending', CAST(500.00 AS Decimal(18, 2)), N'Patient has severe allergies', N'Allergic reaction', N'Antihistamines', CAST(N'2024-05-25T18:00:00.000' AS DateTime), N'DID-1')
INSERT [dbo].[appointment_detail] ([appointment_detail_id], [appointment_id], [service_id], [quantity], [date], [payment_status], [price], [description], [diagnosis], [treatment], [re_examination_date], [doctor]) VALUES (10, 10, 110, 2, CAST(N'2024-05-19T19:00:00.000' AS DateTime), N'Pending', CAST(550.25 AS Decimal(18, 2)), N'Routine dental check-up', N'Healthy teeth', N'No treatment needed', NULL, N'DID-2')
SET IDENTITY_INSERT [dbo].[appointment_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[doctor] ON 

INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (1, N'DID-1', N'password1', N'Dr. John Doe', N'john.doe@example.com', N'Male', 1234567890, N'Cardiology', N'Dr. John Doe', CAST(N'2024-05-21T10:00:00.000' AS DateTime), CAST(N'2024-05-21' AS Date), CAST(N'2024-05-21' AS Date), NULL, N'Active', N'src\\Doctor_DirectoryDID-1.jpg')
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (2, N'DID-2', N'password2', N'Dr. Jane Smith', N'jane.smith@example.com', N'Female', 1234567891, N'Neurology', N'456 Brain Ave, Neuro Town', CAST(N'2024-05-21T10:00:00.000' AS DateTime), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (3, N'DID-3', N'password3', N'Dr. Emily White', N'emily.white@example.com', N'Female', 1234567892, N'Pediatrics', N'789 Child Rd, Kids City', CAST(N'2024-05-21T10:00:00.000' AS DateTime), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (4, N'DID-4', N'password4', N'Dr. Michael Brown', N'michael.brown@example.com', N'Male', 1234567893, N'Orthopedics', N'101 Bone St, Skeletal Town', CAST(N'2024-05-21T10:00:00.000' AS DateTime), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (5, N'DID-5', N'password5', N'Dr. Sarah Green', N'sarah.green@example.com', N'Female', 1234567894, N'Dermatology', N'202 Skin Blvd, Dermat City', CAST(N'2024-05-21T10:00:00.000' AS DateTime), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (6, N'DID-6', N'password6', N'Dr. David Black', N'david.black@example.com', N'Male', 1234567895, N'Gastroenterology', N'303 Stomach St, Digest Town', CAST(N'2024-05-21T10:00:00.000' AS DateTime), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (7, N'DID-7', N'password7', N'Dr. Laura Blue', N'laura.blue@example.com', N'Female', 1234567896, N'Endocrinology', N'404 Hormone Ave, Gland City', CAST(N'2024-05-21T10:00:00.000' AS DateTime), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (8, N'DID-8', N'password8', N'Dr. Robert Red', N'robert.red@example.com', N'Male', 1234567897, N'Oncology', N'505 Cancer Blvd, Tumor Town', CAST(N'2024-05-21T10:00:00.000' AS DateTime), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (9, N'DID-9', N'password9', N'Dr. Linda Yellow', N'linda.yellow@example.com', N'Female', 1234567898, N'Nephrology', N'606 Kidney Rd, Renal City', CAST(N'2024-05-21T10:00:00.000' AS DateTime), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
INSERT [dbo].[doctor] ([id], [doctor_id], [password], [full_name], [email], [gender], [mobile_number], [specialized], [address], [date_created], [date], [modify_date], [delete_date], [status], [image]) VALUES (10, N'DID-10', N'password10', N'Dr. William Purple', N'william.purple@example.com', N'Male', 1234567899, N'Urology', N'707 Bladder Ave, Urinary Town', CAST(N'2024-05-21T10:00:00.000' AS DateTime), CAST(N'2024-05-21' AS Date), NULL, NULL, N'Active', NULL)
SET IDENTITY_INSERT [dbo].[doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[patient] ON 

INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [image], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created]) VALUES (1, 1001, N'patient1pass', N'Alice Johnson', 123123123, N'101 Pine St, City', NULL, N'Patient description 1', N'Diagnosis 1', N'Treatment 1', CAST(N'2024-05-02T00:00:00.000' AS DateTime), CAST(N'2024-05-21T00:00:00.000' AS DateTime), NULL, N'Confirm', N'Female', 987654321, N'1234567890', N'O+', N'ABC Insurance', N'Note 1', CAST(N'2024-05-02T10:00:00.000' AS DateTime))
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [image], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created]) VALUES (2, 1002, N'patient2pass', N'Bob Smith', 456456456, N'202 Oak St, City', NULL, N'Patient description 2', N'Diagnosis 2', N'Treatment 2', CAST(N'2024-05-02T00:00:00.000' AS DateTime), CAST(N'2024-05-20T00:00:00.000' AS DateTime), NULL, N'Active', N'Male', 987654322, N'1234567891', N'AB-', N'XYZ Insura', N'Note 2', CAST(N'2024-05-02T11:00:00.000' AS DateTime))
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [image], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created]) VALUES (3, 1003, N'patient3pass', N'Charlie Brown', 789789789, N'303 Maple St, City', NULL, N'Patient description 3', N'Diagnosis 3', N'Treatment 3', CAST(N'2024-05-03T12:00:00.000' AS DateTime), NULL, NULL, N'Active', N'Male', 987654323, N'1234567892', N'A+', N'DEF Insurance', N'Note 3', CAST(N'2024-05-03T12:00:00.000' AS DateTime))
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [image], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created]) VALUES (4, 1004, N'patient4pass', N'Diana Prince', 321321321, N'404 Elm St, City', NULL, N'Patient description 4', N'Diagnosis 4', N'Treatment 4', CAST(N'2024-05-03T13:00:00.000' AS DateTime), NULL, NULL, N'Active', N'Female', 987654324, N'1234567893', N'B+', N'GHI Insurance', N'Note 4', CAST(N'2024-05-03T13:00:00.000' AS DateTime))
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [image], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created]) VALUES (5, 1005, N'patient5pass', N'Eve Adams', 654654654, N'505 Pine St, City', NULL, N'Patient description 5', N'Diagnosis 5', N'Treatment 5', CAST(N'2024-05-04T14:00:00.000' AS DateTime), NULL, NULL, N'Active', N'Female', 987654325, N'1234567894', N'O-', N'JKL Insurance', N'Note 5', CAST(N'2024-05-04T14:00:00.000' AS DateTime))
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [image], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created]) VALUES (6, 1006, N'patient6pass', N'Frank Miller', 987987987, N'606 Oak St, City', NULL, N'Patient description 6', N'Diagnosis 6', N'Treatment 6', CAST(N'2024-05-04T15:00:00.000' AS DateTime), NULL, NULL, N'Active', N'Male', 987654326, N'1234567895', N'B-', N'MNO Insurance', N'Note 6', CAST(N'2024-05-04T15:00:00.000' AS DateTime))
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [image], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created]) VALUES (7, 1007, N'patient7pass', N'Grace Lee', 123456789, N'707 Maple St, City', NULL, N'Patient description 7', N'Diagnosis 7', N'Treatment 7', CAST(N'2024-05-05T16:00:00.000' AS DateTime), NULL, NULL, N'Active', N'Female', 987654327, N'1234567896', N'A-', N'PQR Insurance', N'Note 7', CAST(N'2024-05-05T16:00:00.000' AS DateTime))
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [image], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created]) VALUES (8, 1008, N'patient8pass', N'Hank Williams', 987654321, N'808 Elm St, City', NULL, N'Patient description 8', N'Diagnosis 8', N'Treatment 8', CAST(N'2024-05-05T17:00:00.000' AS DateTime), NULL, NULL, N'Active', N'Male', 987654328, N'1234567897', N'AB+', N'STU Insurance', N'Note 8', CAST(N'2024-05-05T17:00:00.000' AS DateTime))
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [image], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created]) VALUES (9, 1009, N'patient9pass', N'Ivy Green', 111111111, N'909 Pine St, City', NULL, N'Patient description 9', N'Diagnosis 9', N'Treatment 9', CAST(N'2024-05-06T18:00:00.000' AS DateTime), NULL, NULL, N'Active', N'Female', 987654329, N'1234567898', N'O+', N'VWX Insurance', N'Note 9', CAST(N'2024-05-06T18:00:00.000' AS DateTime))
INSERT [dbo].[patient] ([id], [patient_id], [password], [full_name], [mobile_number], [address], [image], [description], [diagnosis], [treatment], [date], [date_modify], [date_delete], [status], [gender], [patients_EmergencyNumber], [patients_ccid], [patients_bloodGroup], [patients_insurance], [note], [date_created]) VALUES (10, 1010, N'patient10pass', N'Jack Black', 222222222, N'1010 Oak St, City', NULL, N'Patient description 10', N'Diagnosis 10', N'Treatment 10', CAST(N'2024-05-06T00:00:00.000' AS DateTime), CAST(N'2024-05-21T00:00:00.000' AS DateTime), NULL, N'Inactive', N'Male', 987654330, N'1234567899', N'A+', N'YZA Insurance', N'Note 10', CAST(N'2024-05-06T19:00:00.000' AS DateTime))
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

INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (1, N'General Check-up', N'Routine general check-up', CAST(1001.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (2, N'Blood Test', N'Comprehensive blood test', CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (3, N'X-Ray', N'Chest X-Ray', CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (4, N'Blood Test', N'Comprehensive blood test', CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (5, N'Vaccination', N'Childhood vaccinations', CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (6, N'Consultation', N'Specialist consultation', CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (7, N'Physical Therapy', N'Physical therapy session', CAST(90.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (8, N'Dental Cleaning', N'Routine dental cleaning', CAST(75.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (9, N'Eye Exam', N'Comprehensive eye exam', CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[services] ([service_id], [service_name], [description], [price]) VALUES (10, N'Surgery', N'Minor surgery procedure', CAST(500.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[services] OFF
GO
ALTER TABLE [dbo].[appointment_detail] ADD  DEFAULT ('Pending') FOR [payment_status]
GO
USE [master]
GO
ALTER DATABASE [hospital] SET  READ_WRITE 
GO
