USE [master]
GO
/****** Object:  Database [SneakerDB]    Script Date: 02/12/2021 00:53:08 ******/
CREATE DATABASE [SneakerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SneakerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SneakerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SneakerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SneakerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SneakerDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SneakerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SneakerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SneakerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SneakerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SneakerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SneakerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SneakerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SneakerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SneakerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SneakerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SneakerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SneakerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SneakerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SneakerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SneakerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SneakerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SneakerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SneakerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SneakerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SneakerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SneakerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SneakerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SneakerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SneakerDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SneakerDB] SET  MULTI_USER 
GO
ALTER DATABASE [SneakerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SneakerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SneakerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SneakerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SneakerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SneakerDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SneakerDB', N'ON'
GO
ALTER DATABASE [SneakerDB] SET QUERY_STORE = OFF
GO
USE [SneakerDB]
GO
/****** Object:  FullTextCatalog [ProductName]    Script Date: 02/12/2021 00:53:08 ******/
CREATE FULLTEXT CATALOG [ProductName] 
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[CatalogID] [int] IDENTITY(1,1) NOT NULL,
	[CatalogName] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED 
(
	[CatalogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[ProvinceID] [int] NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageProduct]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageProduct](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreate] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_UserOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductItemID] [int] NOT NULL,
	[AmountBuy] [int] NOT NULL,
	[Total] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [money] NOT NULL,
	[Status] [int] NOT NULL,
	[CatalogID] [int] NOT NULL,
	[SubCatalogID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductItem]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductItem](
	[ProductItemID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[SizeID] [int] NOT NULL,
	[AmountStock] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_ProductItem] PRIMARY KEY CLUSTERED 
(
	[ProductItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[ProvinceID] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceName] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCatalog]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCatalog](
	[SubCatalogID] [int] IDENTITY(1,1) NOT NULL,
	[SubCatalogName] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[CatalogID] [int] NOT NULL,
 CONSTRAINT [PK_SubCatalog] PRIMARY KEY CLUSTERED 
(
	[SubCatalogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [Account], [Password], [Name], [Role]) VALUES (1, N'thiennbm', N'123', N'Minh Thiên', 1)
INSERT [dbo].[Admin] ([AdminID], [Account], [Password], [Name], [Role]) VALUES (2, N'hieuvm', N'minhhieu', N'Minh Hiếu', 3)
INSERT [dbo].[Admin] ([AdminID], [Account], [Password], [Name], [Role]) VALUES (1002, N'hieuht30', N'tronghieu', N'Trọng Hiếu', 2)
INSERT [dbo].[Admin] ([AdminID], [Account], [Password], [Name], [Role]) VALUES (3002, N'duongnt', N'thuyduong', N'Thùy Dương', 2)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalog] ON 

INSERT [dbo].[Catalog] ([CatalogID], [CatalogName], [Status]) VALUES (2, N'ÁO', 1)
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName], [Status]) VALUES (3, N'QUẦN', 1)
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName], [Status]) VALUES (1005, N'MŨ', 1)
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName], [Status]) VALUES (1006, N'CẶP', 1)
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName], [Status]) VALUES (1016, N'test', 1)
SET IDENTITY_INSERT [dbo].[Catalog] OFF
GO
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4007, N'Ba Đình', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4008, N'Hoàn Kiếm', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4009, N'Tây Hồ', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4010, N'Long Biên', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4011, N'Cầu Giấy', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4012, N'Đống Đa', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4013, N'Hai Bà Trưng', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4014, N'Hoàng Mai', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4015, N'Thanh Xuân', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4016, N'Sóc Sơn', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4017, N'Đông Anh', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4018, N'Gia Lâm', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4019, N'Nam Từ Liêm', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4020, N'Thanh Trì', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4021, N'Bắc Từ Liêm', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4022, N'Mê Linh', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4023, N'Hà Đông', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4024, N'Thị xã Sơn Tây', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4025, N'Ba Vì', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4026, N'Phúc Thọ', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4027, N'Đan Phượng', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4028, N'Hoài Đức', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4029, N'Quốc Oai', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4030, N'Thạch Thất', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4031, N'Chương Mỹ', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4032, N'Thanh Oai', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4033, N'Thường Tín', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4034, N'Phú Xuyên', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4035, N'Ứng Hòa', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4036, N'Mỹ Đức', 1, 3015)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4037, N'Hà Giang', 1, 3016)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4038, N'Đồng Văn', 1, 3016)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4039, N'Mèo Vạc', 1, 3016)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4040, N'Yên Minh', 1, 3016)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4041, N'Quản Bạ', 1, 3016)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4042, N'Vị Xuyên', 1, 3016)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4043, N'Bắc Mê', 1, 3016)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4044, N'Hoàng Su Phì', 1, 3016)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4045, N'Xín Mần', 1, 3016)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4046, N'Bắc Quang', 1, 3016)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4047, N'Quang Bình', 1, 3016)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4048, N'Cao Bằng', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4049, N'Bảo Lâm', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4050, N'Bảo Lạc', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4051, N'Thông Nông', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4052, N'Hà Quảng', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4053, N'Trà Lĩnh', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4054, N'Trùng Khánh', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4055, N'Hạ Lang', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4056, N'Quảng Uyên', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4057, N'Phục Hoà', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4058, N'Hoà An', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4059, N'Nguyên Bình', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4060, N'Thạch An', 1, 3017)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4061, N'Bắc Kạn', 1, 3018)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4062, N'Pác Nặm', 1, 3018)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4063, N'Ba Bể', 1, 3018)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4064, N'Ngân Sơn', 1, 3018)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4065, N'Bạch Thông', 1, 3018)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4066, N'Chợ Đồn', 1, 3018)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4067, N'Chợ Mới', 1, 3018)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4068, N'Na Rì', 1, 3018)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4069, N'Tuyên Quang', 1, 3019)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4070, N'Lâm Bình', 1, 3019)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4071, N'Na Hang', 1, 3019)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4072, N'Chiêm Hóa', 1, 3019)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4073, N'Hàm Yên', 1, 3019)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4074, N'Yên Sơn', 1, 3019)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4075, N'Sơn Dương', 1, 3019)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4076, N'Lào Cai', 1, 3020)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4077, N'Bát Xát', 1, 3020)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4078, N'Mường Khương', 1, 3020)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4079, N'Si Ma Cai', 1, 3020)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4080, N'Bắc Hà', 1, 3020)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4081, N'Bảo Thắng', 1, 3020)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4082, N'Bảo Yên', 1, 3020)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4083, N'Sa Pa', 1, 3020)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4084, N'Văn Bàn', 1, 3020)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4085, N'Điện Biên Phủ', 1, 3021)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4086, N'Thị Xã Mường Lay', 1, 3021)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4087, N'Mường Nhé', 1, 3021)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4088, N'Mường Chà', 1, 3021)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4089, N'Tủa Chùa', 1, 3021)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4090, N'Tuần Giáo', 1, 3021)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4091, N'Điện Biên', 1, 3021)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4092, N'Điện Biên Đông', 1, 3021)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4093, N'Mường Ảng', 1, 3021)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4094, N'Nậm Pồ', 1, 3021)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4095, N'Lai Châu', 1, 3022)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4096, N'Tam Đường', 1, 3022)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4097, N'Mường Tè', 1, 3022)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4098, N'Sìn Hồ', 1, 3022)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4099, N'Phong Thổ', 1, 3022)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4100, N'Than Uyên', 1, 3022)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4101, N'Tân Uyên', 1, 3022)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4102, N'Nậm Nhùn', 1, 3022)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4103, N'Sơn La', 1, 3023)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4104, N'Quỳnh Nhai', 1, 3023)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4105, N'Thuận Châu', 1, 3023)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4106, N'Mường La', 1, 3023)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4107, N'Bắc Yên', 1, 3023)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4108, N'Phù Yên', 1, 3023)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4109, N'Mộc Châu', 1, 3023)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4110, N'Yên Châu', 1, 3023)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4111, N'Mai Sơn', 1, 3023)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4112, N'Sông Mã', 1, 3023)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4113, N'Sốp Cộp', 1, 3023)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4114, N'Vân Hồ', 1, 3023)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4115, N'Yên Bái', 1, 3024)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4116, N'Thị xã Nghĩa Lộ', 1, 3024)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4117, N'Lục Yên', 1, 3024)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4118, N'Văn Yên', 1, 3024)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4119, N'Mù Căng Chải', 1, 3024)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4120, N'Trấn Yên', 1, 3024)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4121, N'Trạm Tấu', 1, 3024)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4122, N'Văn Chấn', 1, 3024)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4123, N'Yên Bình', 1, 3024)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4124, N'Hòa Bình', 1, 3025)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4125, N'Đà Bắc', 1, 3025)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4126, N'Kỳ Sơn', 1, 3025)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4127, N'Lương Sơn', 1, 3025)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4128, N'Kim Bôi', 1, 3025)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4129, N'Cao Phong', 1, 3025)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4130, N'Tân Lạc', 1, 3025)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4131, N'Mai Châu', 1, 3025)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4132, N'Lạc Sơn', 1, 3025)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4133, N'Yên Thủy', 1, 3025)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4134, N'Lạc Thủy', 1, 3025)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4135, N'Thái Nguyên', 1, 3026)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4136, N'Sông Công', 1, 3026)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4137, N'Định Hóa', 1, 3026)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4138, N'Phú Lương', 1, 3026)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4139, N'Đồng Hỷ', 1, 3026)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4140, N'Võ Nhai', 1, 3026)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4141, N'Đại Từ', 1, 3026)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4142, N'Thị xã Phổ Yên', 1, 3026)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4143, N'Phú Bình', 1, 3026)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4144, N'Lạng Sơn', 1, 3027)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4145, N'Tràng Định', 1, 3027)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4146, N'Bình Gia', 1, 3027)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4147, N'Văn Lãng', 1, 3027)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4148, N'Cao Lộc', 1, 3027)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4149, N'Văn Quan', 1, 3027)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4150, N'Bắc Sơn', 1, 3027)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4151, N'Hữu Lũng', 1, 3027)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4152, N'Chi Lăng', 1, 3027)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4153, N'Lộc Bình', 1, 3027)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4154, N'Đình Lập', 1, 3027)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4155, N'Hạ Long', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4156, N'Móng Cái', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4157, N'Cẩm Phả', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4158, N'Uông Bí', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4159, N'Bình Liêu', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4160, N'Tiên Yên', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4161, N'Đầm Hà', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4162, N'Hải Hà', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4163, N'Ba Chẽ', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4164, N'Vân Đồn', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4165, N'Hoành Bồ', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4166, N'Thị xã Đông Triều', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4167, N'Thị xã Quảng Yên', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4168, N'Cô Tô', 1, 3028)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4169, N'Bắc Giang', 1, 3029)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4170, N'Yên Thế', 1, 3029)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4171, N'Tân Yên', 1, 3029)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4172, N'Lạng Giang', 1, 3029)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4173, N'Lục Nam', 1, 3029)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4174, N'Lục Ngạn', 1, 3029)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4175, N'Sơn Động', 1, 3029)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4176, N'Yên Dũng', 1, 3029)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4177, N'Việt Yên', 1, 3029)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4178, N'Hiệp Hòa', 1, 3029)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4179, N'Việt Trì', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4180, N'Thị xã Phú Thọ', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4181, N'Đoan Hùng', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4182, N'Hạ Hoà', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4183, N'Thanh Ba', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4184, N'Phù Ninh', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4185, N'Yên Lập', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4186, N'Cẩm Khê', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4187, N'Tam Nông', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4188, N'Lâm Thao', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4189, N'Thanh Sơn', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4190, N'Thanh Thuỷ', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4191, N'Tân Sơn', 1, 3030)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4192, N'Vĩnh Yên', 1, 3031)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4193, N'Phúc Yên', 1, 3031)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4194, N'Lập Thạch', 1, 3031)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4195, N'Tam Dương', 1, 3031)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4196, N'Tam Đảo', 1, 3031)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4197, N'Bình Xuyên', 1, 3031)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4198, N'Yên Lạc', 1, 3031)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4199, N'Vĩnh Tường', 1, 3031)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4200, N'Sông Lô', 1, 3031)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4201, N'Bắc Ninh', 1, 3032)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4202, N'Yên Phong', 1, 3032)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4203, N'Quế Võ', 1, 3032)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4204, N'Tiên Du', 1, 3032)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4205, N'Thị xã Từ Sơn', 1, 3032)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4206, N'Thuận Thành', 1, 3032)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4207, N'Gia Bình', 1, 3032)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4208, N'Lương Tài', 1, 3032)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4209, N'Hải Dương', 1, 3033)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4210, N'Chí Linh', 1, 3033)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4211, N'Nam Sách', 1, 3033)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4212, N'Kinh Môn', 1, 3033)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4213, N'Kim Thành', 1, 3033)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4214, N'Thanh Hà', 1, 3033)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4215, N'Cẩm Giàng', 1, 3033)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4216, N'Bình Giang', 1, 3033)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4217, N'Gia Lộc', 1, 3033)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4218, N'Tứ Kỳ', 1, 3033)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4219, N'Ninh Giang', 1, 3033)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4220, N'Thanh Miện', 1, 3033)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4221, N'Quận Hồng Bàng', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4222, N'Quận Ngô Quyền', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4223, N'Quận Lê Chân', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4224, N'Quận Hải An', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4225, N'Quận Kiến An', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4226, N'Quận Đồ Sơn', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4227, N'Quận Dương Kinh', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4228, N'Thuỷ Nguyên', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4229, N'An Dương', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4230, N'An Lão', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4231, N'Kiến Thuỵ', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4232, N'Tiên Lãng', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4233, N'Vĩnh Bảo', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4234, N'Cát Hải', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4235, N'Bạch Long Vĩ', 1, 3034)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4236, N'Hưng Yên', 1, 3035)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4237, N'Văn Lâm', 1, 3035)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4238, N'Văn Giang', 1, 3035)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4239, N'Yên Mỹ', 1, 3035)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4240, N'Thị xã Mỹ Hào', 1, 3035)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4241, N'Ân Thi', 1, 3035)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4242, N'Khoái Châu', 1, 3035)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4243, N'Kim Động', 1, 3035)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4244, N'Tiên Lữ', 1, 3035)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4245, N'Phù Cừ', 1, 3035)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4246, N'Thái Bình', 1, 3036)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4247, N'Quỳnh Phụ', 1, 3036)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4248, N'Hưng Hà', 1, 3036)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4249, N'Đông Hưng', 1, 3036)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4250, N'Thái Thụy', 1, 3036)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4251, N'Tiền Hải', 1, 3036)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4252, N'Kiến Xương', 1, 3036)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4253, N'Vũ Thư', 1, 3036)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4254, N'Phủ Lý', 1, 3037)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4255, N'Duy Tiên', 1, 3037)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4256, N'Kim Bảng', 1, 3037)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4257, N'Thanh Liêm', 1, 3037)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4258, N'Bình Lục', 1, 3037)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4259, N'Lý Nhân', 1, 3037)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4260, N'Nam Định', 1, 3038)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4261, N'Mỹ Lộc', 1, 3038)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4262, N'Vụ Bản', 1, 3038)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4263, N'Ý Yên', 1, 3038)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4264, N'Nghĩa Hưng', 1, 3038)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4265, N'Nam Trực', 1, 3038)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4266, N'Trực Ninh', 1, 3038)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4267, N'Xuân Trường', 1, 3038)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4268, N'Giao Thủy', 1, 3038)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4269, N'Hải Hậu', 1, 3038)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4270, N'Ninh Bình', 1, 3039)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4271, N'Tam Điệp', 1, 3039)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4272, N'Nho Quan', 1, 3039)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4273, N'Gia Viễn', 1, 3039)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4274, N'Hoa Lư', 1, 3039)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4275, N'Yên Khánh', 1, 3039)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4276, N'Kim Sơn', 1, 3039)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4277, N'Yên Mô', 1, 3039)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4278, N'Thanh Hóa', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4279, N'Thị xã Bỉm Sơn', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4280, N'Sầm Sơn', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4281, N'Mường Lát', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4282, N'Quan Hóa', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4283, N'Bá Thước', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4284, N'Quan Sơn', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4285, N'Lang Chánh', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4286, N'Ngọc Lặc', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4287, N'Cẩm Thủy', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4288, N'Thạch Thành', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4289, N'Hà Trung', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4290, N'Vĩnh Lộc', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4291, N'Yên Định', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4292, N'Thọ Xuân', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4293, N'Thường Xuân', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4294, N'Triệu Sơn', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4295, N'Thiệu Hóa', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4296, N'Hoằng Hóa', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4297, N'Hậu Lộc', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4298, N'Nga Sơn', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4299, N'Như Xuân', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4300, N'Như Thanh', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4301, N'Nông Cống', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4302, N'Đông Sơn', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4303, N'Quảng Xương', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4304, N'Tĩnh Gia', 1, 3040)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4305, N'Vinh', 1, 3041)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4306, N'Thị xã Cửa Lò', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4307, N'Thị xã Thái Hoà', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4308, N'Quế Phong', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4309, N'Quỳ Châu', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4310, N'Kỳ Sơn', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4311, N'Tương Dương', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4312, N'Nghĩa Đàn', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4313, N'Quỳ Hợp', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4314, N'Quỳnh Lưu', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4315, N'Con Cuông', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4316, N'Tân Kỳ', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4317, N'Anh Sơn', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4318, N'Diễn Châu', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4319, N'Yên Thành', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4320, N'Đô Lương', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4321, N'Thanh Chương', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4322, N'Nghi Lộc', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4323, N'Nam Đàn', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4324, N'Hưng Nguyên', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4325, N'Thị xã Hoàng Mai', 1, 3041)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4326, N'Hà Tĩnh', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4327, N'Thị xã Hồng Lĩnh', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4328, N'Hương Sơn', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4329, N'Đức Thọ', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4330, N'Vũ Quang', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4331, N'Nghi Xuân', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4332, N'Can Lộc', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4333, N'Hương Khê', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4334, N'Thạch Hà', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4335, N'Cẩm Xuyên', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4336, N'Thị xã Kỳ Anh', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4337, N'Lộc Hà', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4338, N'Kỳ Anh', 1, 3042)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4339, N'Đồng Hới', 1, 3043)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4340, N'Minh Hóa', 1, 3043)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4341, N'Tuyên Hóa', 1, 3043)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4342, N'Quảng Trạch', 1, 3043)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4343, N'Bố Trạch', 1, 3043)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4344, N'Quảng Ninh', 1, 3043)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4345, N'Lệ Thủy', 1, 3043)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4346, N'Thị xã Ba Đồn', 1, 3043)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4347, N'Đông Hà', 1, 3044)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4348, N'Thị xã Quảng Trị', 1, 3044)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4349, N'Vĩnh Linh', 1, 3044)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4350, N'Hướng Hóa', 1, 3044)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4351, N'Gio Linh', 1, 3044)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4352, N'Đa Krông', 1, 3044)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4353, N'Cam Lộ', 1, 3044)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4354, N'Triệu Phong', 1, 3044)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4355, N'Hải Lăng', 1, 3044)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4356, N'Cồn Cỏ', 1, 3044)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4357, N'Huế', 1, 3045)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4358, N'Phong Điền', 1, 3045)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4359, N'Quảng Điền', 1, 3045)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4360, N'Phú Vang', 1, 3045)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4361, N'Thị xã Hương Thủy', 1, 3045)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4362, N'Thị xã Hương Trà', 1, 3045)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4363, N'A Lưới', 1, 3045)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4364, N'Phú Lộc', 1, 3045)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4365, N'Nam Đông', 1, 3045)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4366, N'Quận Liên Chiểu', 1, 3046)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4367, N'Quận Thanh Khê', 1, 3046)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4368, N'Quận Hải Châu', 1, 3046)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4369, N'Quận Sơn Trà', 1, 3046)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4370, N'Quận Ngũ Hành Sơn', 1, 3046)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4371, N'Quận Cẩm Lệ', 1, 3046)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4372, N'Hòa Vang', 1, 3046)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4373, N'Hoàng Sa', 1, 3046)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4374, N'Tam Kỳ', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4375, N'Hội An', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4376, N'Tây Giang', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4377, N'Đông Giang', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4378, N'Đại Lộc', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4379, N'Thị xã Điện Bàn', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4380, N'Duy Xuyên', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4381, N'Quế Sơn', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4382, N'Nam Giang', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4383, N'Phước Sơn', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4384, N'Hiệp Đức', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4385, N'Thăng Bình', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4386, N'Tiên Phước', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4387, N'Bắc Trà My', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4388, N'Nam Trà My', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4389, N'Núi Thành', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4390, N'Phú Ninh', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4391, N'Nông Sơn', 1, 3047)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4392, N'Quảng Ngãi', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4393, N'Bình Sơn', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4394, N'Trà Bồng', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4395, N'Tây Trà', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4396, N'Sơn Tịnh', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4397, N'Tư Nghĩa', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4398, N'Sơn Hà', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4399, N'Sơn Tây', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4400, N'Minh Long', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4401, N'Nghĩa Hành', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4402, N'Mộ Đức', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4403, N'Đức Phổ', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4404, N'Ba Tơ', 1, 3048)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4405, N'Lý Sơn', 1, 3048)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4406, N'Qui Nhơn', 1, 3049)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4407, N'An Lão', 1, 3049)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4408, N'Hoài Nhơn', 1, 3049)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4409, N'Hoài Ân', 1, 3049)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4410, N'Phù Mỹ', 1, 3049)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4411, N'Vĩnh Thạnh', 1, 3049)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4412, N'Tây Sơn', 1, 3049)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4413, N'Phù Cát', 1, 3049)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4414, N'Thị xã An Nhơn', 1, 3049)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4415, N'Tuy Phước', 1, 3049)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4416, N'Vân Canh', 1, 3049)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4417, N'Tuy Hoà', 1, 3050)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4418, N'Thị xã Sông Cầu', 1, 3050)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4419, N'Đồng Xuân', 1, 3050)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4420, N'Tuy An', 1, 3050)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4421, N'Sơn Hòa', 1, 3050)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4422, N'Sông Hinh', 1, 3050)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4423, N'Tây Hoà', 1, 3050)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4424, N'Phú Hoà', 1, 3050)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4425, N'Đông Hòa', 1, 3050)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4426, N'Nha Trang', 1, 3051)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4427, N'Cam Ranh', 1, 3051)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4428, N'Cam Lâm', 1, 3051)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4429, N'Vạn Ninh', 1, 3051)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4430, N'Thị xã Ninh Hòa', 1, 3051)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4431, N'Khánh Vĩnh', 1, 3051)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4432, N'Diên Khánh', 1, 3051)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4433, N'Khánh Sơn', 1, 3051)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4434, N'Trường Sa', 1, 3051)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4435, N'Phan Rang-Tháp Chàm', 1, 3052)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4436, N'Bác Ái', 1, 3052)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4437, N'Ninh Sơn', 1, 3052)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4438, N'Ninh Hải', 1, 3052)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4439, N'Ninh Phước', 1, 3052)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4440, N'Thuận Bắc', 1, 3052)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4441, N'Thuận Nam', 1, 3052)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4442, N'Phan Thiết', 1, 3053)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4443, N'Thị xã La Gi', 1, 3053)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4444, N'Tuy Phong', 1, 3053)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4445, N'Bắc Bình', 1, 3053)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4446, N'Hàm Thuận Bắc', 1, 3053)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4447, N'Hàm Thuận Nam', 1, 3053)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4448, N'Tánh Linh', 1, 3053)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4449, N'Đức Linh', 1, 3053)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4450, N'Hàm Tân', 1, 3053)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4451, N'Phú Quí', 1, 3053)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4452, N'Kon Tum', 1, 3054)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4453, N'Đắk Glei', 1, 3054)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4454, N'Ngọc Hồi', 1, 3054)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4455, N'Đắk Tô', 1, 3054)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4456, N'Kon Plông', 1, 3054)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4457, N'Kon Rẫy', 1, 3054)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4458, N'Đắk Hà', 1, 3054)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4459, N'Sa Thầy', 1, 3054)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4460, N'Tu Mơ Rông', 1, 3054)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4461, N'Ia H Drai', 1, 3054)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4462, N'Pleiku', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4463, N'Thị xã An Khê', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4464, N'Thị xã Ayun Pa', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4465, N'KBang', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4466, N'Đăk Đoa', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4467, N'Chư Păh', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4468, N'Ia Grai', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4469, N'Mang Yang', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4470, N'Kông Chro', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4471, N'Đức Cơ', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4472, N'Chư Prông', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4473, N'Chư Sê', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4474, N'Đăk Pơ', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4475, N'Ia Pa', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4476, N'Krông Pa', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4477, N'Phú Thiện', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4478, N'Chư Pưh', 1, 3055)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4479, N'Buôn Ma Thuột', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4480, N'Thị Xã Buôn Hồ', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4481, N'Ea H leo', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4482, N'Ea Súp', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4483, N'Buôn Đôn', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4484, N'Cư M gar', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4485, N'Krông Búk', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4486, N'Krông Năng', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4487, N'Ea Kar', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4488, N'M Đrắk', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4489, N'Krông Bông', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4490, N'Krông Pắc', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4491, N'Krông A Na', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4492, N'Lắk', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4493, N'Cư Kuin', 1, 3056)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4494, N'Thị xã Gia Nghĩa', 1, 3057)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4495, N'Đăk Glong', 1, 3057)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4496, N'Cư Jút', 1, 3057)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4497, N'Đắk Mil', 1, 3057)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4498, N'Krông Nô', 1, 3057)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4499, N'Đắk Song', 1, 3057)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4500, N'Đắk R Lấp', 1, 3057)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4501, N'Tuy Đức', 1, 3057)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4502, N'Đà Lạt', 1, 3058)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4503, N'Bảo Lộc', 1, 3058)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4504, N'Đam Rông', 1, 3058)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4505, N'Lạc Dương', 1, 3058)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4506, N'Lâm Hà', 1, 3058)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4507, N'Đơn Dương', 1, 3058)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4508, N'Đức Trọng', 1, 3058)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4509, N'Di Linh', 1, 3058)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4510, N'Bảo Lâm', 1, 3058)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4511, N'Đạ Huoai', 1, 3058)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4512, N'Đạ Tẻh', 1, 3058)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4513, N'Cát Tiên', 1, 3058)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4514, N'Thị xã Phước Long', 1, 3059)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4515, N'Đồng Xoài', 1, 3059)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4516, N'Thị xã Bình Long', 1, 3059)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4517, N'Bù Gia Mập', 1, 3059)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4518, N'Lộc Ninh', 1, 3059)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4519, N'Bù Đốp', 1, 3059)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4520, N'Hớn Quản', 1, 3059)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4521, N'Đồng Phú', 1, 3059)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4522, N'Bù Đăng', 1, 3059)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4523, N'Chơn Thành', 1, 3059)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4524, N'Phú Riềng', 1, 3059)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4525, N'Tây Ninh', 1, 3060)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4526, N'Tân Biên', 1, 3060)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4527, N'Tân Châu', 1, 3060)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4528, N'Dương Minh Châu', 1, 3060)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4529, N'Châu Thành', 1, 3060)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4530, N'Hòa Thành', 1, 3060)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4531, N'Gò Dầu', 1, 3060)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4532, N'Bến Cầu', 1, 3060)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4533, N'Trảng Bàng', 1, 3060)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4534, N'Thủ Dầu Một', 1, 3061)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4535, N'Bàu Bàng', 1, 3061)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4536, N'Dầu Tiếng', 1, 3061)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4537, N'Thị xã Bến Cát', 1, 3061)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4538, N'Phú Giáo', 1, 3061)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4539, N'Thị xã Tân Uyên', 1, 3061)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4540, N'Thị xã Dĩ An', 1, 3061)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4541, N'Thị xã Thuận An', 1, 3061)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4542, N'Bắc Tân Uyên', 1, 3061)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4543, N'Biên Hòa', 1, 3062)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4544, N'Long Khánh', 1, 3062)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4545, N'Tân Phú', 1, 3062)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4546, N'Vĩnh Cửu', 1, 3062)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4547, N'Định Quán', 1, 3062)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4548, N'Trảng Bom', 1, 3062)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4549, N'Thống Nhất', 1, 3062)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4550, N'Cẩm Mỹ', 1, 3062)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4551, N'Long Thành', 1, 3062)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4552, N'Xuân Lộc', 1, 3062)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4553, N'Nhơn Trạch', 1, 3062)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4554, N'Vũng Tàu', 1, 3063)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4555, N'Bà Rịa', 1, 3063)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4556, N'Châu Đức', 1, 3063)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4557, N'Xuyên Mộc', 1, 3063)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4558, N'Long Điền', 1, 3063)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4559, N'Đất Đỏ', 1, 3063)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4560, N'Thị xã Phú Mỹ', 1, 3063)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4561, N'Côn Đảo', 1, 3063)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4562, N'Quận 1', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4563, N'Quận 12', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4564, N'Quận Thủ Đức', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4565, N'Quận 9', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4566, N'Quận Gò Vấp', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4567, N'Quận Bình Thạnh', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4568, N'Quận Tân Bình', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4569, N'Quận Tân Phú', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4570, N'Quận Phú Nhuận', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4571, N'Quận 2', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4572, N'Quận 3', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4573, N'Quận 10', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4574, N'Quận 11', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4575, N'Quận 4', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4576, N'Quận 5', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4577, N'Quận 6', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4578, N'Quận 8', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4579, N'Quận Bình Tân', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4580, N'Quận 7', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4581, N'Củ Chi', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4582, N'Hóc Môn', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4583, N'Bình Chánh', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4584, N'Nhà Bè', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4585, N'Cần Giờ', 1, 3064)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4586, N'Tân An', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4587, N'Thị xã Kiến Tường', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4588, N'Tân Hưng', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4589, N'Vĩnh Hưng', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4590, N'Mộc Hóa', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4591, N'Tân Thạnh', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4592, N'Thạnh Hóa', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4593, N'Đức Huệ', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4594, N'Đức Hòa', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4595, N'Bến Lức', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4596, N'Thủ Thừa', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4597, N'Tân Trụ', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4598, N'Cần Đước', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4599, N'Cần Giuộc', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4600, N'Châu Thành', 1, 3065)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4601, N'Mỹ Tho', 1, 3066)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4602, N'Thị xã Gò Công', 1, 3066)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4603, N'Thị xã Cai Lậy', 1, 3066)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4604, N'Tân Phước', 1, 3066)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4605, N'Cái Bè', 1, 3066)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4606, N'Cai Lậy', 1, 3066)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4607, N'Châu Thành', 1, 3066)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4608, N'Chợ Gạo', 1, 3066)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4609, N'Gò Công Tây', 1, 3066)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4610, N'Gò Công Đông', 1, 3066)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4611, N'Tân Phú Đông', 1, 3066)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4612, N'Bến Tre', 1, 3067)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4613, N'Châu Thành', 1, 3067)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4614, N'Chợ Lách', 1, 3067)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4615, N'Mỏ Cày Nam', 1, 3067)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4616, N'Giồng Trôm', 1, 3067)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4617, N'Bình Đại', 1, 3067)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4618, N'Ba Tri', 1, 3067)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4619, N'Thạnh Phú', 1, 3067)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4620, N'Mỏ Cày Bắc', 1, 3067)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4621, N'Trà Vinh', 1, 3068)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4622, N'Càng Long', 1, 3068)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4623, N'Cầu Kè', 1, 3068)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4624, N'Tiểu Cần', 1, 3068)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4625, N'Châu Thành', 1, 3068)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4626, N'Cầu Ngang', 1, 3068)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4627, N'Trà Cú', 1, 3068)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4628, N'Thị xã Duyên Hải', 1, 3068)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4629, N'Duyên Hải', 1, 3068)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4630, N'Vĩnh Long', 1, 3069)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4631, N'Long Hồ', 1, 3069)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4632, N'Mang Thít', 1, 3069)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4633, N'Vũng Liêm', 1, 3069)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4634, N'Tam Bình', 1, 3069)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4635, N'Thị xã Bình Minh', 1, 3069)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4636, N'Trà Ôn', 1, 3069)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4637, N'Bình Tân', 1, 3069)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4638, N'Cao Lãnh', 1, 3070)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4639, N'Sa Đéc', 1, 3070)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4640, N'Thị xã Hồng Ngự', 1, 3070)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4641, N'Tân Hồng', 1, 3070)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4642, N'Hồng Ngự', 1, 3070)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4643, N'Tam Nông', 1, 3070)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4644, N'Tháp Mười', 1, 3070)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4645, N'Cao Lãnh', 1, 3070)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4646, N'Thanh Bình', 1, 3070)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4647, N'Lấp Vò', 1, 3070)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4648, N'Lai Vung', 1, 3070)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4649, N'Châu Thành', 1, 3070)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4650, N'Long Xuyên', 1, 3071)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4651, N'Châu Đốc', 1, 3071)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4652, N'An Phú', 1, 3071)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4653, N'Thị xã Tân Châu', 1, 3071)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4654, N'Phú Tân', 1, 3071)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4655, N'Châu Phú', 1, 3071)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4656, N'Tịnh Biên', 1, 3071)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4657, N'Tri Tôn', 1, 3071)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4658, N'Châu Thành', 1, 3071)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4659, N'Chợ Mới', 1, 3071)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4660, N'Thoại Sơn', 1, 3071)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4661, N'Rạch Giá', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4662, N'Hà Tiên', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4663, N'Kiên Lương', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4664, N'Hòn Đất', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4665, N'Tân Hiệp', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4666, N'Châu Thành', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4667, N'Giồng Riềng', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4668, N'Gò Quao', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4669, N'An Biên', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4670, N'An Minh', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4671, N'Vĩnh Thuận', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4672, N'Phú Quốc', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4673, N'Kiên Hải', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4674, N'U Minh Thượng', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4675, N'Giang Thành', 1, 3072)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4676, N'Quận Ninh Kiều', 1, 3073)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4677, N'Quận Ô Môn', 1, 3073)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4678, N'Quận Bình Thuỷ', 1, 3073)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4679, N'Quận Cái Răng', 1, 3073)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4680, N'Quận Thốt Nốt', 1, 3073)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4681, N'Vĩnh Thạnh', 1, 3073)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4682, N'Cờ Đỏ', 1, 3073)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4683, N'Phong Điền', 1, 3073)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4684, N'Thới Lai', 1, 3073)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4685, N'Vị Thanh', 1, 3074)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4686, N'Thị xã Ngã Bảy', 1, 3074)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4687, N'Châu Thành A', 1, 3074)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4688, N'Châu Thành', 1, 3074)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4689, N'Phụng Hiệp', 1, 3074)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4690, N'Vị Thuỷ', 1, 3074)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4691, N'Thị xã Long Mỹ', 1, 3074)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4692, N'Long Mỹ', 1, 3074)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4693, N'Sóc Trăng', 1, 3075)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4694, N'Châu Thành', 1, 3075)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4695, N'Kế Sách', 1, 3075)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4696, N'Mỹ Tú', 1, 3075)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4697, N'Cù Lao Dung', 1, 3075)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4698, N'Long Phú', 1, 3075)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4699, N'Mỹ Xuyên', 1, 3075)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4700, N'Thị xã Ngã Năm', 1, 3075)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4701, N'Thạnh Trị', 1, 3075)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4702, N'Thị xã Vĩnh Châu', 1, 3075)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4703, N'Trần Đề', 1, 3075)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4704, N'Bạc Liêu', 1, 3076)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4705, N'Hồng Dân', 1, 3076)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4706, N'Phước Long', 1, 3076)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4707, N'Vĩnh Lợi', 1, 3076)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4708, N'Thị xã Giá Rai', 1, 3076)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4709, N'Đông Hải', 1, 3076)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4710, N'Hoà Bình', 1, 3076)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4711, N'Cà Mau', 1, 3077)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4712, N'U Minh', 1, 3077)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4713, N'Thới Bình', 1, 3077)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4714, N'Trần Văn Thời', 1, 3077)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4715, N'Cái Nước', 1, 3077)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4716, N'Đầm Dơi', 1, 3077)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4717, N'Năm Căn', 1, 3077)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4718, N'Phú Tân', 1, 3077)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [Status], [ProvinceID]) VALUES (4719, N'Ngọc Hiển', 1, 3077)
SET IDENTITY_INSERT [dbo].[District] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageProduct] ON 

INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2071, 1041, N'~/Image/large_OMLC004E190200303031_1.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2072, 1041, N'~/Image/large_OMLC004E190200303031_2.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2073, 1042, N'~/Image/large_OWLA008F19A280503000_001.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2074, 1042, N'~/Image/large_OWLA008F19A280503000_002.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2075, 1045, N'~/Image/large_OMLB008R194000320210_2.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2076, 1045, N'~/Image/large_OMLB008R194000320210_1.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2077, 1045, N'~/Image/large_OMLB008R194000320210_3.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2078, 1047, N'~/Image/large_IMG_0007.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2079, 1047, N'~/Image/large_IMG_0004.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2080, 1047, N'~/Image/13526133_17537615_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2081, 1048, N'~/Image/13526123_16043140_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2082, 1048, N'~/Image/13526123_16043139_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2083, 1049, N'~/Image/13684001_16588998_480.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2084, 1049, N'~/Image/13684001_16588991_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2087, 1052, N'~/Image/13467952_15672474_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2088, 1052, N'~/Image/13467952_15672472_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2092, 1050, N'~/Image/13467950_15672453_480.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2100, 1067, N'~/Image/riverlake.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2101, 1067, N'~/Image/13480730_18052609_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2102, 1067, N'~/Image/13480730_18052618_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2105, 1030, N'~/Image/13494260_15833111_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2106, 1018, N'~/Image/13480726_16540260_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2107, 1018, N'~/Image/13480726_16540257_480.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2108, 1018, N'~/Image/13480726_16540261_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2109, 1022, N'~/Image/13727966_16677884_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2110, 1022, N'~/Image/13727966_16677880_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2111, 1022, N'~/Image/13727966_16677882_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2112, 1023, N'~/Image/13545082_16086941_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2113, 1023, N'~/Image/13545082_16086937_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2114, 1023, N'~/Image/13545082_16086943_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2115, 1024, N'~/Image/13484176_15824289_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2116, 1024, N'~/Image/13484176_15824285_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2117, 1024, N'~/Image/13484176_15824291_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2118, 1025, N'~/Image/13835717_17423480_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2119, 1025, N'~/Image/13835717_17423478_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2120, 1025, N'~/Image/13835717_17423479_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2121, 1027, N'~/Image/13682746_16577142_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2122, 1027, N'~/Image/13682746_16577140_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2123, 1027, N'~/Image/13682746_16577141_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2124, 1028, N'~/Image/13940933_18630974_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2125, 1028, N'~/Image/13940933_18630971_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2126, 1028, N'~/Image/13940933_18630976_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2127, 1031, N'~/Image/13490563_15826079_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2128, 1031, N'~/Image/13490563_15826077_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2129, 1031, N'~/Image/13490563_15826078_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2130, 1032, N'~/Image/13462542_15682674_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2131, 1032, N'~/Image/13462542_15682676_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2132, 1032, N'~/Image/13462542_15682664_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2133, 1035, N'~/Image/13940967_18634700_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2134, 1035, N'~/Image/13940967_18634688_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2135, 1035, N'~/Image/13940967_18634708_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2138, 1050, N'~/Image/13467950_15672455_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2139, 1038, N'~/Image/14138932_18923416_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2140, 1038, N'~/Image/14138932_18923398_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2141, 1038, N'~/Image/14138932_18923423_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2142, 1039, N'~/Image/13849339_17299217_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2143, 1039, N'~/Image/13849339_17299213_480.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2144, 1039, N'~/Image/13849339_17299218_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2145, 1036, N'~/Image/13490549_15826072_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2146, 1036, N'~/Image/13490549_15826068_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2147, 1036, N'~/Image/13490549_15826074_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2148, 1037, N'~/Image/13689808_16653768_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2149, 1037, N'~/Image/13689808_16653766_480.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2150, 1037, N'~/Image/13689808_16653769_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2151, 1030, N'~/Image/13494260_15833107_1000.jpg')
INSERT [dbo].[ImageProduct] ([ImageID], [ProductID], [Image]) VALUES (2152, 1030, N'~/Image/13494260_15833113_1000.jpg')
SET IDENTITY_INSERT [dbo].[ImageProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [DateCreate], [Status], [Note], [UserID]) VALUES (1022, CAST(N'2019-06-25T15:53:49.617' AS DateTime), 1, NULL, 1045)
INSERT [dbo].[Order] ([OrderID], [DateCreate], [Status], [Note], [UserID]) VALUES (1023, CAST(N'2019-06-25T16:01:59.017' AS DateTime), 1, N'test', 1047)
INSERT [dbo].[Order] ([OrderID], [DateCreate], [Status], [Note], [UserID]) VALUES (1024, CAST(N'2019-06-25T16:07:47.487' AS DateTime), 1, NULL, 1049)
INSERT [dbo].[Order] ([OrderID], [DateCreate], [Status], [Note], [UserID]) VALUES (1025, CAST(N'2019-06-25T16:15:39.447' AS DateTime), 1, NULL, 1050)
INSERT [dbo].[Order] ([OrderID], [DateCreate], [Status], [Note], [UserID]) VALUES (1026, CAST(N'2019-06-27T09:18:06.790' AS DateTime), 4, NULL, 1033)
INSERT [dbo].[Order] ([OrderID], [DateCreate], [Status], [Note], [UserID]) VALUES (1027, CAST(N'2019-06-27T11:25:42.747' AS DateTime), 4, NULL, 1033)
INSERT [dbo].[Order] ([OrderID], [DateCreate], [Status], [Note], [UserID]) VALUES (1028, CAST(N'2019-06-27T11:26:37.363' AS DateTime), 4, NULL, 1051)
INSERT [dbo].[Order] ([OrderID], [DateCreate], [Status], [Note], [UserID]) VALUES (1029, CAST(N'2019-06-28T10:39:50.700' AS DateTime), 3, N'test', 1052)
INSERT [dbo].[Order] ([OrderID], [DateCreate], [Status], [Note], [UserID]) VALUES (1030, CAST(N'2019-06-28T15:27:37.517' AS DateTime), 1, N'hiếu test', 1053)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1022, 4020, 1, 2250000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1023, 4020, 1, 2250000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1024, 4020, 1, 2250000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1029, 4084, 1, 2500000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1030, 4087, 1, 2000000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1025, 4020, 1, 2250000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1026, 4020, 1, 2250000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1026, 4021, 1, 2250000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1026, 4008, 1, 2250000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1026, 4009, 1, 2250000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1027, 4065, 2, 2400000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1027, 4066, 1, 1200000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1028, 4065, 1, 1200000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductItemID], [AmountBuy], [Total]) VALUES (1028, 4066, 1, 1200000)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1018, N'OFF-WHITE
oversized Impressionism ', N'White oversized Impressionism T-shirt from Off-White.', 1200000.0000, 1, 2, 5, CAST(N'2019-04-25T00:00:02.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1022, N'OFF-WHITE Travis Scott Astroworld', N'White cotton graphic print T-shirt from Travis Scott Astroworld featuring a ribbed round neck, short sleeves, a chest pocket, a relaxed fit, a straight hem and graphic prints to the front and back.', 1200000.0000, 1, 2, 5, CAST(N'2019-04-24T00:00:04.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1023, N'OFF-WHITE
Summer printed T-shirt', N'Inspired by the youth culture, Off- White links the gap between streetwear and high-end fashion. Crafted from black cotton, this Summer printed T-shirt from Off-White features a round neck, short sleeves, a graphic print, a straight hem and an oversized fit.', 1200000.0000, 1, 2, 5, CAST(N'2019-04-24T00:00:05.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1024, N'OFF-WHITE
Impressionism print', N'Off-White was conceived to bridge the gap between streetwear and high fashion. Needless to say, it has been a successful endeavor, putting out inspired pieces like this black cotton Impressionism print T-shirt featuring a round neck, short sleeves, a straight fit and front text and face prints.', 1200000.0000, 1, 2, 5, CAST(N'2019-04-24T00:00:06.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1025, N'OFF-WHITE
Dondi print', N'Founded in 2013 by DJ and fashion designer Virgil Abloh, the Milan based fashion label Off-White was conceived to link the gap between streetwear and high fashion. This T-shirt is crafted from white cotton and is part of a small collection dedicated to New York street artist Dondi White. Featuring an oversized fit, a crew neck, short sleeves and prints to the front and back in honour of legendary graffiti artist Dondi White.', 1200000.0000, 1, 2, 5, CAST(N'2019-04-24T00:00:07.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1027, N'OFF-WHITE
The Simpsons printed', N'Lively, unique and often quirky prints, finely-detailed graphics and unusual embellishments are all part of Off-white''s particular brand of casual and streetwear. This white cotton The Simpsons printed T-shirt from Off-White features a crew neck, short sleeves, a relaxed fit and Simpsons-themed prints to the front and back.', 1200000.0000, 1, 2, 5, CAST(N'2019-04-24T00:00:09.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1028, N'OFF-WHITE
painting print', N'Headquartered in Milan, the youth-driven label Off-White is committed to redefining the meaning of streetwear within high-fashion. Taking inspiration from impressionist painting, this cotton T-shirt from Off-White feature a comfortable relaxed fit with a round neck, short sleeves and a painting-inspired print upon the reverse.', 1200000.0000, 1, 2, 5, CAST(N'2019-04-24T00:00:10.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1030, N'OFF-WHITE Ice Man', N'OFF-WHITE
Ice Man S/S T-shirt

Founded in 2013 by DJ and fashion designer Virgil Abloh, the Milan based fashion label Off-White was conceived to link the gap between streetwear and high fashion. Titled “Track and Field”, the SS19 collection is centered on athletic silhouettes, exploring tailored design without losing the streetwear vibe that Off-White is so well known for. Black cotton Ice Man S/S T-shirt from Off-White featuring a crew neck, short sleeves, a loose fit and graphic prints on the front and back.', 1200000.0000, 1, 2, 5, CAST(N'2019-04-24T00:00:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1031, N'OFF-WHITE
impressionism', N'Inspired by the youth culture, the Milan based fashion label Off-White creates statement pieces with a distinctive aesthetic. Linking streetwear and high fashion, expect punchy prints, graphic lines and laidback designs. Made from soft cotton, this black impressionism shirt from Off-White showcases a front button fastening, flap and button pockets to the chest, an impressionist painting print to the rear, button cuffs and a loose fit.', 2000000.0000, 1, 2, 1, CAST(N'2019-04-24T00:00:13.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1032, N'OFF-WHITE
stencil plaid flannel', N'Lively, unique and often quirky prints, finely-detailed graphics and unusual embellishments are all part of Off-white''s particular brand of casual and streetwear. This red and black cotton blend stencil plaid flannel shirt from Off-White features a pointed collar, a front button fastening, long sleeves, a straight fit, buttoned flap chest pockets and a contrast arrow print to the back.', 2000000.0000, 1, 2, 1, CAST(N'2019-04-24T00:00:14.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1035, N'OFF-WHITE
plaid two-layer', N'Headquartered in Milan, the youth-driven label Off-White is committed to redefine the meaning of streetwear within high-fashion. For this AW19 collection, Virgil Abloh wants to adapt the way young people wear streetwear while changing the rules of the classic wardrobe. This two-layered design appears as a plaid shirt upon a soft knitted sweatshirt, complete with a front button fastening, long sleeves and a chest pocket.', 2000000.0000, 1, 2, 1, CAST(N'2019-04-24T00:00:17.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1036, N'OFF-WHITE
zip appliqué ', N'The Milan-based fashion and lifestyle label Off-White is mainly inspired by the youth culture. Drawing influences from sportswear and hip-hop, expect punchy prints, graphic lines and laidback designs. Sporting an over the knee length, these black denim shorts from Off-White are detailed with distressed details and a zip appliqué detail to the front. Carefully constructed in Italy, this sleek pair showcases a tie waist, a button and zip fly, two back patch pockets, a leather brand patch to the rear and a small white-tone printed logo to the front.', 1500000.0000, 1, 3, 6, CAST(N'2019-04-24T00:00:18.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1037, N'OFF-WHITE
logo jogging', N'NULLFounded in 2013 by DJ and fashion designer Virgil Abloh, the Milan based fashion label Off-White was conceived to link the gap between streetwear and high fashion. These black cotton logo jogging shorts feature a mid rise, an elasticated waistband, a front embossed logo stamp and side pockets.', 1500000.0000, 1, 3, 6, CAST(N'2019-04-24T00:00:19.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1038, N'OFF-WHITE
logo print track', N'Inspired by the youth culture, the Milan based fashion label Off-White creates statement pieces with a distinctive aesthetic. Linking streetwear and high fashion, expect punchy prints, graphic lines and laidback designs. Crafted from cotton, these track trousers feature and elasticated waistband, side slit pockets and gathered ankles.', 1500000.0000, 1, 3, 7, CAST(N'2019-04-24T00:00:20.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1039, N'OFF-WHITE
low-crotch straight-leg', N'Born from the antithesis between streetwear and high fashion, Off-White set out to combine both. Inspired by youth culture, Off-White creates statement pieces with a distinctive aesthetic - and these black cotton low-crotch straight-leg jeans are the perfect example. Featuring belt loops, a concealed front fastening, a five pocket design, a distressed finish and a contrasting white print above the rear pocket. This design comes with a black belt with contrasting white "BELT" printed text.', 1500000.0000, 1, 3, 7, CAST(N'2019-04-24T00:00:21.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1041, N'EMBROIDERED BEANIE', NULL, 630000.0000, 1, 1005, 8, CAST(N'2019-04-24T00:00:23.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1042, N'PATCH BEANIE', NULL, 630000.0000, 1, 1005, 8, CAST(N'2019-04-24T00:00:24.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1045, N'WHITE DIAG CAP', NULL, 680000.0000, 1, 1005, 9, CAST(N'2019-04-24T00:00:27.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1047, N'BLACK DIAG CAP', NULL, 680000.0000, 1, 1005, 9, CAST(N'2019-04-24T00:00:28.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1048, N'Lake backpack', NULL, 2500000.0000, 1, 1006, 10, CAST(N'2019-04-24T00:00:29.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1049, N'Quote backpack', NULL, 2500000.0000, 1, 1006, 10, CAST(N'2019-04-24T00:00:30.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1050, N'Logo-print belt bag', NULL, 2500000.0000, 1, 1006, 11, CAST(N'2019-04-24T00:00:31.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1052, N'Logo shoulder bag', N'', 2500000.0000, 1, 1006, 11, CAST(N'2019-04-24T00:00:33.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [Status], [CatalogID], [SubCatalogID], [DateCreated]) VALUES (1067, N'OFF-WHITE Boating print', N'Reimagined street style is Off-White’s power move. Comfortable, casual-wear staples are given a fresh update with bold logos and graphics that make you think. This multicoloured cotton Boating print shirt from Off-White features a notched collar, a front button fastening and short sleeves.', 2000000.0000, 1, 2, 1, CAST(N'2019-06-26T01:10:22.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductItem] ON 

INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4008, 1031, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4009, 1031, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4010, 1031, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4011, 1032, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4012, 1032, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4013, 1032, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4020, 1035, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4021, 1035, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4022, 1035, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4023, 1036, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4024, 1036, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4025, 1036, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4026, 1037, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4027, 1037, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4028, 1037, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4029, 1038, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4030, 1038, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4031, 1038, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4032, 1039, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4033, 1039, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4034, 1039, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4038, 1018, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4039, 1018, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4040, 1018, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4050, 1022, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4051, 1022, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4052, 1022, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4053, 1023, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4054, 1023, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4055, 1023, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4056, 1024, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4057, 1024, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4058, 1024, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4059, 1025, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4060, 1025, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4061, 1025, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4065, 1027, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4066, 1027, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4067, 1027, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4068, 1028, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4069, 1028, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4070, 1028, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4074, 1030, 2, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4075, 1030, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4076, 1030, 1003, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4077, 1041, 1006, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4078, 1042, 1006, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4081, 1045, 1006, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4082, 1047, 1006, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4083, 1048, 1006, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4084, 1049, 1006, 4, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4085, 1050, 1006, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4086, 1052, 1006, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4087, 1067, 2, 4, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4088, 1067, 1002, 5, 1)
INSERT [dbo].[ProductItem] ([ProductItemID], [ProductID], [SizeID], [AmountStock], [Status]) VALUES (4089, 1067, 1003, 5, 1)
SET IDENTITY_INSERT [dbo].[ProductItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3015, N'Hà Nội', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3016, N'Hà Giang', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3017, N'Cao Bằng', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3018, N'Bắc Kạn', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3019, N'Tuyên Quang', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3020, N'Lào Cai', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3021, N'Điện Biên', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3022, N'Lai Châu', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3023, N'Sơn La', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3024, N'Yên Bái', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3025, N'Hoà Bình', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3026, N'Thái Nguyên', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3027, N'Lạng Sơn', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3028, N'Quảng Ninh', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3029, N'Bắc Giang', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3030, N'Phú Thọ', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3031, N'Vĩnh Phúc', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3032, N'Bắc Ninh', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3033, N'Hải Dương', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3034, N'Hải Phòng', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3035, N'Hưng Yên', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3036, N'Thái Bình', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3037, N'Hà Nam', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3038, N'Nam Định', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3039, N'Ninh Bình', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3040, N'Thanh Hóa', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3041, N'Nghệ An', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3042, N'Hà Tĩnh', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3043, N'Quảng Bình', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3044, N'Quảng Trị', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3045, N'Thừa Thiên Huế', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3046, N'Đà Nẵng', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3047, N'Quảng Nam', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3048, N'Quảng Ngãi', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3049, N'Bình Định', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3050, N'Phú Yên', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3051, N'Khánh Hòa', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3052, N'Ninh Thuận', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3053, N'Bình Thuận', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3054, N'Kon Tum', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3055, N'Gia Lai', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3056, N'Đắk Lắk', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3057, N'Đắk Nông', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3058, N'Lâm Đồng', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3059, N'Bình Phước', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3060, N'Tây Ninh', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3061, N'Bình Dương', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3062, N'Đồng Nai', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3063, N'Bà Rịa - Vũng Tàu', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3064, N'Hồ Chí Minh', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3065, N'Long An', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3066, N'Tiền Giang', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3067, N'Bến Tre', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3068, N'Trà Vinh', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3069, N'Vĩnh Long', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3070, N'Đồng Tháp', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3071, N'An Giang', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3072, N'Kiên Giang', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3073, N'Cần Thơ', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3074, N'Hậu Giang', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3075, N'Sóc Trăng', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3076, N'Bạc Liêu', 1)
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName], [Status]) VALUES (3077, N'Cà Mau', 1)
SET IDENTITY_INSERT [dbo].[Province] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([SizeID], [SizeName], [Status]) VALUES (1, N'Size XS', 1)
INSERT [dbo].[Size] ([SizeID], [SizeName], [Status]) VALUES (2, N'Size S', 1)
INSERT [dbo].[Size] ([SizeID], [SizeName], [Status]) VALUES (1002, N'Size M', 1)
INSERT [dbo].[Size] ([SizeID], [SizeName], [Status]) VALUES (1003, N'Size L', 1)
INSERT [dbo].[Size] ([SizeID], [SizeName], [Status]) VALUES (1004, N'Size XL', 1)
INSERT [dbo].[Size] ([SizeID], [SizeName], [Status]) VALUES (1005, N'Size XXL', 1)
INSERT [dbo].[Size] ([SizeID], [SizeName], [Status]) VALUES (1006, N'Free Size', 1)
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCatalog] ON 

INSERT [dbo].[SubCatalog] ([SubCatalogID], [SubCatalogName], [Status], [CatalogID]) VALUES (1, N'Sơ mi', 1, 2)
INSERT [dbo].[SubCatalog] ([SubCatalogID], [SubCatalogName], [Status], [CatalogID]) VALUES (5, N'Áo phông', 1, 2)
INSERT [dbo].[SubCatalog] ([SubCatalogID], [SubCatalogName], [Status], [CatalogID]) VALUES (6, N'Short', 1, 3)
INSERT [dbo].[SubCatalog] ([SubCatalogID], [SubCatalogName], [Status], [CatalogID]) VALUES (7, N'Jeans', 1, 3)
INSERT [dbo].[SubCatalog] ([SubCatalogID], [SubCatalogName], [Status], [CatalogID]) VALUES (8, N'Mũ len', 1, 1005)
INSERT [dbo].[SubCatalog] ([SubCatalogID], [SubCatalogName], [Status], [CatalogID]) VALUES (9, N'Mũ lưỡi trai', 1, 1005)
INSERT [dbo].[SubCatalog] ([SubCatalogID], [SubCatalogName], [Status], [CatalogID]) VALUES (10, N'Balo', 1, 1006)
INSERT [dbo].[SubCatalog] ([SubCatalogID], [SubCatalogName], [Status], [CatalogID]) VALUES (11, N'Túi chéo', 1, 1006)
SET IDENTITY_INSERT [dbo].[SubCatalog] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Account], [Password], [FullName], [PhoneNumber], [Email], [Address], [ProvinceID], [DistrictID]) VALUES (1033, N'thiennbm', N'thien', N'Ngô Bá Minh Thiên', N'0352398695', N'minhthien@gmail.com', N'ngõ 295, Bạch Mai, Hai Bà Trưng, Hà Nội', 3015, 4013)
INSERT [dbo].[User] ([UserID], [Account], [Password], [FullName], [PhoneNumber], [Email], [Address], [ProvinceID], [DistrictID]) VALUES (1045, NULL, NULL, N'thiennbm', N'0352398695', N'thien@gmail.com', N'ha noi', 3015, 4012)
INSERT [dbo].[User] ([UserID], [Account], [Password], [FullName], [PhoneNumber], [Email], [Address], [ProvinceID], [DistrictID]) VALUES (1047, NULL, NULL, N'hieu', N'0352398695', N'thien@gmail.com', N'ha noi', 3015, 4012)
INSERT [dbo].[User] ([UserID], [Account], [Password], [FullName], [PhoneNumber], [Email], [Address], [ProvinceID], [DistrictID]) VALUES (1049, NULL, NULL, N'thien', N'0352398695', N'thien@gmail.com', N'ha noi', 3015, 4012)
INSERT [dbo].[User] ([UserID], [Account], [Password], [FullName], [PhoneNumber], [Email], [Address], [ProvinceID], [DistrictID]) VALUES (1050, NULL, NULL, N'thien', N'0352398695', N'thien@gmail.com', N'ha noi', 3015, 4012)
INSERT [dbo].[User] ([UserID], [Account], [Password], [FullName], [PhoneNumber], [Email], [Address], [ProvinceID], [DistrictID]) VALUES (1051, NULL, NULL, N'Hoàng Trọng hiếu', N'0352398695', N'hieu@gmail.com', N'Hà Nội', 3015, 4015)
INSERT [dbo].[User] ([UserID], [Account], [Password], [FullName], [PhoneNumber], [Email], [Address], [ProvinceID], [DistrictID]) VALUES (1052, NULL, NULL, N'tesst', N'0352398695', N'thien@gmail.com', N'Hà Nội', 3015, 4012)
INSERT [dbo].[User] ([UserID], [Account], [Password], [FullName], [PhoneNumber], [Email], [Address], [ProvinceID], [DistrictID]) VALUES (1053, NULL, NULL, N'Vũ Minh Hiếu', N'0352398695', N'hieu@gmail.com', N'Hà Nội', 3015, 4031)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[District] ADD  CONSTRAINT [DF_District_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Province] ADD  CONSTRAINT [DF_Province_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Size] ADD  CONSTRAINT [DF_Size_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_Province]
GO
ALTER TABLE [dbo].[ImageProduct]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ImageProduct] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_UserOrder_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_UserOrder_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductItem] FOREIGN KEY([ProductItemID])
REFERENCES [dbo].[ProductItem] ([ProductItemID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductItem]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_UserOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_UserOrder]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Catalog] FOREIGN KEY([CatalogID])
REFERENCES [dbo].[Catalog] ([CatalogID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Catalog]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCatalog] FOREIGN KEY([SubCatalogID])
REFERENCES [dbo].[SubCatalog] ([SubCatalogID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCatalog]
GO
ALTER TABLE [dbo].[ProductItem]  WITH CHECK ADD  CONSTRAINT [FK_ProductItem_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductItem] CHECK CONSTRAINT [FK_ProductItem_Product]
GO
ALTER TABLE [dbo].[ProductItem]  WITH CHECK ADD  CONSTRAINT [FK_ProductItem_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[ProductItem] CHECK CONSTRAINT [FK_ProductItem_Size]
GO
ALTER TABLE [dbo].[SubCatalog]  WITH CHECK ADD  CONSTRAINT [FK_SubCatalog_Catalog] FOREIGN KEY([CatalogID])
REFERENCES [dbo].[Catalog] ([CatalogID])
GO
ALTER TABLE [dbo].[SubCatalog] CHECK CONSTRAINT [FK_SubCatalog_Catalog]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_District] FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_District]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Province]
GO
/****** Object:  StoredProcedure [dbo].[Admin_Delete]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 21/05/2019
-- Description:	Hàm xóa tài khoản admin
-- =============================================
CREATE PROCEDURE [dbo].[Admin_Delete]
	@AdminID INT = 0,						-- Id admin
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra admin có tồn tại hay không
			IF NOT EXISTS (SELECT AdminID
							FROM [dbo].Admin WITH (NOLOCK)
							WHERE AdminID = @AdminID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại tài khoản';
					RETURN;
				END
			
			-- Thực hiện việc xóa
			ELSE
				BEGIN
					DELETE FROM Admin
					WHERE AdminID = @AdminID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY

		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Admin_GetAll]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 20/5/2019
-- Description:	Hàm lấy ra tất cả dữ liệu bảng admin
-- =============================================
CREATE PROCEDURE [dbo].[Admin_GetAll]
	--@Role INT,								-- Quyền admin
	--@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	--@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			
					SELECT
						AdminID,
						Account,
						Password,
						Name,
						Role
					FROM [dbo].Admin WITH (NOLOCK)
					WHERE Role > 1
					ORDER BY AdminID DESC

			--IF (@Role = 1)
			--	BEGIN
			--		SELECT
			--			AdminID,
			--			Account,
			--			Password,
			--			Name,
			--			Role
			--		FROM [dbo].Admin WITH (NOLOCK)
			--		WHERE Role > 1
			--		ORDER BY AdminID DESC
			--	END
			--ELSE IF (@Role = 2)
			--	BEGIN
			--		SELECT
			--			AdminID,
			--			Account,
			--			Password,
			--			Name,
			--			Role
			--		FROM [dbo].Admin WITH (NOLOCK)
			--		WHERE Role = 3
			--		ORDER BY AdminID DESC
			--		SET @ErrorCode = N'0';
			--		SET @ErrorMessage = N'';
			--	END
		END TRY
		--=========================================
		BEGIN CATCH
			--SET @ErrorCode = ERROR_NUMBER();
			--SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Admin_GetItemById]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 21/5/2019
-- Description:	Hàm	lấy thông tin tỉnh thành theo ID
-- =============================================
CREATE PROCEDURE [dbo].[Admin_GetItemById]
	@AdminID INT = 0,						-- Id admin
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra admin có tồn tại hay không
			IF NOT EXISTS (SELECT AdminID 
							FROM [dbo].Admin WITH (NOLOCK)
							WHERE AdminID = @AdminID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại tài khoản'
					RETURN;
				END
			
			ELSE
				BEGIN
					--Lấy thông tin theo ID
					SELECT
						AdminID,
						Account,
						Password,
						Name,
						Role
					FROM [dbo].Admin WITH (NOLOCK)
					WHERE AdminID = @AdminID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END	
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Admin_Insert]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 21/5/2019
-- Description:	hàm thêm tài khoản
-- =============================================
CREATE PROCEDURE [dbo].[Admin_Insert]
	@Account NVARCHAR(50) = N'',			-- Tên tài khoản
	@Password NVARCHAR(50) = N'',			-- Mật khẩu tài khoản
	@Name NVARCHAR(500) = N'',				-- Tên người dùng
	@Role INT = 0,							-- Quyền
	--@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			IF ((@Account <> '' AND @Account IS NOT NULL)
				OR (@Password <> '' AND @Password IS NOT NULL)
				OR (@Name <> '' AND @Name IS NOT NULL)
				OR (@Role <> '' AND @Role IS NOT NULL))
				BEGIN
					IF EXISTS (SELECT AdminID
								FROM dbo.Admin WITH (NOLOCK)
								WHERE 
									((UPPER(LTRIM(RTRIM(Account))) = UPPER(LTRIM(RTRIM(@Account))))
									AND (UPPER(LTRIM(RTRIM(Role))) = UPPER(LTRIM(RTRIM(@Role))))))
						BEGIN
							--SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Tài khoản đã tồn tại !';
							RETURN;
						END	
					ELSE
						BEGIN
							INSERT INTO [dbo].Admin
								(	 
									Account
									,Password
									,Name
									,Role
								)
								VALUES 
								(	
									@Account 
									,@Password 
									,@Name
									,@Role
								)
							--SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
						END
				END
			ELSE
				BEGIN
					--SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào !';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			--SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Admin_Update]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 21/5/2019
-- Description:	Hàm cập nhật tài khoản
-- =============================================
CREATE PROCEDURE [dbo].[Admin_Update]
	@AdminID INT = 0,						-- ID tài khoản
	@Account NVARCHAR(50) = N'',			-- Tên tài khoản
	@Password NVARCHAR(50) = N'',			-- Mật khẩu tài khoản
	@Name NVARCHAR(500) = N'',				-- Tên người dùng
	@Role INT = 0,							-- Quyền
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN	
	SET NOCOUNT ON;
		BEGIN TRY
			IF NOT EXISTS(SELECT AdminID
							FROM [dbo].Admin WITH (NOLOCK)
							WHERE AdminID = @AdminID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại tài khoản !';
					RETURN;
				END

			IF ((@Account <> '' AND @Account IS NOT NULL)
				OR (@Password <> '' AND @Password IS NOT NULL)
				OR (@Name <> '' AND @Name IS NOT NULL)
				OR (@Role <> '' AND @Role IS NOT NULL))
				BEGIN
					IF EXISTS (SELECT AdminID
								FROM dbo.Admin WITH (NOLOCK)
								WHERE 
									((UPPER(LTRIM(RTRIM(Account))) = UPPER(LTRIM(RTRIM(@Account))))
									AND (UPPER(LTRIM(RTRIM(Role))) = UPPER(LTRIM(RTRIM(@Role))))
									AND (AdminID != @AdminID)))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Tài khoản đã tồn tại !';
							RETURN;
						END	
					ELSE
						BEGIN
							UPDATE [dbo].Admin
							SET	 Account = @Account
								,Password = @Password
								,Name = @Name
								,Role = @Role
							WHERE AdminID = @AdminID;
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
							RETURN;
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào!';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Catalog_Delete]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 2/4/2019
-- Description:	Hàm xóa danh mục
-- =============================================
CREATE PROCEDURE [dbo].[Catalog_Delete]
	@CatalogID INT = 0,						-- Id danh mục
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra danh mục có tồn tại hay không
			IF NOT EXISTS (SELECT CatalogID
							FROM [dbo].[Catalog] WITH (NOLOCK)
							WHERE CatalogID = @CatalogID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại danh mục';
					RETURN;
				END

			-- Kiểm tra danh mục con có tồn tại không
			IF EXISTS (
			 SELECT SC.SubCatalogID
			 FROM [dbo].[SubCatalog] AS SC WITH (NOLOCK)
			 WHERE (SC.CatalogID = @CatalogID))
			-- Kiểm tra sản phẩm có đang sử dụng không
			OR EXISTS (
			 SELECT P.ProductID
			 FROM [dbo].Product AS P WITH (NOLOCK)
			 WHERE (P.CatalogID = @CatalogID))
				BEGIN
					SET @ErrorCode = '1';
					SET @ErrorMessage = N'Có dữ liệu liên quan, không thể xóa';
					RETURN;
				END
			-- Thực hiện xóa
			ELSE
				BEGIN
					DELETE FROM [dbo].[Catalog]
					WHERE CatalogID = @CatalogID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY

		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Catalog_GetAll]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	2/4/2019
-- Description:	Hàm lấy ra tất cả dữ liệu bảng catalog
-- =============================================
CREATE PROCEDURE [dbo].[Catalog_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				CatalogID,
				CatalogName,
				Status
			FROM [dbo].[Catalog] WITH (NOLOCK)
			ORDER BY CatalogID DESC;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Catalog_GetItemById]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 2/4/2019
-- Description:	Hàm lấy thông tin danh mục theo ID 
-- =============================================
CREATE PROCEDURE [dbo].[Catalog_GetItemById]
	@CatalogID INT = 0,						-- Id danh mục
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra danh mục có tồn tại hay không
			IF NOT EXISTS (SELECT CatalogID 
							FROM [dbo].[Catalog] WITH (NOLOCK)
							WHERE CatalogID = @CatalogID)
				BEGIN
					--SELECT
					--	CatalogID,
					--	CatalogName,
					--	Status
					--FROM [dbo].[Catalog] WITH (NOLOCK)
					--WHERE CatalogID = -1;
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại danh mục'
					RETURN;
				END

			--Lấy thông tin theo ID
			ELSE
				BEGIN
					SELECT
						CatalogID,
						CatalogName,
						Status
					FROM [dbo].[Catalog] WITH (NOLOCK)
					WHERE CatalogID = @CatalogID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Catalog_Insert]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 2/4/2019
-- Description:	Hàm thêm danh mục
-- =============================================
CREATE PROCEDURE [dbo].[Catalog_Insert]
	@CatalogName NVARCHAR(MAX) = N'',		-- Tên danh mục
	@Status INT = 0,						-- Trạng thái danh mục
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra dữ liệu đầu vào
			IF (@CatalogName <> '' AND @CatalogName IS NOT NULL)
				BEGIN
					-- Kiểm tra trùng
					IF EXISTS (SELECT CatalogID
								FROM dbo.[Catalog] WITH (NOLOCK)
								WHERE 
									(UPPER(LTRIM(RTRIM(CatalogName))) = UPPER(LTRIM(RTRIM(@CatalogName)))))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Danh mục đã tồn tại !';
							RETURN;
						END
					-- Thực hiện thêm mới dữ liệu vào db	
					ELSE
						BEGIN
							INSERT INTO [dbo].[Catalog]
								(	 
									CatalogName
									,Status
								)
								VALUES 
								(	
									@CatalogName 
									,@Status
								)
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào !';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Catalog_Update]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date: 2/4/2019
-- Description:	Hàm sửa danh mục 
-- =============================================
CREATE PROCEDURE [dbo].[Catalog_Update]
	@CatalogID INT = 0,						-- ID danh mục
	@CatalogName NVARCHAR(MAX) = N'',		-- Tên danh mục
	@Status INT = 0,						-- Trạng thái danh mục
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN	
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra danh mục có tồn tại hay không
			IF NOT EXISTS (SELECT CatalogID
							FROM [dbo].[Catalog] WITH (NOLOCK)
							WHERE CatalogID = @CatalogID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại danh mục !';
					RETURN;
				END

			-- Kiểm tra dữ liệu đầu vào
			IF (@CatalogName <> '' AND @CatalogName IS NOT NULL)
				BEGIN
					-- Kiểm tra trùng
					IF EXISTS (SELECT CatalogID
								FROM dbo.[Catalog] WITH (NOLOCK)
								WHERE 
									((UPPER(LTRIM(RTRIM(CatalogName))) = UPPER(LTRIM(RTRIM(@CatalogName))))
									AND (CatalogID != @CatalogID)))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Danh mục đã tồn tại !';
							RETURN;
						END
					-- Thực hiện cập nhật dữ liệu
					ELSE
						BEGIN
							UPDATE [dbo].[Catalog]
							SET	 CatalogName = @CatalogName
								,[Status] = @Status
							WHERE CatalogID = @CatalogID;
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
							RETURN;
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào!';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	21/5/2019
-- Description:	Hàm changepassword
-- =============================================
CREATE PROCEDURE [dbo].[ChangePassword]
	@AdminID INT = 0,						-- Id tài khoản
	@NewPassword NVARCHAR(50),				-- Mật khẩu mới
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			UPDATE Admin
			SET Password = @NewPassword
			WHERE 
				AdminID = @AdminID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[DashBoard_GetCountProductByCatalogName]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 15/5/2019
-- Description:	Hàm lấy ra phần trăm của từng danh mục so với tổng tất cả sản phẩm 
-- =============================================
CREATE PROCEDURE [dbo].[DashBoard_GetCountProductByCatalogName]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				C.CatalogName,
				COUNT(P.ProductID) AS TotalProduct
			FROM Catalog AS C
			INNER JOIN Product P ON C.CatalogID = P.CatalogID
			GROUP BY C.CatalogName
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[DashBoard_GetOrderStatus]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: 14/5/2019
-- Description:	Hàm đếm số đơn hàng theo trạng thái
-- =============================================
CREATE PROCEDURE [dbo].[DashBoard_GetOrderStatus]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT 
				(SELECT COUNT (UserOrderID) FROM [dbo].UserOrder WHERE Status = 1) AS WaitConfirm,
				(SELECT COUNT (UserOrderID) FROM [dbo].UserOrder WHERE Status = 2) AS Shipping,
				(SELECT COUNT (UserOrderID) FROM [dbo].UserOrder WHERE Status = 3) AS Complete
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[DashBoard_GetTop10ProductOrder]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 14/5/2019
-- Description:	Hàm lấy ra 10 sản phẩm bán nhiều nhất trong đơn hàng 
-- =============================================
CREATE PROCEDURE [dbo].[DashBoard_GetTop10ProductOrder]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT TOP 10 
				TEM.ProductID,
				TEM.ProductName,
				TEM.TotalBuy
			FROM
			(SELECT 
				p.ProductID,
				p.ProductName,
				SUM(od.AmountBuy) AS TotalBuy
			FROM Product AS p
			INNER JOIN ProductItem as pi on p.ProductID = pi.ProductID
			INNER JOIN OrderDetail as od on pi.ProductItemID = od.ProductItemID
			GROUP BY 
				p.ProductID,
				p.ProductName) AS TEM
			ORDER BY TEM.TotalBuy DESC
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[District_Delete]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 1/4/2019
-- Description:	Hàm xóa quận huyện
-- =============================================
CREATE PROCEDURE [dbo].[District_Delete]
	@DistrictID INT = 0,					-- Id tỉnh thành 
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra quận huyện có tồn tại hay không
			IF NOT EXISTS (SELECT DistrictID
							FROM [dbo].District WITH (NOLOCK)
							WHERE DistrictID = @DistrictID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại quận huyện';
					RETURN;
				END

			-- Kiểm tra quận huyện đó có người dùng nào không
			IF EXISTS (
			 SELECT U.UserID
			 FROM [dbo].[User] AS U WITH (NOLOCK)
			 WHERE U.DistrictID = @DistrictID)
				BEGIN
					SET @ErrorCode = '1';
					SET @ErrorMessage = N'Có dữ liệu liên quan, không thể xóa';
					RETURN;
				END

			-- Thực hiện xóa
			ELSE
				BEGIN
					DELETE FROM [dbo].District
					WHERE DistrictID = @DistrictID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY

		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[District_GetAll]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 01/4/2019
-- Description:	Hàm lấy ra tất cả dữ liệu bảng district
-- =============================================
CREATE PROCEDURE [dbo].[District_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				D.DistrictID,
				D.DistrictName,
				D.Status,
				P.ProvinceName
			FROM [dbo].District AS D WITH (NOLOCK)
			INNER JOIN [dbo].Province AS P WITH(NOLOCK)
			ON D.ProvinceID = P.ProvinceID
			ORDER BY D.DistrictID DESC;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[District_GetItemById]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 4/1/2019
-- Description:	Hàm lấy thông tin quận huyện theo ID
-- =============================================
CREATE PROCEDURE [dbo].[District_GetItemById]
	@DistrictID INT = 0,					-- Id quận huyện
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra quận huyện có tồn tại hay không
			IF NOT EXISTS (SELECT DistrictID 
							FROM [dbo].District WITH (NOLOCK)
							WHERE DistrictID = @DistrictID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại quận huyện'
					RETURN;
				END

			--Lấy thông tin theo ID
			ELSE
				BEGIN
					SELECT
						DistrictID,
						DistrictName,
						Status,
						ProvinceID
					FROM [dbo].District WITH (NOLOCK)
					WHERE DistrictID = @DistrictID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END	
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[District_Insert]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 1/4/2019
-- Description:	hàm thêm quận huyện
-- =============================================
CREATE PROCEDURE [dbo].[District_Insert]
	@DistrictName NVARCHAR(MAX) = N'',		-- Tên quận huyện
	@Status INT = 0,						-- Trạng thái quận huyện
	@ProvinceID INT = 0,					-- ID tỉnh thành
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Tạo DistrictCode
			--DECLARE @DistrictCode NVARCHAR(50) = '';
			--SET @DistrictCode = (SELECT ProvinceCode FROM dbo.Province WHERE ProvinceID = @ProvinceID) + '_' + 
			--(TRY_CAST((TRY_CAST((SELECT RIGHT((SELECT TOP 1 DistrictCode FROM District WITH (NOLOCK) WHERE ProvinceID = @ProvinceID AND (DELETED = 0 OR Deleted IS NULL) ORDER BY DistrictID DESC),1)) AS INT) + 1) AS NVARCHAR));

			-- Kiểm tra dữ liệu đầu vào
			IF ((@DistrictName <> '' AND @DistrictName IS NOT NULL)
				AND (@ProvinceID <> '' AND @ProvinceID IS NOT NULL))
				BEGIN
					-- Kiểm tra trùng
					IF EXISTS (SELECT DistrictID
								FROM dbo.District WITH (NOLOCK)
								WHERE 
									(UPPER(LTRIM(RTRIM(DistrictName))) = UPPER(LTRIM(RTRIM(@DistrictName))))
									AND (ProvinceID = @ProvinceID))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Quận huyện đã tồn tại !';
							RETURN;
						END	
					ELSE
						BEGIN
							INSERT INTO [dbo].District
								(	 
									DistrictName
									,Status
									,ProvinceID
								)
								VALUES 
								(	
									@DistrictName 
									,@Status
									,@ProvinceID
								)
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào !';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[District_Update]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 1/4/2019
-- Description:	Hàm cập nhật quận huyện
-- =============================================
CREATE PROCEDURE [dbo].[District_Update]
	@DistrictID INT = 0,					-- ID quận huyện
	@DistrictName NVARCHAR(MAX) = N'',		-- Tên quận huyện
	@Status INT = 0,						-- Trạng thái quận huyện
	@ProvinceID INT = 0,					-- ID tỉnh thành
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN	
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra danh mục có tồn tại hay không
			IF NOT EXISTS(SELECT DistrictID
							FROM [dbo].District WITH (NOLOCK)
							WHERE DistrictID = @DistrictID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại quận huyện !';
					RETURN;
				END

			-- Kiểm tra dữ liệu đầu vào
			IF ((@DistrictName <> '' AND @DistrictName IS NOT NULL)
				AND (@ProvinceID <> '' AND @ProvinceID IS NOT NULL))
				BEGIN
					-- Kiểm tra trùng
					IF EXISTS (SELECT DistrictID
								FROM dbo.District WITH (NOLOCK)
								WHERE
								(UPPER(LTRIM(RTRIM(DistrictName))) = UPPER(LTRIM(RTRIM(@DistrictName))))
								AND (ProvinceID = @ProvinceID)
								AND (DistrictID != @DistrictID))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Quận huyện đã tồn tại !';
							RETURN;
						END
					ELSE
						BEGIN
							UPDATE [dbo].District
								SET	 DistrictName = @DistrictName
									,ProvinceID = @ProvinceID
									,[Status] = @Status
							WHERE DistrictID = @DistrictID;
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
							RETURN;
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào!';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ImageProduct_Delete]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 23/4/2019
-- Description:	Hàm xóa ảnh của sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[ImageProduct_Delete]
	@ImageID INT = 0,						-- Id ảnh của sản phẩm
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra sản phẩm có tồn tại hay không
			IF NOT EXISTS (SELECT ImageID
							FROM [dbo].ImageProduct WITH (NOLOCK)
							WHERE ImageID = @ImageID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại ảnh';
					RETURN;
				END
			ELSE
				BEGIN
					Delete from dbo.ImageProduct
					WHERE ImageID = @ImageID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY

		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ImageProduct_GetAll]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 23/4/2019
-- Description:	Lấy toàn bộ ảnh của 1 sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[ImageProduct_GetAll]
	@ProductID INT = 0,						-- Id sản phẩm
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra sản phẩm có tồn tại hay không
			IF NOT EXISTS (SELECT ProductID 
							FROM [dbo].Product WITH (NOLOCK)
							WHERE ProductID = @ProductID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại sản phẩm'
					RETURN;
				END

			--Lấy thông tin theo ID
			ELSE
				BEGIN
					SELECT
						IP.ImageID,
						P.ProductName,
						IP.Image
					FROM [dbo].ImageProduct AS IP WITH (NOLOCK)
					INNER JOIN [dbo].Product AS P WITH (NOLOCK)
					ON IP.ProductID = P.ProductID
					WHERE (IP.ProductID = @ProductID)
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ImageProduct_GetItemById]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 30/6/2019
-- Description:	Hàm lấy ảnh theo ID 
-- =============================================
CREATE PROCEDURE [dbo].[ImageProduct_GetItemById]
	@ImageID INT = 0,						-- Id ảnh sản phẩm
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra ảnh sản phẩm có tồn tại hay không
			IF NOT EXISTS (SELECT ImageID
							FROM [dbo].ImageProduct WITH (NOLOCK)
							WHERE ImageID = @ImageID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại ảnh sản phẩm'
					RETURN;
				END

			--Lấy thông tin theo ID
			ELSE
				BEGIN
					SELECT
						ImageID,
						ProductID,
						Image
					FROM [dbo].ImageProduct WITH (NOLOCK)
					WHERE ImageID = @ImageID
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ImageProduct_Insert]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 23/4/2019
-- Description:	Hàm thêm ảnh cho sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[ImageProduct_Insert]
	@ProductID INT = 0,						-- ID của sản phẩm
	@Image NVARCHAR(MAX) = '',				-- Đường dẫn ảnh
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			IF ((@Image <> '' AND @Image IS NOT NULL)
				AND (@ProductID <> '' AND @ProductID IS NOT NULL))
				BEGIN
					INSERT INTO [dbo].ImageProduct
						(	 
							ProductID
							,Image
						)
						VALUES 
						(	
							@ProductID 
							,@Image
						)
					SET @ErrorCode  = N'0';
					SET @ErrorMessage = N'';
				END			
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào !';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ImageProduct_Update]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 30/6/2019
-- Description:	Hàm cập nhật ảnh sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[ImageProduct_Update]
	@ImageID INT = 0,						-- ID ảnh
	@Image NVARCHAR(200) = N'',				-- Đường dẫn ảnh
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN	
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra ảnh có tồn tại hay không
			IF NOT EXISTS(SELECT ImageID
							FROM [dbo].ImageProduct WITH (NOLOCK)
							WHERE ImageID = @ImageID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại ảnh !';
					RETURN;
				END

			-- Kiểm tra dữ liệu đầu vào
			IF (@Image <> '' AND @Image IS NOT NULL)
				BEGIN
					UPDATE [dbo].ImageProduct
						SET	 Image = @Image
					WHERE ImageID = @ImageID;
					SET @ErrorCode  = N'0';
					SET @ErrorMessage = N'';
					RETURN;	
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào!';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[IS_GetProductByCatalog]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 24/4/2019
-- Description:	Lấy danh sách sản phẩm ra theo danh mục
-- =============================================
CREATE PROCEDURE [dbo].[IS_GetProductByCatalog]
	@CatalogID INT = 0,						-- Id danh mục
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			--Lấy thông tin theo ID
			BEGIN
				SELECT
					ProductID,
					ProductName
				FROM [dbo].Product WITH (NOLOCK)
				WHERE 
					(CatalogID = @CatalogID)
					AND (Status = 1)
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'';
				RETURN;
			END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[IS_GetSubCatalogByCatalog]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 09/05/2019
-- Description:	Hàm lấy danh sách danh mục con theo danh mục cha 
-- =============================================
CREATE PROCEDURE [dbo].[IS_GetSubCatalogByCatalog]
	@CatalogID INT = 0,						-- Id danh mục cha
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			--Lấy mục con theo danh mục 
			BEGIN
				SELECT
					SubCatalogID,
					SubCatalogName
				FROM [dbo].SubCatalog WITH (NOLOCK)
				WHERE 
					(CatalogID = @CatalogID)
					AND (Status = 1)
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'';
				RETURN;
			END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	17/5/2019
-- Description:	Hàm login admin
-- =============================================
CREATE PROCEDURE [dbo].[Login]
	@Account NVARCHAR(50),
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				AdminID,
				Account,
				Name,
				Role,
				Password
			FROM Admin 
			WHERE 
				UPPER(LTRIM(RTRIM(Account))) = UPPER(LTRIM(RTRIM(@Account)))
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Order_ChangeStatus]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 10/05/2019
-- Description:	Hàm thay đổi trạng thái của đơn hàng
-- =============================================
CREATE PROCEDURE [dbo].[Order_ChangeStatus]
	@UserOrderID INT = 0,					-- Id đơn hàng
	@Status INT = 0,						-- Trạng thái đơn hàng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra đơn hàng có tồn tại hay không
			IF NOT EXISTS (SELECT UserOrderID
							FROM [dbo].UserOrder WITH (NOLOCK)
							WHERE UserOrderID = @UserOrderID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn đơn hàng';
					RETURN;
				END

			-- Thực hiện thay đổi trạng thái
			ELSE
				BEGIN
					UPDATE [dbo].UserOrder
					SET Status = @Status
					WHERE UserOrderID = @UserOrderID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY

		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Order_Destroy]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 27/6/2019
-- Description:	Hàm cập nhật lại trạng thái đơn hàng bị hủy => 4
--				và thêm số lượng hàng từ đơn hàng bị hủy vào kho
-- =============================================
CREATE PROCEDURE [dbo].[Order_Destroy]
	@UserOrderID INT = 0,					-- Id đơn hàng
	@ProductItemID INT = 0,					-- Sản phẩm chi tiết theo size và sản phẩm
	@AmountStock INT = 0,					-- Số lượng hàng trong kho hiện tại
	@AmountBuy INT = 0,						-- Số lượng hàng mua trong đơn đặt hàng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra đơn hàng có tồn tại hay không
			IF NOT EXISTS (SELECT UserOrderID
							FROM [dbo].UserOrder WITH (NOLOCK)
							WHERE UserOrderID = @UserOrderID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn đơn hàng';
					RETURN;
				END

			-- Thực hiện thay đổi trạng thái
			ELSE
				BEGIN
					UPDATE [dbo].UserOrder
					SET Status = 4
					WHERE UserOrderID = @UserOrderID;

					UPDATE [dbo].ProductItem
					SET AmountStock = @AmountStock + @AmountBuy
					WHERE ProductItemID = @ProductItemID

					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY

		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Order_GetAll]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	18/4/2019
-- Description:	Hàm lấy ra thông tin cơ bản đơn hàng
-- =============================================
CREATE PROCEDURE [dbo].[Order_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				U.FullName,
				U.PhoneNumber,
				U.Email,
				U.Address,
				P.ProvinceName,
				D.DistrictName,
				O.OrderID,
				O.DateCreate,
				O.Status,
				O.Note,
				SUM(OD.Total) AS TotalMoney
			FROM dbo.[User] AS U
			LEFT JOIN dbo.Province AS P
			ON U.ProvinceID = P.ProvinceID
			LEFT JOIN dbo.District AS D
			ON U.DistrictID = D.DistrictID
			INNER JOIN dbo.[Order] AS O
			ON U.UserID = O.UserID
			INNER JOIN dbo.OrderDetail AS OD 
			ON O.OrderID = OD.OrderID 
			GROUP BY
				U.FullName,
				U.PhoneNumber,
				U.Email,
				U.Address,
				P.ProvinceName,
				D.DistrictName,
				O.OrderID,
				O.DateCreate,
				O.Status,
				O.Note
			ORDER BY O.OrderID DESC
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Order_GetDetail_For_Destroy]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 27/6/2019
-- Description:	Hàm lấy thông tin đơn hàng chi tiết để thực hiện hủy
-- =============================================
CREATE PROCEDURE [dbo].[Order_GetDetail_For_Destroy]
	@UserOrderID INT = 0,					-- Id đơn hàng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra đơn hàng có tồn tại hay không
			IF NOT EXISTS (SELECT UserOrderID 
							FROM [dbo].OrderDetail WITH (NOLOCK)
							WHERE UserOrderID = @UserOrderID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại đơn hàng'
					RETURN;
				END

			--Lấy thông tin theo ID đơn hàng
			ELSE
				BEGIN
					SELECT
						OD.UserOrderID,
						OD.ProductItemID,
						OD.AmountBuy,
						PI.AmountStock
					FROM [dbo].OrderDetail AS OD WITH (NOLOCK)
					INNER JOIN dbo.ProductItem AS PI WITH (NOLOCK) ON OD.ProductItemID = PI.ProductItemID
					WHERE (OD.UserOrderID = @UserOrderID);
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Order_GetOrderByStatus]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	10/5/2019
-- Description:	Hàm lấy ra tất cả đơn hàng theo trạng thái
-- =============================================
CREATE PROCEDURE [dbo].[Order_GetOrderByStatus]
	@Status INT = 0,						-- Trạng thái đơn hàng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				UO.UserOrderID,
				U.FullName,
				U.PhoneNumber,
				U.Email,
				U.Address,
				P.ProvinceName,
				D.DistrictName,
				UO.DateCreate,
				UO.Status,
				UO.Note,
				SUM(OD.Total) AS TotalMoney
			FROM dbo.OrderDetail AS OD
			INNER JOIN dbo.UserOrder AS UO 
			ON OD.UserOrderID = UO.UserOrderID
			INNER JOIN dbo.[User] AS U 
			ON UO.UserID = U.UserID
			LEFT JOIN dbo.Province AS P
			ON U.ProvinceID = P.ProvinceID
			LEFT JOIN dbo.District AS D
			ON U.DistrictID = D.DistrictID
			WHERE (UO.Status = @Status)
			GROUP BY
				UO.UserOrderID,
				U.FullName,
				U.PhoneNumber,
				U.Email,
				U.Address,
				P.ProvinceName,
				D.DistrictName,
				UO.DateCreate,
				UO.Status,
				UO.Note
			ORDER BY UO.UserOrderID DESC
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OrderDetail_GetAll]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 18/4/2019
-- Description:	Hàm lấy thông tin chi tiết của đơn hàng
-- =============================================
CREATE PROCEDURE [dbo].[OrderDetail_GetAll]
	@OrderID INT = 0,					-- Id đơn hàng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra đơn hàng có tồn tại hay không
			IF NOT EXISTS (SELECT OrderID 
							FROM [dbo].OrderDetail WITH (NOLOCK)
							WHERE OrderID = @OrderID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại đơn hàng'
					RETURN;
				END

			--Lấy thông tin theo ID đơn hàng
			ELSE
				BEGIN
					SELECT
						U.FullName,
						P.ProductName,
						S.SizeName,
						IP.Image,
						P.Price,
						OD.AmountBuy,
						OD.Total
					FROM [dbo].OrderDetail AS OD WITH (NOLOCK)
					INNER JOIN [dbo].[Order] AS O WITH (NOLOCK) ON OD.OrderID= O.OrderID
					INNER JOIN [dbo].[User] AS U WITH (NOLOCK) ON O.UserID = U.UserID
					INNER JOIN dbo.ProductItem AS PI WITH (NOLOCK) ON OD.ProductItemID = PI.ProductItemID
					INNER JOIN dbo.Product AS P WITH (NOLOCK) ON PI.ProductID = P.ProductID
					INNER JOIN dbo.Size AS S WITH (NOLOCK) ON PI.SizeID = S.SizeID
					OUTER APPLY(SELECT TOP 1 IP.Image FROM ImageProduct IP WHERE IP.ProductID = PI.ProductID) AS IP
					WHERE (OD.OrderID = @OrderID);
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_ChangeInfo]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 10/6/2019
-- Description:	hàm sửa thông tin khách hàng
-- =============================================
CREATE PROCEDURE [dbo].[OS_ChangeInfo] 
	@UserID INT = 0,						-- ID người dùng
	@FullName nvarchar(500) = N'',			-- Họ tên người dùng
	@PhoneNumber nvarchar(10) = N'',		-- Số điện thoại người dùng
	@Email nvarchar(max) = N'',				-- Enail người dùng
	@Address nvarchar(max) = N'',			-- Địa chỉ người dùng
	@ProvinceID int = 0,					-- Tỉnh thành
	@DistrictID int = 0,					-- Quận huyện
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN	
	SET NOCOUNT ON;
		BEGIN TRY
			IF NOT EXISTS(SELECT UserID
							FROM [dbo].[User] WITH (NOLOCK)
							WHERE UserID = @UserID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại người dùng !';
					RETURN;
				END

			IF ((@FullName <> '' AND @FullName IS NOT NULL)
			AND (@PhoneNumber <> '' AND @PhoneNumber IS NOT NULL)
			AND (@Email <> '' AND @Email IS NOT NULL)
			AND (@Address <> '' AND @Address IS NOT NULL)
			AND (@ProvinceID <> 0)
			AND (@DistrictID <> 0))
				BEGIN
					UPDATE [dbo].[User]
					SET	FullName = @FullName,
						PhoneNumber = @PhoneNumber,
						Email = @Email,
						Address = @Address,
						ProvinceID = @ProvinceID,
						DistrictID = @DistrictID
					WHERE UserID = @UserID;
					SET @ErrorCode  = N'0';
					SET @ErrorMessage = N'';
					RETURN;		
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Bạn phải nhập đủ dữ liệu!';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_ChangePassword]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	09/06/2019
-- Description:	Hàm đổi mật khẩu người dùng
-- =============================================
CREATE PROCEDURE [dbo].[OS_ChangePassword]
	@UserID INT = 0,						-- Id tài khoản ngươi dùng
	@NewPassword NVARCHAR(50),				-- Mật khẩu mới
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			UPDATE [dbo].[User]
			SET Password = @NewPassword
			WHERE 
				UserID = @UserID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetAllCatalog]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 18/4/2019
-- Description:	Hàm lấy ra tất cả danh mục cha
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetAllCatalog]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				CatalogID,
				CatalogName
			FROM [dbo].Catalog WITH (NOLOCK)
			WHERE Status = 1
			ORDER BY CatalogID ASC;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetAllDistrict]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 14/4/2019
-- Description:	Hàm lấy ra tất cả quận huyện để người dùng chọn
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetAllDistrict]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				DistrictID,
				DistrictName
			FROM [dbo].District WITH (NOLOCK)
			WHERE Status = 1
			ORDER BY DistrictName ASC;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetAllOrder]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	8/6/2019
-- Description:	Hàm lấy ra lịch sử đơn hàng và thông tin người dùng đơn hàng
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetAllOrder]
	@UserID INT,							-- ID người dùng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra người dùng có tồn tại hay không
			IF NOT EXISTS (SELECT UserOrderID 
							FROM [dbo].UserOrder WITH (NOLOCK)
							WHERE UserID = @UserID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại người dùng'
					RETURN;
				END

			--Lấy thông tin theo ID đơn hàng
			ELSE
				BEGIN
					SELECT
						UO.UserOrderID,
						UO.DateCreate,
						UO.Status,
						UO.Note,
						SUM(OD.Total) AS TotalMoney
					FROM dbo.UserOrder AS UO
					INNER JOIN dbo.OrderDetail AS OD 
					ON UO.UserOrderID = OD.UserOrderID
					WHERE UO.UserID = @UserID
					GROUP BY
						UO.UserOrderID,
						UO.DateCreate,
						UO.Status,
						UO.Note
					ORDER BY UO.UserOrderID DESC
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetAllProduct]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 8/4/2019
-- Description:	Hàm lấy danh sách sản phẩm theo danh mục cha
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetAllProduct]
	@InSort NVARCHAR(MAX) = N'',			-- Điều kiện sắp xếp
	@CatalogID INT = 0,						-- Id danh mục
	@SubCatalogID INT = 0,					-- Id danh mục con
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		DECLARE @query NVARCHAR(MAX) = '';
		BEGIN TRY
			-- Nếu danh mục cha và con đều khác 0
			IF (@CatalogID <> 0 AND @SubCatalogID <> 0)
				BEGIN
					-- Kiểm tra ID danh mục con có tồn tại không
					IF NOT EXISTS (SELECT SubCatalogID 
								FROM [dbo].SubCatalog WITH (NOLOCK)
								WHERE SubCatalogID = @SubCatalogID)
						BEGIN
							SET @ErrorCode = N'1'; 
							SET @ErrorMessage = N'Không tồn tại danh mục con'
							RETURN;
						END

					--Lấy thông tin sản phẩm theo danh mục con
					ELSE
						BEGIN
							SET @query = 'SELECT 
											P.ProductID,
											P.ProductName,
											P.Description,
											IP.Image,
											P.Price,
											(SELECT SUM(PI.AmountStock) FROM ProductItem AS PI WHERE PI.ProductID = P.ProductID) AS TotalItemLeft
										FROM [dbo].Product AS P WITH (NOLOCK)
										CROSS APPLY (SELECT TOP 1 IP.Image FROM ImageProduct AS IP WHERE IP.ProductID = P.ProductID) AS IP
										WHERE ((P.SubCatalogID = ' + CAST(@SubCatalogID AS nvarchar )+')
										AND (P.Status = 1))
										ORDER BY ' + @InSort + ' P.ProductID DESC '
						END
				END
			ELSE
				BEGIN
					-- Kiểm tra danh mục cha có tồn tại hay không
					IF NOT EXISTS (SELECT CatalogID 
									FROM [dbo].[Catalog] WITH (NOLOCK)
									WHERE CatalogID = @CatalogID)
						BEGIN
							SET @ErrorCode = N'1';
							SET @ErrorMessage = N'Không tồn tại danh mục cha'
							RETURN;
						END

					--Lấy thông tin sản phẩm theo danh mục cha
					ELSE
						BEGIN
							SET @query = 'SELECT 
											P.ProductID,
											P.ProductName,
											P.Description,
											IP.Image,
											P.Price,
											(SELECT SUM(PI.AmountStock) FROM ProductItem AS PI WHERE PI.ProductID = P.ProductID) AS TotalItemLeft
										FROM [dbo].Product AS P WITH (NOLOCK)
										CROSS APPLY (SELECT TOP 1 IP.Image FROM ImageProduct AS IP WHERE IP.ProductID = P.ProductID) AS IP
										WHERE ((P.CatalogID = ' + CAST(@CatalogID AS nvarchar )+')
										AND (P.Status = 1))
										ORDER BY ' + @InSort + ' P.ProductID DESC '
						END
				END
			-- Thực thi câu lệnh được tạo ra
			EXEC SP_EXECUTESQL @query;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
			RETURN;
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================			
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetAllProvince]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 14/4/2019
-- Description:	Hàm lấy ra tất cả những tỉnh thành đang hoạt động 
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetAllProvince]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				ProvinceID,
				ProvinceName
			FROM [dbo].Province WITH (NOLOCK)
			WHERE Status = 1
			ORDER BY ProvinceName ASC;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetDistrictByProvince]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 14/06/2019
-- Description:	Hàm lấy danh sách quận huyện theo tỉnh thành
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetDistrictByProvince]
	@ProvinceID INT = 0,					-- Id tỉnh thành
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			--Lấy mục con theo danh mục 
			BEGIN
				SELECT
					DistrictID,
					DistrictName
				FROM [dbo].District WITH (NOLOCK)
				WHERE 
					(ProvinceID = @ProvinceID)
					AND (Status = 1)
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'';
				RETURN;
			END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetImageProductByID]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 25/4/2019
-- Description:	Lấy ảnh của sản phẩm theo ID sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetImageProductByID]
	@ProductID INT = 0,						-- Id sản phẩm
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra sản phẩm có tồn tại hay không
			IF NOT EXISTS (SELECT ProductID
							FROM [dbo].Product WITH (NOLOCK)
							WHERE ProductID = @ProductID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại sản phẩm'
					RETURN;
				END

			--Lấy thông tin sản phẩm 
			ELSE
				BEGIN
					SELECT
						Image
					FROM [dbo].ImageProduct AS IP WITH (NOLOCK)
					WHERE (ProductID = @ProductID)
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetOrderDetail]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 09/06/2019
-- Description:	Hàm lấy thông tin chi tiết của đơn hàng theo ID người dùng
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetOrderDetail]
	@UserOrderID INT = 0,					-- Id đơn hàng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra đơn hàng có tồn tại hay không
			IF NOT EXISTS (SELECT UserOrderID 
							FROM [dbo].OrderDetail WITH (NOLOCK)
							WHERE UserOrderID = @UserOrderID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại đơn hàng'
					RETURN;
				END

			--Lấy thông tin theo ID đơn hàng
			ELSE
				BEGIN
					SELECT
						P.ProductID,
						P.ProductName,
						S.SizeName,
						IP.Image,
						P.Price,
						OD.AmountBuy,
						OD.Total
					FROM [dbo].OrderDetail AS OD WITH (NOLOCK)
					INNER JOIN [dbo].UserOrder AS UO WITH (NOLOCK) ON OD.UserOrderID= UO.UserOrderID
					INNER JOIN dbo.ProductItem AS PI WITH (NOLOCK) ON OD.ProductItemID = PI.ProductItemID
					INNER JOIN dbo.Product AS P WITH (NOLOCK) ON PI.ProductID = P.ProductID
					INNER JOIN dbo.Size AS S WITH (NOLOCK) ON PI.SizeID = S.SizeID
					OUTER APPLY(SELECT TOP 1 IP.Image FROM ImageProduct IP WHERE IP.ProductID = PI.ProductID) AS IP
					WHERE (OD.UserOrderID = @UserOrderID);
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetProductDetailByID]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 9/4/2019
-- Description:	Lấy dữ liệu chi tiết của sản phẩm khi click vào xem chi tiết
--				và xem thông tin chi tiết trong giỏ hàng
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetProductDetailByID]
	@ProductID INT = 0,						-- Id sản phẩm
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra sản phẩm có tồn tại hay không
			IF NOT EXISTS (SELECT ProductID
							FROM [dbo].Product WITH (NOLOCK)
							WHERE ProductID = @ProductID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại sản phẩm'
					RETURN;
				END

			--Lấy thông tin sản phẩm 
			ELSE
				BEGIN
					SELECT
						P.ProductID,
						P.ProductName,
						P.Description,
						P.Price
					FROM [dbo].Product AS P WITH (NOLOCK)
					WHERE ((P.ProductID = @ProductID)
					AND (P.Status = 1))
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetProductDetailInCart]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 25/4/2019
-- Description:	Hàm lấy ra thông tin sản phẩm được thêm vào giỏ hàng
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetProductDetailInCart]
	@ProductID INT = 0,						-- ID sản phẩm
	@SizeID INT = 0,						-- ID Size sản phẩm
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT 
				PI.ProductItemID,
				P.ProductID,
				P.ProductName,
				P.Price,
				IP.Image,
				S.SizeID,
				S.SizeName,
				PI.AmountStock
			FROM dbo.ProductItem AS PI 
			INNER JOIN Product AS P ON PI.ProductID = P.ProductID
			INNER JOIN Size AS S ON PI.SizeID = S.SizeID
			OUTER APPLY(SELECT TOP 1 IP.Image FROM ImageProduct IP WHERE IP.ProductID = PI.ProductID) AS IP
			WHERE ((PI.ProductID = @ProductID)
			AND (PI.SizeID = @SizeID))
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetSizeProductByID]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 25/4/2019
-- Description:	Lấy size của sản phẩm theo ID sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetSizeProductByID]
	@ProductID INT = 0,						-- Id sản phẩm
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra sản phẩm có tồn tại hay không
			IF NOT EXISTS (SELECT ProductID
							FROM [dbo].Product WITH (NOLOCK)
							WHERE ProductID = @ProductID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại sản phẩm'
					RETURN;
				END

			--Lấy thông tin sản phẩm 
			ELSE
				BEGIN
					SELECT
						PI.ProductID,
						S.SizeID,
						S.SizeName
					FROM [dbo].Size AS S WITH (NOLOCK)
					INNER JOIN [dbo].ProductItem AS PI ON S.SizeID = PI.SizeID 
					WHERE (PI.ProductID = @ProductID)
					AND (PI.AmountStock > 0)
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetSubCatalogByCatalog]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 17/4/2019
-- Description:	Hàm lấy danh sách danh mục con theo danh mục cha làm menu trái trong danh sách sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetSubCatalogByCatalog]
	@CatalogID INT = 0,						-- Id danh mục cha
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra danh mục có tồn tại hay không
			IF NOT EXISTS (SELECT CatalogID 
							FROM [dbo].[Catalog] WITH (NOLOCK)
							WHERE CatalogID = @CatalogID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại danh mục'
					RETURN;
				END

			--Lấy thông tin sản phẩm theo danh mục 
			ELSE
				BEGIN
					SELECT
						SC.SubCatalogID,
						SC.SubCatalogName,
						SC.CatalogID,
						C.CatalogName
					FROM [dbo].SubCatalog AS SC WITH (NOLOCK)
					INNER JOIN [dbo].Catalog AS C WITH (NOLOCK)
					ON SC.CatalogID = C.CatalogID
					WHERE ((SC.CatalogID = @CatalogID)
					AND (SC.Status = 1))
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetTop10NewProduct]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 26/5/2019
-- Description:	Hàm lấy ra 10 sản phẩm mới nhất
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetTop10NewProduct]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT TOP 10
				P.ProductID,
				P.ProductName,
				IP.Image,
				P.Price
			FROM [dbo].Product AS P WITH (NOLOCK)
			CROSS APPLY (SELECT TOP 1 IP.Image FROM ImageProduct AS IP WHERE IP.ProductID = P.ProductID) AS IP
			WHERE P.Status = 1
			ORDER BY P.DateCreated DESC 
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_GetTop10SaleProduct]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 25/5/2019
-- Description:	Hàm lấy ra 10 sản phẩm bán nhiều nhất trong danh sách đơn hàng 
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetTop10SaleProduct]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT TOP 10 
				TEM.ProductID,
				TEM.ProductName,
				TEM.Image,
				TEM.Price
			FROM
			(SELECT 
				p.ProductID,
				p.ProductName,
				p.Price,
				IP.Image,
				SUM(od.AmountBuy) AS TotalBuy
			FROM Product AS p
			CROSS APPLY (SELECT TOP 1 IP.Image FROM ImageProduct AS IP WHERE IP.ProductID = P.ProductID) AS IP
			INNER JOIN ProductItem as pi on p.ProductID = pi.ProductID
			INNER JOIN OrderDetail as od on pi.ProductItemID = od.ProductItemID
			GROUP BY 
				p.ProductID,
				p.ProductName,
				p.Price,
				IP.Image) AS TEM
			ORDER BY TEM.TotalBuy DESC
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_Login]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	4/6/2019
-- Description:	Hàm login người dùng 
-- =============================================
CREATE PROCEDURE [dbo].[OS_Login] 
	@Account NVARCHAR(50),					-- tài khoản người dùng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				UserID,
				Account,
				Password,
				FullName,
				PhoneNumber,
				Email,
				Address,
				ProvinceID,
				DistrictID
			FROM [dbo].[User] 
			WHERE 
				UPPER(LTRIM(RTRIM(Account))) = UPPER(LTRIM(RTRIM(@Account)))
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_Payment_LoginUser]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 14/4/2019
-- Description:	hàm thêm thông tin khách hàng
-- =============================================
CREATE PROCEDURE [dbo].[OS_Payment_LoginUser]
	@IN_JSON NVARCHAR(MAX) = null,			-- Mảng dữ liệu truyền về
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
	DECLARE @CheckJson TINYINT = 0;
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SET @CheckJson = (SELECT ISJSON(@IN_JSON));

			-- Kiểm tra chuỗi JSON có bị NULL hay không
			IF @CheckJson IS NULL
			BEGIN
				SET @ErrorCode = N'Payment-JSON_NULL';
				SET @ErrorMessage = N'Chuỗi JSON không hợp lệ';
				RETURN;
			END;

			-- Kiểm tra chuỗi JSON có hợp lệ hay không
			IF @CheckJson <= 0 
			BEGIN
				SET @ErrorCode = N'Payment-JSON_LENGTH_0';
				SET @ErrorMessage = N'Chuỗi JSON không hợp lệ';
				RETURN;
			END;

			BEGIN
				-- Cập nhật thông tin người dùng đăng nhập vào bảng User từ user trong json
				UPDATE [dbo].[User]
				SET
					FullName = T.FullName,
					PhoneNumber = T.PhoneNumber,
					Email = T.Email,
					Address = T.Address,
					ProvinceID = T.ProvinceID,
					DistrictID = T.DistrictID
				FROM OPENJSON(@IN_JSON, '$.user')
					WITH
					(
						UserID INT,
						FullName nvarchar(500),
						PhoneNumber nvarchar(10),
						Email nvarchar(MAX),
						Address nvarchar(MAX),
						ProvinceID int,
						DistrictID int
					) AS T
				WHERE [User].UserID = T.UserID

				-- Thêm mới dữ liệu vào bảng UserOrder
				INSERT INTO [dbo].UserOrder
					(	 
						DateCreate,
						Status,
						Note,
						UserID
					)
					SELECT 
						GETDATE(),
						1,
						Note,
						UserID
					FROM 
						OPENJSON(@IN_JSON, '$.userOrder') 
					WITH
					(
						Note nvarchar(MAX),
						UserID int
					);

				-- Thêm mới dữ liệu vào bảng OrderDetail
				--Lấy ID của người dùng vừa tạo
				DECLARE @UserOrderID int = 0;
				SET @UserOrderID = SCOPE_IDENTITY()

				INSERT INTO [dbo].OrderDetail
					(	 
						UserOrderID,
						ProductItemID,
						AmountBuy,
						Total
					)
					SELECT 
						@UserOrderID
						,ProductItemID 
						,AmountBuy
						,(Price * CAST(AmountBuy as int)) as Total
					FROM 
						OPENJSON(@IN_JSON, '$.listCart') 
					WITH
					(
						ProductItemID int,
						AmountBuy int,
						Price money
					);
				SET @ErrorCode  = N'0';
				SET @ErrorMessage = N'';
			END;
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_Payment_NormalUser]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 8/6/2019
-- Description:	hàm thêm thông tin khách hàng
-- =============================================
CREATE PROCEDURE [dbo].[OS_Payment_NormalUser]
	@IN_JSON NVARCHAR(MAX) = null,			-- Mảng dữ liệu truyền về
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
	DECLARE @CheckJson TINYINT = 0;
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SET @CheckJson = (SELECT ISJSON(@IN_JSON));

			-- Kiểm tra chuỗi JSON có bị NULL hay không
			IF @CheckJson IS NULL
			BEGIN
				SET @ErrorCode = N'Payment-JSON_NULL';
				SET @ErrorMessage = N'Chuỗi JSON không hợp lệ';
				RETURN;
			END;

			-- Kiểm tra chuỗi JSON có hợp lệ hay không
			IF @CheckJson <= 0 
			BEGIN
				SET @ErrorCode = N'Payment-JSON_LENGTH_0';
				SET @ErrorMessage = N'Chuỗi JSON không hợp lệ';
				RETURN;
			END;

			BEGIN
				-- Thêm thông tin người dùng vào bảng User từ user trong json		
				INSERT INTO [dbo].[User]
				(	 
					FullName,
					PhoneNumber,
					Email,
					Address,
					ProvinceID,
					DistrictID
				)
				SELECT 
					FullName,
					PhoneNumber,
					Email,
					Address,
					ProvinceID,
					DistrictID
				FROM 
					OPENJSON(@IN_JSON, '$.user') 
				WITH
				(
					FullName nvarchar(500),
					PhoneNumber nvarchar(10),
					Email nvarchar(MAX),
					Address nvarchar(MAX),
					ProvinceID int,
					DistrictID int
				);

				-- Thêm mới dữ liệu vào bảng UserOrder
				--Lấy ID của người dùng vừa tạo
				DECLARE @UserID int = 0;
				SET @UserID = SCOPE_IDENTITY()

				INSERT INTO [dbo].UserOrder
					(	 
						DateCreate,
						Status,
						Note,
						UserID
					)
					SELECT 
						GETDATE(),
						1,
						Note,
						@UserID
					FROM 
						OPENJSON(@IN_JSON, '$.userOrder') 
					WITH
					(
						Note nvarchar(MAX)
					);

				-- Thêm mới dữ liệu vào bảng OrderDetail
				--Lấy ID của đơn hàng vừa tạo
				DECLARE @UserOrderID int = 0;
				SET @UserOrderID = SCOPE_IDENTITY()

				INSERT INTO [dbo].OrderDetail
					(	 
						UserOrderID,
						ProductItemID,
						AmountBuy,
						Total
					)
					SELECT 
						@UserOrderID
						,ProductItemID 
						,AmountBuy
						,(Price * CAST(AmountBuy as int)) as Total
					FROM 
						OPENJSON(@IN_JSON, '$.listCart') 
					WITH
					(
						ProductItemID int,
						AmountBuy int,
						Price money
					);
				SET @ErrorCode  = N'0';
				SET @ErrorMessage = N'';
			END;
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_SearchProduct]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 2/5/2019
-- Description:	Hàm tìm kiếm sản phẩm theo tên sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[OS_SearchProduct]
	@InSort NVARCHAR(MAX) = N'',			-- Điều kiện sắp xếp
	@Content NVARCHAR(2048) = N'',			-- Nội dung tìm kiếm
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		DECLARE @query NVARCHAR(MAX) = '';
		BEGIN TRY
			SET @query = 'SELECT
							P.ProductID,
							P.ProductName,
							IP.Image,
							P.Price,
							(SELECT SUM(PI.AmountStock) FROM ProductItem AS PI WHERE PI.ProductID = P.ProductID) AS TotalItemLeft
						FROM [dbo].Product AS P WITH (NOLOCK)
						INNER JOIN CONTAINSTABLE (Product,ProductName, N''"'+@Content+'"'') AS KEY_TBL
						ON P.ProductID = KEY_TBL.[KEY] 
						CROSS APPLY (SELECT TOP 1 IP.Image FROM ImageProduct AS IP WHERE IP.ProductID = P.ProductID) AS IP
						WHERE P.Status = 1
						ORDER BY ' + @InSort + ' P.ProductID DESC ';

			PRINT @query

			EXEC SP_EXECUTESQL @query;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_SignUp]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	5/6/2019
-- Description:	Hàm đăng ký người dùng
-- =============================================
CREATE PROCEDURE [dbo].[OS_SignUp]
	@Account nvarchar(50) = '',				-- Tên tài khoản
	@Password NVARCHAR(50) = '',			-- Mật khẩu 
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			IF ((@Account <> '' AND @Account IS NOT NULL)
				AND (@Password <> '' AND @Password IS NOT NULL))
				BEGIN
					-- Kiểm tra trùng
					IF EXISTS (SELECT UserID
								FROM [dbo].[User] WITH (NOLOCK)
								WHERE 
									(UPPER(LTRIM(RTRIM(Account))) = UPPER(LTRIM(RTRIM(@Account)))))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Tài khoản đã tồn tại';
							RETURN;
						END	
					ELSE
						BEGIN
							INSERT INTO [dbo].[User]
							(
								Account,
								Password
							)
							VALUES
							(
								@Account,
								@Password
							)
							SET @ErrorCode = N'0';
							SET @ErrorMessage = N'';
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào !';
					RETURN;
				END
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OS_UpdateAmountStock]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 26/4/2019
-- Description:	Hàm cập nhật lại số lượng sản phẩm tồn trong kho sau khi mua
-- =============================================
CREATE PROCEDURE [dbo].[OS_UpdateAmountStock]
	@ProductItemID INT = 0,					-- ID sản phẩm con
	@AmountStock INT = 0,					-- Số lượng tồn trong kho
	@AmountBuy INT = 0,						-- Số lượng mua
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
DECLARE @ProductName nvarchar(1000);
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			IF (@AmountBuy > @AmountStock)
				BEGIN
					SELECT @ProductName = P.ProductName
					FROM dbo.Product as P
					LEFT JOIN dbo.ProductItem as PI on P.ProductID = PI.ProductID
					WHERE PI.ProductItemID = @ProductItemID;


					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Số lượng sản phẩm ' + UPPER(@ProductName) + N' bạn mua không còn đủ trong kho, vui lòng thử lại';
					RETURN;
				END
			ELSE
				BEGIN
					UPDATE dbo.ProductItem
					SET AmountStock = @AmountStock - @AmountBuy
					WHERE ProductItemID = @ProductItemID
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Product_Delete]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 4/4/2019
-- Description:	Hàm xóa sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[Product_Delete]
	@ProductID INT = 0,						-- Id sản phẩm
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra sản phẩm có tồn tại hay không
			IF NOT EXISTS (SELECT ProductID
							FROM [dbo].Product WITH (NOLOCK)
							WHERE ProductID = @ProductID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại sản phẩm';
					RETURN;
				END

			-- Kiểm tra sản phẩm đó có sản phẩm con nào không
			IF EXISTS (
			 SELECT PI.ProductItemID
			 FROM [dbo].ProductItem AS PI WITH (NOLOCK)
			 WHERE PI.ProductID = @ProductID)

			-- Kiểm tra sản phẩm đó có ảnh không
			OR EXISTS (
			 SELECT IP.ImageID
			 FROM [dbo].ImageProduct AS IP WITH (NOLOCK)
			 WHERE IP.ProductID = @ProductID)
				BEGIN
					SET @ErrorCode = '1';
					SET @ErrorMessage = N'Có dữ liệu liên quan, không thể xóa';
					RETURN;
				END

			--Thực hiện xóa
			ELSE
				BEGIN
					DELETE FROM [dbo].Product
					WHERE ProductID = @ProductID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY

		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Product_GetAll]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	4/4/2019
-- Description:	Hàm lấy ra tất cả dữ liệu bảng product
-- =============================================
CREATE PROCEDURE [dbo].[Product_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				P.ProductID,
				P.ProductName,
				P.Price,
				P.Status,
				C.CatalogName,
				SC.SubCatalogName
			FROM [dbo].Product AS P WITH (NOLOCK)
			INNER JOIN [dbo].[Catalog] AS C WITH(NOLOCK) ON P.CatalogID = C.CatalogID
			INNER JOIN [dbo].SubCatalog AS SC WITH(NOLOCK) ON P.SubCatalogID = SC.SubCatalogID
			ORDER BY P.ProductID DESC;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Product_GetItemById]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 4/4/2019
-- Description:	Hàm lấy thông tin sản phẩm theo ID 
-- =============================================
CREATE PROCEDURE [dbo].[Product_GetItemById]
	@ProductID INT = 0,						-- Id sản phẩm
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra sản phẩm có tồn tại hay không
			IF NOT EXISTS (SELECT ProductID 
							FROM [dbo].Product WITH (NOLOCK)
							WHERE ProductID = @ProductID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại sản phẩm'
					RETURN;
				END

			--Lấy thông tin theo ID
			ELSE
				BEGIN
					SELECT
						ProductID,
						ProductName,
						Description,
						Price,
						Status,
						CatalogID,
						SubCatalogID
					FROM [dbo].Product WITH (NOLOCK)
					WHERE ProductID = @ProductID
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Product_Insert]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 4/4/2019
-- Description:	hàm thêm danh mục
-- =============================================
CREATE PROCEDURE [dbo].[Product_Insert]
	@ProductName NVARCHAR(MAX) = N'',		-- Tên danh sản phẩm
	@Description NVARCHAR(MAX) = N'',		-- Mô tả sản phẩm
	@Price FLOAT = 0,						-- Giá sản phẩm
	@Status INT = 0,						-- Trạng thái sản phẩm
	@CatalogID INT = 0,						-- ID danh mục cha
	@SubCatalogID INT = 0,					-- ID danh mục con
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra dữ liệu bắt buộc truyền vào
			IF ((@CatalogID <> '' AND @CatalogID IS NOT NULL)
				AND (@SubCatalogID <> '' AND @SubCatalogID IS NOT NULL)
				AND (@ProductName <> '' AND @ProductName IS NOT NULL)
				AND (@Price <> '' AND @Price IS NOT NULL))
				BEGIN
					-- Kiểm tra dữ liệu trùng
					IF EXISTS (SELECT ProductID
								FROM dbo.Product WITH (NOLOCK)
								WHERE ((CatalogID = @CatalogID)
										AND (SubCatalogID = @SubCatalogID)
										AND (UPPER(LTRIM(RTRIM(ProductName))) = UPPER(LTRIM(RTRIM(@ProductName))))))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Sản phẩm đã tồn tại !';
							RETURN;
						END	
					ELSE
						BEGIN
							-- Thêm mới sản phẩm vào db
							INSERT INTO [dbo].Product
								(	 
									ProductName
									,Description
									,Price
									,Status
									,CatalogID
									,SubCatalogID
									,DateCreated
								)
								VALUES 
								(	
									@ProductName
									,@Description 
									,@Price
									,@Status
									,@CatalogID
									,@SubCatalogID
									,GETDATE()
								)
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào !';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Product_Update]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 4/4/2019
-- Description:	Hàm cập nhật sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[Product_Update]
	@ProductID INT = 0,						-- ID sản phẩm
	@ProductName NVARCHAR(MAX) = N'',		-- Tên danh sản phẩm
	@Description NVARCHAR(MAX) = N'',		-- Mô tả sản phẩm
	@Price FLOAT = 0,						-- Giá sản phẩm
	@Status INT = 0,						-- Trạng thái sản phẩm
	@CatalogID INT = 0,						-- ID danh mục cha
	@SubCatalogID INT = 0,					-- ID danh mục con
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN	
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra sản phẩm có tồn tại hay không
			IF NOT EXISTS(SELECT ProductID
							FROM [dbo].Product WITH (NOLOCK)
							WHERE ProductID = @ProductID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại sản phẩm !';
					RETURN;
				END

			-- Kiểm tra dữ liệu bắt buộc truyền vào 
			IF ((@CatalogID <> '' AND @CatalogID IS NOT NULL)
				AND (@SubCatalogID <> '' AND @SubCatalogID IS NOT NULL)
				AND (@ProductName <> '' AND @ProductName IS NOT NULL)
				AND (@Price <> '' AND @Price IS NOT NULL))
				BEGIN
					-- Kiểm tra dữ liệu trùng
					IF EXISTS (SELECT ProductID
								FROM dbo.Product WITH (NOLOCK)
								WHERE ((CatalogID = @CatalogID)
										AND (SubCatalogID = @SubCatalogID)
										AND (UPPER(LTRIM(RTRIM(ProductName))) = UPPER(LTRIM(RTRIM(@ProductName))))
										AND (ProductID != @ProductID)))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Sản phẩm đã tồn tại !';
							RETURN;
						END
					ELSE
						BEGIN
							UPDATE [dbo].Product
								SET	 ProductName = @ProductName
									,Description = @Description
									,Price = @Price
									,[Status] = @Status
									,CatalogID = @CatalogID
									,SubCatalogID = @SubCatalogID
							WHERE ProductID = @ProductID;
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
							RETURN;
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào!';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ProductItem_Delete]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ProductItem_Delete]
	@ProductItemID INT = 0,					-- Id các sản phẩm con
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra sản phẩm có tồn tại hay không
			IF NOT EXISTS (SELECT ProductItemID
							FROM [dbo].ProductItem WITH (NOLOCK)
							WHERE ProductItemID = @ProductItemID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại sản phẩm';
					RETURN;
				END

			-- Kiểm tra sản phẩm đó có đơn hàng nào không
			IF EXISTS (
			 SELECT * FROM [dbo].OrderDetail WITH (NOLOCK)
			 WHERE ProductItemID = @ProductItemID)
				BEGIN
					SET @ErrorCode = '1';
					SET @ErrorMessage = N'Có dữ liệu liên quan, không thể xóa';
					RETURN;
				END

			--Thực hiện xóa
			ELSE
				BEGIN
					DELETE FROM ProductItem
					WHERE ProductItemID = @ProductItemID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY

		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ProductItem_GetAll]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 23/4/2019
-- Description:	Hàm lấy ra danh sách số lượng sản phẩm theo size
-- =============================================
CREATE PROCEDURE [dbo].[ProductItem_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT 
				PI.ProductItemID,
				P.ProductName,
				IP.Image,
				S.SizeName,
				PI.AmountStock,
				PI.Status
			FROM dbo.ProductItem AS PI 
			INNER JOIN Product AS P ON PI.ProductID = P.ProductID
			INNER JOIN Size AS S ON PI.SizeID = S.SizeID
			OUTER APPLY(SELECT TOP 1 IP.Image FROM ImageProduct IP WHERE IP.ProductID = PI.ProductID) AS IP
			ORDER BY PI.ProductItemID DESC
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ProductItem_GetItemById]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 23/4/2019
-- Description:	Lấy thông tin chi tiết của sản phẩm con
-- =============================================
CREATE PROCEDURE [dbo].[ProductItem_GetItemById]
	@ProductItemID INT = 0,					-- Id sản phẩm con
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra sản phẩm có tồn tại hay không
			IF NOT EXISTS (SELECT ProductItemID 
							FROM [dbo].ProductItem WITH (NOLOCK)
							WHERE ProductItemID = @ProductItemID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại sản phẩm'
					RETURN;
				END

			--Lấy thông tin theo ID
			ELSE
				BEGIN
					SELECT
						ProductItemID,
						ProductID,
						SizeID,
						AmountStock,
						Status
					FROM [dbo].ProductItem WITH (NOLOCK)
					WHERE ProductItemID = @ProductItemID
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ProductItem_Insert]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 23/4/2019
-- Description:	hàm thêm sản phẩm con
-- =============================================
CREATE PROCEDURE [dbo].[ProductItem_Insert]
	@ProductID INT = 0,						-- ID sản phẩm
	@SizeID INT = 0,						-- ID size
	@AmountStock INT = 0,					-- Số lượng sản phẩm tồn trong kho
	@Status INT = 0,						-- Trạng thái sản phẩm con
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra dữ liệu bắt buộc truyền vào
			IF ((@ProductID <> '' AND @ProductID IS NOT NULL)
				AND (@SizeID <> '' AND @SizeID IS NOT NULL)
				AND (@AmountStock <> '' AND @AmountStock IS NOT NULL))
				BEGIN
					-- Kiểm tra dữ liệu trùng
					IF EXISTS (SELECT ProductItemID
								FROM dbo.ProductItem WITH (NOLOCK)
								WHERE ((ProductID = @ProductID)
										AND (SizeID = @SizeID)))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Sản phẩm đã tồn tại !';
							RETURN;
						END	
					ELSE
						BEGIN
							-- Thêm mới sản phẩm vào db
							INSERT INTO [dbo].ProductItem
								(	 
									ProductID
									,SizeID
									,AmountStock
									,Status
								)
								VALUES 
								(	
									@ProductID
									,@SizeID 
									,@AmountStock
									,@Status
								)
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào !';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ProductItem_Update]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 23/4/2019
-- Description:	Hàm cập nhật sản phẩm con
-- =============================================
CREATE PROCEDURE [dbo].[ProductItem_Update]
	@ProductItemID INT = 0,					-- ID sản phẩm con
	@ProductID INT =  0,					-- ID sản phẩm cha
	@SizeID INT = 0,						-- ID size
	@AmountStock INT = 0,					-- Số lượng sản phẩm tồn trong kho
	@Status INT = 0,						-- Trạng thái sản phẩm con
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN	
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra sản phẩm có tồn tại hay không
			IF NOT EXISTS(SELECT ProductItemID
							FROM [dbo].ProductItem WITH (NOLOCK)
							WHERE ProductItemID = @ProductItemID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại sản phẩm!';
					RETURN;
				END

			-- Kiểm tra dữ liệu bắt buộc truyền vào 
			IF ((@ProductID <> '' AND @ProductID IS NOT NULL)
				AND (@SizeID <> '' AND @SizeID IS NOT NULL)
				AND (@AmountStock <> '' AND @AmountStock IS NOT NULL))
				BEGIN
					-- Kiểm tra dữ liệu trùng
					IF EXISTS (SELECT ProductItemID
								FROM dbo.ProductItem WITH (NOLOCK)
								WHERE ((ProductItemID != @ProductItemID)
										AND (ProductID = @ProductID)
										AND (SizeID = @SizeID)))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Sản phẩm đã tồn tại !';
							RETURN;
						END
					ELSE
						BEGIN
							UPDATE [dbo].ProductItem
								SET	ProductID = @ProductID
									,SizeID = @SizeID
									,AmountStock = @AmountStock
									,Status = @Status
							WHERE ProductItemID = @ProductItemID;
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
							RETURN;
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào!';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Province_Delete]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 22/3/2019
-- Description:	Hàm xóa tỉnh thành
-- =============================================
CREATE PROCEDURE [dbo].[Province_Delete]
	@ProvinceID INT = 0,					-- Id tỉnh thành 
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra tỉnh thành có tồn tại hay không
			IF NOT EXISTS (SELECT ProvinceID
							FROM [dbo].Province WITH (NOLOCK)
							WHERE ProvinceID = @ProvinceID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại tỉnh thành';
					RETURN;
				END
			
			-- Kiểm tra tỉnh thành đó có đang chứa quận huyện nào không
			IF EXISTS (
			 SELECT D.DistrictID 
			 FROM [dbo].District AS D WITH (NOLOCK)
			 WHERE D.ProvinceID = @ProvinceID)

			-- Kiểm tra tỉnh thành đó có đơn hàng nào không
			OR EXISTS (
			 SELECT U.UserID
			 FROM [dbo].[User] AS U WITH (NOLOCK)
			 WHERE U.ProvinceID = @ProvinceID)
				BEGIN
					SET @ErrorCode = '1';
					SET @ErrorMessage = N'Có dữ liệu liên quan, không thể xóa';
					RETURN;
				END

			-- Thực hiện việc xóa
			ELSE
				BEGIN
					DELETE FROM [dbo].[Province]
					WHERE ProvinceID = @ProvinceID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY

		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Province_GetAll]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 22/3/2019
-- Description:	Hàm lấy ra tất cả dữ liệu bảng province
-- =============================================
CREATE PROCEDURE [dbo].[Province_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				ProvinceID,
				ProvinceName,
				Status
			FROM [dbo].Province WITH (NOLOCK)
			ORDER BY ProvinceID DESC;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Province_GetItemById]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 25/3/2019
-- Description:	Hàm	lấy thông tin tỉnh thành theo ID
-- =============================================
CREATE PROCEDURE [dbo].[Province_GetItemById]
	@ProvinceID INT = 0,					-- Id tỉnh thành 
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra tỉnh thành có tồn tại hay không
			IF NOT EXISTS (SELECT ProvinceID 
							FROM [dbo].[Province] WITH (NOLOCK)
							WHERE ProvinceID = @ProvinceID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại tỉnh thành'
					RETURN;
				END
			
			ELSE
				BEGIN
					--Lấy thông tin theo ID
					SELECT
						ProvinceID,
						ProvinceName,
						Status
					FROM [dbo].[Province] WITH (NOLOCK)
					WHERE ProvinceID = @ProvinceID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END	
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Province_Insert]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 25/3/2019
-- Description:	hàm thêm tỉnh thành 
-- =============================================
CREATE PROCEDURE [dbo].[Province_Insert]
	@ProvinceName NVARCHAR(MAX) = N'',		-- Tên tỉnh thành	
	@Status INT = 0,						-- Trạng thái tỉnh thành
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			IF (@ProvinceName <> '' AND @ProvinceName IS NOT NULL)
				BEGIN
					IF EXISTS (SELECT ProvinceID
								FROM dbo.Province WITH (NOLOCK)
								WHERE 
									((UPPER(LTRIM(RTRIM(ProvinceName))) = UPPER(LTRIM(RTRIM(@ProvinceName))))))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Tỉnh thành đã tồn tại !';
							RETURN;
						END	
					ELSE
						BEGIN
							INSERT INTO [dbo].[Province]
								(	 
									ProvinceName
									,Status
								)
								VALUES 
								(	
									@ProvinceName 
									,@Status
								)
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào !';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Province_Update]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 25/3/2019
-- Description:	Hàm cập nhật tỉnh thành
-- =============================================
CREATE PROCEDURE [dbo].[Province_Update]
	@ProvinceID INT = 0,					-- ID tỉnh thành
	@ProvinceName NVARCHAR(MAX) = N'',		-- Tên tỉnh thành
	@Status INT = 0,						-- Trạng thái tỉnh thành
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN	
	SET NOCOUNT ON;
		BEGIN TRY
			IF NOT EXISTS(SELECT ProvinceID
							FROM [dbo].[Province] WITH (NOLOCK)
							WHERE ProvinceID = @ProvinceID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại tỉnh thành !';
					RETURN;
				END

			IF (@ProvinceName <> '' AND @ProvinceName IS NOT NULL)
				BEGIN
					IF EXISTS (SELECT ProvinceID
								FROM dbo.Province WITH (NOLOCK)
								WHERE							
								((UPPER(LTRIM(RTRIM(ProvinceName))) = UPPER(LTRIM(RTRIM(@ProvinceName))))
								AND (ProvinceID != @ProvinceID)))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Tỉnh thành đã tồn tại !';
							RETURN;
						END
					ELSE
						BEGIN
							UPDATE [dbo].[Province]
							SET	 ProvinceName = @ProvinceName
								,[Status] = @Status
							WHERE ProvinceID = @ProvinceID;
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
							RETURN;
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào!';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Size_Delete]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 3/4/2019
-- Description:	Hàm xóa size
-- =============================================
CREATE PROCEDURE [dbo].[Size_Delete]
	@SizeID INT = 0,						-- Id size
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra size có tồn tại hay không
			IF NOT EXISTS (SELECT SizeID
							FROM [dbo].Size WITH (NOLOCK)
							WHERE SizeID = @SizeID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại size';
					RETURN;
				END

			-- Kiểm tra size đó có được dùng ở sản phẩm con nào không
			IF EXISTS (
			 SELECT  PI.ProductItemID
			 FROM [dbo].ProductItem AS PI WITH (NOLOCK)
			 WHERE PI.SizeID = @SizeID)
				BEGIN
					SET @ErrorCode = '1';
					SET @ErrorMessage = N'Có dữ liệu liên quan, không thể xóa';
					RETURN;
				END

			-- Thực hiện việc xóa
			ELSE
				BEGIN
					DELETE FROM [dbo].Size
					WHERE SizeID = @SizeID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY

		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Size_GetAll]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 3/4/2019
-- Description:	Hàm lấy ra tất cả dữ liệu bảng size
-- =============================================
CREATE PROCEDURE [dbo].[Size_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				SizeID,
				SizeName,
				Status
			FROM [dbo].Size WITH (NOLOCK)
			ORDER BY SizeID DESC;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Size_GetItemById]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 3/4/2019
-- Description:	Hàm	lấy thông tin size theo ID
-- =============================================
CREATE PROCEDURE [dbo].[Size_GetItemById]
	@SizeID INT = 0,						-- Id size
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra size có tồn tại hay không
			IF NOT EXISTS (SELECT SizeID 
							FROM [dbo].Size WITH (NOLOCK)
							WHERE SizeID = @SizeID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại size'
					RETURN;
				END
			
			ELSE
				BEGIN
					--Lấy thông tin theo ID
					SELECT
						SizeID,
						SizeName,
						Status
					FROM [dbo].Size WITH (NOLOCK)
					WHERE SizeID = @SizeID
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END	
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Size_Insert]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 3/4/2019
-- Description:	hàm thêm size
-- =============================================
CREATE PROCEDURE [dbo].[Size_Insert]
	@SizeName NVARCHAR(MAX) = N'',			-- Tên size	
	@Status INT = 0,						-- Trạng thái size
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			IF (@SizeName <> '' AND @SizeName IS NOT NULL)
				BEGIN
					IF EXISTS (SELECT SizeID
								FROM dbo.Size WITH (NOLOCK)
								WHERE 
									((UPPER(LTRIM(RTRIM(SizeName))) = UPPER(LTRIM(RTRIM(@SizeName))))))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Size đã tồn tại !';
							RETURN;
						END	
					ELSE
						BEGIN
							INSERT INTO [dbo].Size
								(	 
									SizeName
									,Status
								)
								VALUES 
								(	
									@SizeName
									,@Status
								)
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào !';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Size_Update]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 3/4/2019
-- Description:	Hàm cập nhật size
-- =============================================
CREATE PROCEDURE [dbo].[Size_Update]
	@SizeID INT = 0,						-- ID size
	@SizeName NVARCHAR(MAX) = N'',			-- Tên size
	@Status INT = 0,						-- Trạng thái 
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN	
	SET NOCOUNT ON;
		BEGIN TRY
			IF NOT EXISTS(SELECT SizeID
							FROM [dbo].Size WITH (NOLOCK)
							WHERE SizeID = @SizeID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại size !';
					RETURN;
				END

			IF (@SizeName <> '' AND @SizeName IS NOT NULL)
				BEGIN
					IF EXISTS (SELECT SizeID
								FROM dbo.Size WITH (NOLOCK)
								WHERE							
								((UPPER(LTRIM(RTRIM(SizeName))) = UPPER(LTRIM(RTRIM(@SizeName))))
								AND (SizeID != @SizeID)))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Size đã tồn tại !';
							RETURN;
						END
					ELSE
						BEGIN
							UPDATE [dbo].Size
								SET	 SizeName = @SizeName
									,[Status] = @Status
							WHERE SizeID = @SizeID;
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
							RETURN;
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào!';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Statistic_GetAmountStock]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 16/5/2019
-- Description:	Hàm lấy danh sách hàng tồn trong kho
-- =============================================
CREATE PROCEDURE [dbo].[Statistic_GetAmountStock]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				P.ProductName,
				C.CatalogName,
				SC.SubCatalogName,
				P.Price,
				S.SizeName,
				PI.AmountStock
			FROM [dbo].ProductItem AS PI WITH (NOLOCK)
			INNER JOIN [dbo].Product AS P WITH(NOLOCK) ON PI.ProductID = P.ProductID
			INNER JOIN [dbo].Size AS S WITH(NOLOCK) ON PI.SizeID = S.SizeID
			INNER JOIN [dbo].[Catalog] AS C WITH(NOLOCK) ON P.CatalogID = C.CatalogID
			INNER JOIN [dbo].SubCatalog AS SC WITH(NOLOCK) ON P.SubCatalogID = SC.SubCatalogID
			WHERE PI.AmountStock > 0
			ORDER BY P.CatalogID ASC;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Statistic_GetListOrder]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 15/5/2019
-- Description:	Hàm lấy danh sách đơn hàng theo tháng , năm
-- =============================================
CREATE PROCEDURE [dbo].[Statistic_GetListOrder]
	@Month INT = 0,							-- Tháng
	@Year INT = 0,							-- Năm
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		DECLARE @searchQuery NVARCHAR(MAX) = '';
		DECLARE @query NVARCHAR(MAX) = '';
		IF (@Month <> 0 AND @Year <> 0)
			SET @searchQuery = 'MONTH(UO.DateCreate) = '+ CAST(@Month AS nvarchar ) +
								'AND YEAR(UO.DateCreate) = '+ CAST(@Year AS nvarchar ) +''
		ELSE
			SET @searchQuery = 'YEAR(UO.DateCreate) = '+ CAST(@Year AS nvarchar ) +''
		BEGIN TRY
			BEGIN
				SET @query = 'SELECT
								OD.UserOrderID,
								U.FullName,
								U.PhoneNumber,
								U.Email,
								U.Address,
								P.ProvinceName,
								D.DistrictName,
								UO.DateCreate,
								UO.Status,
								SUM(OD.Total) AS TotalMoney
							FROM dbo.[User] AS U
							LEFT JOIN dbo.Province AS P
							ON U.ProvinceID = P.ProvinceID
							LEFT JOIN dbo.District AS D
							ON U.DistrictID = D.DistrictID
							INNER JOIN dbo.UserOrder AS UO
							ON U.UserID = UO.UserID
							INNER JOIN dbo.OrderDetail AS OD
							ON UO.UserOrderID = OD.UserOrderID
							WHERE ' + @searchQuery + ' 
							GROUP BY
								OD.UserOrderID,
								U.FullName,
								U.PhoneNumber,
								U.Email,
								U.Address,
								P.ProvinceName,
								D.DistrictName,
								UO.DateCreate,
								UO.Status
							ORDER BY OD.UserOrderID DESC'	
			END				
			EXEC SP_EXECUTESQL @query;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
			RETURN;
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================			
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SubCatalog_Delete]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 1/4/2019
-- Description:	Hàm xóa danh mục con
-- =============================================
CREATE PROCEDURE [dbo].[SubCatalog_Delete]
	@SubCatalogID INT = 0,					-- Id danh mục con
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra danh mục con có tồn tại hay không
			IF NOT EXISTS (SELECT SubCatalogID
							FROM [dbo].SubCatalog WITH (NOLOCK)
							WHERE SubCatalogID = @SubCatalogID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại danh mục con';
					RETURN;
				END

			-- Kiểm tra danh mục con đó có sản phẩm nào không
			IF EXISTS (
			 SELECT P.ProductID
			 FROM [dbo].Product AS P WITH (NOLOCK)
			 WHERE P.SubCatalogID = @SubCatalogID)
				BEGIN
					SET @ErrorCode = '1';
					SET @ErrorMessage = N'Có dữ liệu liên quan, không thể xóa';
					RETURN;
				END
			
			--Thực hiện xóa
			ELSE
				BEGIN
					DELETE FROM [dbo].[SubCatalog]
					WHERE SubCatalogID = @SubCatalogID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY

		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SubCatalog_GetAll]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	2/4/2019
-- Description:	Hàm lấy ra tất cả dữ liệu bảng subcatalog
-- =============================================
CREATE PROCEDURE [dbo].[SubCatalog_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				SC.SubCatalogID,
				SC.SubCatalogName,
				SC.Status,
				C.CatalogName
			FROM [dbo].[SubCatalog] AS SC WITH (NOLOCK)
			INNER JOIN [dbo].[Catalog] AS C WITH(NOLOCK)
			ON SC.CatalogID = C.CatalogID
			ORDER BY SC.SubCatalogID DESC;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SubCatalog_GetItemById]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 2/4/2019
-- Description:	Hàm lấy thông tin danh mục con theo ID 
-- =============================================
CREATE PROCEDURE [dbo].[SubCatalog_GetItemById]
	@SubCatalogID INT = 0,					-- Id danh mục con
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra danh mục con có tồn tại hay không
			IF NOT EXISTS (SELECT @SubCatalogID 
							FROM [dbo].SubCatalog WITH (NOLOCK)
							WHERE SubCatalogID = @SubCatalogID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại danh mục con'
					RETURN;
				END

			--Lấy thông tin theo ID
			ELSE
				BEGIN
					SELECT
						SubCatalogID,
						SubCatalogName,
						Status,
						CatalogID
					FROM [dbo].SubCatalog WITH (NOLOCK)
					WHERE SubCatalogID = @SubCatalogID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END	
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SubCatalog_Insert]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 2/4/2019
-- Description:	hàm thêm danh mục con
-- =============================================
CREATE PROCEDURE [dbo].[SubCatalog_Insert]
	@SubCatalogName NVARCHAR(MAX) = N'',	-- Tên danh mục con
	@Status INT = 0,						-- Trạng thái danh mục con
	@CatalogID INT = 0,						-- ID danh mục cha
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			---- Tạo SubCatalogCode
			--DECLARE @SubCatalogCodeFinal NVARCHAR(50) = '';
			--SET @SubCatalogCodeFinal = (SELECT CatalogCode FROM dbo.[Catalog] WHERE CatalogID = @CatalogID) + '_' + UPPER(LTRIM(RTRIM(@SubCatalogCode)));
			
			IF ((@CatalogID <> '' AND @CatalogID IS NOT NULL)
				AND (@SubCatalogName <> '' AND @SubCatalogName IS NOT NULL))
				BEGIN
					IF EXISTS (SELECT SubCatalogID
								FROM dbo.[SubCatalog] WITH (NOLOCK)
								WHERE
									((CatalogID = @CatalogID)
									AND (UPPER(LTRIM(RTRIM(SubCatalogName))) = UPPER(LTRIM(RTRIM(@SubCatalogName))))))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Danh mục con đã tồn tại !';
							RETURN;
						END	
					ELSE
						BEGIN
							INSERT INTO [dbo].SubCatalog
								(	 
									SubCatalogName
									,Status
									,CatalogID
								)
								VALUES 
								(	
									@SubCatalogName 
									,@Status
									,@CatalogID
								)
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào !';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
	-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SubCatalog_Update]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 2/4/2019
-- Description:	Hàm cập nhật danh mục con
-- =============================================
CREATE PROCEDURE [dbo].[SubCatalog_Update]
	@SubCatalogID INT = 0,					-- ID danh mục con
	@SubCatalogName NVARCHAR(MAX) = N'',	-- Tên danh mục con
	@Status INT = 0,						-- Trạng thái danh mục con
	@CatalogID INT = 0,						-- ID danh mục cha
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN	
	SET NOCOUNT ON;
		BEGIN TRY
			IF NOT EXISTS(SELECT SubCatalogID
							FROM [dbo].SubCatalog WITH (NOLOCK)
							WHERE SubCatalogID = @SubCatalogID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại danh mục con !';
					RETURN;
				END

			IF ((@SubCatalogName <> '' AND @SubCatalogName IS NOT NULL)
				AND (@CatalogID <> '' AND @CatalogID IS NOT NULL))
				BEGIN
					IF EXISTS (SELECT SubCatalogID
								FROM dbo.SubCatalog WITH (NOLOCK)
								WHERE							
								((CatalogID = @CatalogID)
								AND (UPPER(LTRIM(RTRIM(SubCatalogName))) = UPPER(LTRIM(RTRIM(@SubCatalogName))))
								AND (SubCatalogID != @SubCatalogID)))
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Danh mục con đã tồn tại !';
							RETURN;
						END
					ELSE
						BEGIN
							UPDATE [dbo].SubCatalog
								SET	 SubCatalogName = @SubCatalogName
									,CatalogID = @CatalogID
									,[Status] = @Status
							WHERE SubCatalogID = @SubCatalogID;
							SET @ErrorCode  = N'0';
							SET @ErrorMessage = N'';
							RETURN;
						END
				END
			ELSE
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào!';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[UserLogin_GetAll]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 12/6/2019
-- Description:	Hàm lấy ra tất cả các tài khoản người dùng
-- =============================================
CREATE PROCEDURE [dbo].[UserLogin_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				U.UserID,
				U.Account,
				U.FullName,
				U.PhoneNumber,
				U.Email,
				U.Address,
				P.ProvinceName,
				D.DistrictName
			FROM [dbo].[User] AS U WITH (NOLOCK)
			LEFT JOIN dbo.Province AS P
			ON U.ProvinceID = P.ProvinceID
			LEFT JOIN dbo.District AS D
			ON U.DistrictID = D.DistrictID
			WHERE ((U.Account <> '' AND U.Account IS NOT NULL)
			AND (U.Password <> '' AND U.Password IS NOT NULL))
			ORDER BY U.UserID DESC;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[UserLogin_GetAllOrder]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	12/6/2019
-- Description:	Hàm lấy ra lịch sử toàn bộ đơn hàng theo id người dùng đăng nhập
-- =============================================
CREATE PROCEDURE [dbo].[UserLogin_GetAllOrder]
	@UserID INT,							-- ID người dùng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra người dùng có tồn tại hay không
			IF NOT EXISTS (SELECT UserOrderID 
							FROM [dbo].UserOrder WITH (NOLOCK)
							WHERE UserID = @UserID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại người dùng'
					RETURN;
				END

			--Lấy thông tin theo ID đơn hàng
			ELSE
				BEGIN
					SELECT
						UO.UserOrderID,
						UO.DateCreate,
						UO.Status,
						UO.Note,
						SUM(OD.Total) AS TotalMoney
					FROM dbo.UserOrder AS UO
					INNER JOIN dbo.OrderDetail AS OD 
					ON UO.UserOrderID = OD.UserOrderID
					WHERE UO.UserID = @UserID
					GROUP BY
						UO.UserOrderID,
						UO.DateCreate,
						UO.Status,
						UO.Note
					ORDER BY UO.UserOrderID DESC
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		--=========================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
		--=========================================
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[UserLogin_GetOrderDetail]    Script Date: 02/12/2021 00:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 12/06/2019
-- Description:	Hàm lấy thông tin chi tiết của đơn hàng theo ID người dùng
-- =============================================
CREATE PROCEDURE [dbo].[UserLogin_GetOrderDetail]
	@UserOrderID INT = 0,					-- Id đơn hàng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra đơn hàng có tồn tại hay không
			IF NOT EXISTS (SELECT UserOrderID 
							FROM [dbo].OrderDetail WITH (NOLOCK)
							WHERE UserOrderID = @UserOrderID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại đơn hàng'
					RETURN;
				END

			--Lấy thông tin theo ID đơn hàng
			ELSE
				BEGIN
					SELECT
						P.ProductName,
						S.SizeName,
						IP.Image,
						P.Price,
						OD.AmountBuy,
						OD.Total
					FROM [dbo].OrderDetail AS OD WITH (NOLOCK)
					INNER JOIN [dbo].UserOrder AS UO WITH (NOLOCK) ON OD.UserOrderID= UO.UserOrderID
					INNER JOIN dbo.ProductItem AS PI WITH (NOLOCK) ON OD.ProductItemID = PI.ProductItemID
					INNER JOIN dbo.Product AS P WITH (NOLOCK) ON PI.ProductID = P.ProductID
					INNER JOIN dbo.Size AS S WITH (NOLOCK) ON PI.SizeID = S.SizeID
					OUTER APPLY(SELECT TOP 1 IP.Image FROM ImageProduct IP WHERE IP.ProductID = PI.ProductID) AS IP
					WHERE (OD.UserOrderID = @UserOrderID);
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'';
					RETURN;
				END
		END TRY
		-- ========================================================
		BEGIN CATCH
			SET @ErrorCode = ERROR_NUMBER();
			SET @ErrorMessage = ERROR_MESSAGE(); 
		END CATCH
		-- ========================================================
	SET NOCOUNT OFF;
END
GO
USE [master]
GO
ALTER DATABASE [SneakerDB] SET  READ_WRITE 
GO
