USE [master]
GO
/****** Object:  Database [SneakerDB]    Script Date: 25/03/2022 07:24:30 ******/
CREATE DATABASE [SneakerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SneakerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SneakerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SneakerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SneakerDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  FullTextCatalog [ProductName]    Script Date: 25/03/2022 07:24:30 ******/
CREATE FULLTEXT CATALOG [ProductName] 
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  Table [dbo].[Catalog]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  Table [dbo].[District]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  Table [dbo].[ImageProduct]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreate] [datetime] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_UserOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductItemID] [int] NOT NULL,
	[PriceBuy] [int] NULL,
	[AmountBuy] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](1000) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CatalogID] [int] NOT NULL,
	[SubCatalogID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductItem]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductItem](
	[ProductItemID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[SizeID] [int] NOT NULL,
	[AmountStock] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_ProductItem] PRIMARY KEY CLUSTERED 
(
	[ProductItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  Table [dbo].[Size]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCatalog]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Phone] [nvarchar](10) NULL,
	[Address] [nvarchar](500) NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[District] ADD  CONSTRAINT [DF_District_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Province] ADD  CONSTRAINT [DF_Province_Status]  DEFAULT ((1)) FOR [Status]
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
/****** Object:  StoredProcedure [dbo].[Admin_Delete]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[Admin_GetAll]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[Admin_GetItemById]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[Admin_Insert]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[Admin_Update]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[District_Delete]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[District_GetAll]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[District_GetItemById]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[District_Insert]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[District_Update]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[ImageProduct_Delete]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[ImageProduct_GetAll]    Script Date: 25/03/2022 07:24:30 ******/
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
	--@ProductID INT = 0,						-- Id sản phẩm
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra sản phẩm có tồn tại hay không
			--IF NOT EXISTS (SELECT ProductID 
			--				FROM [dbo].Product WITH (NOLOCK)
			--				WHERE ProductID = @ProductID)
			--	BEGIN
			--		SET @ErrorCode = N'1';
			--		SET @ErrorMessage = N'Không tồn tại sản phẩm'
			--		RETURN;
			--	END

			----Lấy thông tin theo ID
			--ELSE
			--	BEGIN
			--		SELECT
			--			IP.ImageID,
			--			P.ProductName,
			--			IP.Image
			--		FROM [dbo].ImageProduct AS IP WITH (NOLOCK)
			--		INNER JOIN [dbo].Product AS P WITH (NOLOCK)
			--		ON IP.ProductID = P.ProductID
			--		WHERE (IP.ProductID = @ProductID)
			--		SET @ErrorCode = N'0';
			--		SET @ErrorMessage = N'';
			--		RETURN;
			--	END

			SELECT
				IP.ImageID,
				IP.Image,
				P.ProductName
			FROM [dbo].ImageProduct AS IP WITH (NOLOCK)
			INNER JOIN [dbo].Product AS P WITH (NOLOCK) ON IP.ProductID = P.ProductID
			ORDER BY IP.ImageID DESC;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
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
/****** Object:  StoredProcedure [dbo].[ImageProduct_GetItemById]    Script Date: 25/03/2022 07:24:30 ******/
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
						Image,
						ProductID
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
/****** Object:  StoredProcedure [dbo].[ImageProduct_Insert]    Script Date: 25/03/2022 07:24:30 ******/
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
	@Image NVARCHAR(MAX) = N'',				-- Đường dẫn ảnh
	@ProductID INT = 0,						-- ID của sản phẩm
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
							Image,
							ProductID
						)
						VALUES 
						(	
							@Image,
							@ProductID 
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
/****** Object:  StoredProcedure [dbo].[ImageProduct_Update]    Script Date: 25/03/2022 07:24:30 ******/
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
	@ProductID INT = 0,						-- Tên sản phẩm		
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
			IF ((@Image <> '' AND @Image IS NOT NULL)
				AND (@ProductID <> '' AND @ProductID IS NOT NULL))
				BEGIN
					UPDATE [dbo].ImageProduct
						SET Image = @Image,
							ProductID = @ProductID
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
/****** Object:  StoredProcedure [dbo].[IS_Catalog_Delete]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 2/4/2019
-- Description:	Hàm xóa danh mục
-- =============================================
CREATE PROCEDURE [dbo].[IS_Catalog_Delete]
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
					SET @ErrorMessage = N'Hãng giày không tồn tại';
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
/****** Object:  StoredProcedure [dbo].[IS_Catalog_GetAll]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	2/4/2019
-- Description:	Hàm lấy ra tất cả dữ liệu bảng catalog
-- =============================================
CREATE PROCEDURE [dbo].[IS_Catalog_GetAll]
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
/****** Object:  StoredProcedure [dbo].[IS_Catalog_GetItemById]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 2/4/2019
-- Description:	Hàm lấy thông tin danh mục theo ID 
-- =============================================
CREATE PROCEDURE [dbo].[IS_Catalog_GetItemById]
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
/****** Object:  StoredProcedure [dbo].[IS_Catalog_Insert]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 2/4/2019
-- Description:	Hàm thêm danh mục
-- =============================================
CREATE PROCEDURE [dbo].[IS_Catalog_Insert]
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
/****** Object:  StoredProcedure [dbo].[IS_Catalog_Update]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date: 2/4/2019
-- Description:	Hàm sửa danh mục 
-- =============================================
CREATE PROCEDURE [dbo].[IS_Catalog_Update]
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
/****** Object:  StoredProcedure [dbo].[IS_Chart_CountCatalogProduct]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 15/5/2019
-- Description:	Hàm lấy ra phần trăm của từng danh mục so với tổng tất cả sản phẩm 
-- =============================================
CREATE PROCEDURE [dbo].[IS_Chart_CountCatalogProduct]
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
/****** Object:  StoredProcedure [dbo].[IS_Chart_CountOrderStatus]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: 14/5/2019
-- Description:	Hàm đếm số đơn hàng theo trạng thái
-- =============================================
CREATE PROCEDURE [dbo].[IS_Chart_CountOrderStatus]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT 
				(SELECT COUNT 
					(OrderID) 
				FROM [dbo].[Order] 
				WHERE Status = 1) AS WaitConfirm,

				(SELECT COUNT 
					(OrderID) 
				FROM [dbo].[Order] 
				WHERE Status = 2) AS Shipping,

				(SELECT COUNT 
					(OrderID) 
				FROM [dbo].[Order] 
				WHERE Status = 3) AS Complete,

				(SELECT COUNT 
					(OrderID) 
				FROM [dbo].[Order] 
				WHERE Status = 4) AS Destroy

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
/****** Object:  StoredProcedure [dbo].[IS_Chart_TopSellProduct]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 14/5/2019
-- Description:	Hàm lấy ra 10 sản phẩm bán nhiều nhất trong đơn hàng 
-- =============================================
CREATE PROCEDURE [dbo].[IS_Chart_TopSellProduct]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT TOP 10
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
/****** Object:  StoredProcedure [dbo].[IS_GetProductByCatalog]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[IS_GetSubCatalogByCatalog]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[IS_Order_ChangeStatus]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 10/05/2019
-- Description:	Hàm thay đổi trạng thái của đơn hàng
-- =============================================
CREATE PROCEDURE [dbo].[IS_Order_ChangeStatus]
	@OrderID INT = 0,						-- Id đơn hàng
	@Status INT = 0,						-- Trạng thái đơn hàng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra đơn hàng có tồn tại hay không
			IF NOT EXISTS (SELECT OrderID
							FROM [dbo].[Order] WITH (NOLOCK)
							WHERE OrderID = @OrderID)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Không tồn tại đơn hàng';
					RETURN;
				END

			-- Thực hiện thay đổi trạng thái
			ELSE
				BEGIN
					UPDATE [dbo].[Order]
					SET Status = @Status
					WHERE OrderID = @OrderID;
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
/****** Object:  StoredProcedure [dbo].[IS_Order_Destroy]    Script Date: 25/03/2022 07:24:30 ******/
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
CREATE PROCEDURE [dbo].[IS_Order_Destroy]
	@OrderID INT = 0,						-- Id đơn hàng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
	DECLARE
		--Giá trị lấy từ con trỏ
		@ProductItemID INT,
		@AmountBuy INT,
		--Giá trị hàng tồn trong con trỏ
		@AmountStock INT
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra đơn hàng có tồn tại hay không
			IF NOT EXISTS (SELECT OrderID
							FROM [dbo].[Order] WITH (NOLOCK)
							WHERE OrderID = @OrderID)
			OR NOT EXISTS (SELECT OrderID
							FROM [dbo].[OrderDetail] WITH (NOLOCK)
							WHERE OrderID = @OrderID)
			BEGIN
				SET @ErrorCode = N'1';
				SET @ErrorMessage = N'Không tồn tại đơn hàng';
				RETURN;
			END
			
			-- Thực hiện cộng hàng vào kho
			BEGIN
				-- Khởi tạo bảng cho con trỏ
				DECLARE ChangeStockCursor CURSOR FOR
				SELECT 
					ProductItemID,
					AmountBuy
				FROM
					OrderDetail
				WHERE
					OrderID = @OrderID

				-- Sử dụng con trỏ để cập nhật số lượng trong kho
				BEGIN
					OPEN ChangeStockCursor
					FETCH NEXT FROM ChangeStockCursor
					INTO @ProductItemID, @AmountBuy
					WHILE @@FETCH_STATUS = 0
					BEGIN
						SET @AmountStock = 
							(SELECT
								AmountStock
							FROM ProductItem
							WHERE ProductItemID = @ProductItemID)

						UPDATE DBO.ProductItem
						SET AmountStock = @AmountStock + @AmountBuy
						WHERE ProductItemID = @ProductItemID

						FETCH NEXT FROM ChangeStockCursor
						INTO @ProductItemID, @AmountBuy
					END
					CLOSE ChangeStockCursor;
					DEALLOCATE ChangeStockCursor;
				END

				-- Thực hiện thay đổi trạng thái
				BEGIN
					UPDATE [dbo].[Order]
					SET Status = 4
					WHERE OrderID = @OrderID;
				END

				SET @ErrorCode  = N'0';
				SET @ErrorMessage = N'';
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
/****** Object:  StoredProcedure [dbo].[IS_Order_GetAll]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	18/4/2019
-- Description:	Hàm lấy ra danh sách tất cả đơn hàng
-- =============================================
CREATE PROCEDURE [dbo].[IS_Order_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				O.OrderID,
				FORMAT(O.DateCreate,'dd/MM/yyyy hh:mm:ss') AS DateCreate,
				U.FullName,
				U.Phone,
				U.Address,
				O.Note,
				O.Status,
				SUM(OD.Total) AS Total
			FROM [dbo].[Order] AS O
			INNER JOIN [dbo].[User] AS U ON O.UserID = U.UserID
			CROSS APPLY
				(select 
					PriceBuy * AmountBuy AS Total
				from 
				dbo.OrderDetail OD
				where OD.OrderID = O.OrderID) OD
			GROUP BY
				O.OrderID,
				O.DateCreate,
				U.FullName,
				U.Phone,
				U.Address,
				O.Note,
				O.Status
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
/****** Object:  StoredProcedure [dbo].[IS_Order_GetOrderDetailById]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 18/4/2019
-- Description:	Hàm lấy thông tin chi tiết của đơn hàng
-- =============================================
CREATE PROCEDURE [dbo].[IS_Order_GetOrderDetailById]
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
						IP.Image,
						P.ProductName,
						S.SizeName,
						OD.PriceBuy,
						OD.AmountBuy,
						(OD.PriceBuy * OD.AmountBuy) AS Total
					FROM [dbo].OrderDetail AS OD WITH (NOLOCK)
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
/****** Object:  StoredProcedure [dbo].[IS_Product_Delete]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 4/4/2019
-- Description:	Hàm xóa sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[IS_Product_Delete]
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
/****** Object:  StoredProcedure [dbo].[IS_Product_GetAll]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	4/4/2019
-- Description:	Hàm lấy ra tất cả dữ liệu bảng product
-- =============================================
CREATE PROCEDURE [dbo].[IS_Product_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				P.ProductID,
				P.ProductName,
				P.Status,
				C.CatalogName,
				SC.SubCatalogName,
				IP.Image
			FROM [dbo].Product AS P WITH (NOLOCK)
			INNER JOIN [dbo].[Catalog] AS C WITH(NOLOCK) ON P.CatalogID = C.CatalogID
			INNER JOIN [dbo].SubCatalog AS SC WITH(NOLOCK) ON P.SubCatalogID = SC.SubCatalogID
			OUTER APPLY 
				(SELECT	
					TOP 1 IP.Image 
				FROM 
					ImageProduct IP 
				WHERE 
					IP.ProductID = P.ProductID 
				ORDER BY 
					IP.ImageID DESC) AS IP
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
/****** Object:  StoredProcedure [dbo].[IS_Product_GetItemById]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 4/4/2019
-- Description:	Hàm lấy thông tin sản phẩm theo ID 
-- =============================================
CREATE PROCEDURE [dbo].[IS_Product_GetItemById]
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
/****** Object:  StoredProcedure [dbo].[IS_Product_Insert]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 4/4/2019
-- Description:	hàm thêm danh mục
-- =============================================
CREATE PROCEDURE [dbo].[IS_Product_Insert]
	@ProductName NVARCHAR(MAX) = N'',		-- Tên danh sản phẩm
	@Description NVARCHAR(MAX) = N'',		-- Mô tả sản phẩm
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
				AND (@ProductName <> '' AND @ProductName IS NOT NULL))
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
									,Status
									,CatalogID
									,SubCatalogID
								)
								VALUES 
								(	
									@ProductName
									,@Description
									,@Status
									,@CatalogID
									,@SubCatalogID
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
/****** Object:  StoredProcedure [dbo].[IS_Product_Update]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 4/4/2019
-- Description:	Hàm cập nhật sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[IS_Product_Update]
	@ProductID INT = 0,						-- ID sản phẩm
	@ProductName NVARCHAR(MAX) = N'',		-- Tên danh sản phẩm
	@Description NVARCHAR(MAX) = N'',		-- Mô tả sản phẩm
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
				AND (@ProductName <> '' AND @ProductName IS NOT NULL))
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
/****** Object:  StoredProcedure [dbo].[IS_ProductItem_Delete]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IS_ProductItem_Delete]
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
/****** Object:  StoredProcedure [dbo].[IS_ProductItem_GetAll]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 23/4/2019
-- Description:	Hàm lấy ra danh sách số lượng sản phẩm theo size
-- =============================================
CREATE PROCEDURE [dbo].[IS_ProductItem_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT 
				PI.ProductItemID,
				P.ProductName,
				--IP.Image,
				S.SizeName,
				PI.AmountStock,
				PI.Price
			FROM dbo.ProductItem AS PI 
			INNER JOIN Product AS P ON PI.ProductID = P.ProductID
			INNER JOIN Size AS S ON PI.SizeID = S.SizeID
			--OUTER APPLY(SELECT TOP 1 IP.Image FROM ImageProduct IP WHERE IP.ProductID = PI.ProductID) AS IP
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
/****** Object:  StoredProcedure [dbo].[IS_ProductItem_GetItemById]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 23/4/2019
-- Description:	Lấy thông tin chi tiết của sản phẩm con
-- =============================================
CREATE PROCEDURE [dbo].[IS_ProductItem_GetItemById]
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
						Price
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
/****** Object:  StoredProcedure [dbo].[IS_ProductItem_Insert]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 23/4/2019
-- Description:	hàm thêm sản phẩm con
-- =============================================
CREATE PROCEDURE [dbo].[IS_ProductItem_Insert]
	@ProductID INT = 0,						-- ID sản phẩm
	@SizeID INT = 0,						-- ID size
	@AmountStock INT = 0,					-- Số lượng sản phẩm tồn trong kho
	@Price INT = 0,							-- Giá sản phẩm
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
									,Price
								)
								VALUES 
								(	
									@ProductID
									,@SizeID 
									,@AmountStock
									,@Price
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
/****** Object:  StoredProcedure [dbo].[IS_ProductItem_Update]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 23/4/2019
-- Description:	Hàm cập nhật sản phẩm con
-- =============================================
CREATE PROCEDURE [dbo].[IS_ProductItem_Update]
	@ProductItemID INT = 0,					-- ID sản phẩm con
	@ProductID INT =  0,					-- ID sản phẩm cha
	@SizeID INT = 0,						-- ID size
	@AmountStock INT = 0,					-- Số lượng sản phẩm tồn trong kho
	@Price INT = 0,							-- Giá sản phẩm
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
			IF ((@ProductID <> '' OR @ProductID IS NOT NULL)
				OR (@SizeID <> '' OR @SizeID IS NOT NULL)
				OR (@AmountStock <> '' OR @AmountStock IS NOT NULL))
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
									,Price = @Price
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
/****** Object:  StoredProcedure [dbo].[IS_Report_GetAmountStock]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 16/5/2019
-- Description:	Hàm lấy danh sách hàng tồn trong kho
-- =============================================
CREATE PROCEDURE [dbo].[IS_Report_GetAmountStock]
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
				S.SizeName,
				PI.AmountStock,
				PI.Price
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
/****** Object:  StoredProcedure [dbo].[IS_Report_GetListOrder]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 15/5/2019
-- Description:	Hàm lấy danh sách đơn hàng theo tháng , năm
-- =============================================
CREATE PROCEDURE [dbo].[IS_Report_GetListOrder]
	@StartDate NVARCHAR(50) = N'',			-- Ngày bắt đầu
	@EndDate   NVARCHAR(50) = N'',			-- Ngày kết thúc
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				O.DateCreate,
				U.FullName,
				U.Phone,
				U.Address,
				O.Note,
				O.Status,
				SUM(OD.Total) AS Total
			FROM [dbo].[Order] AS O
			INNER JOIN [dbo].[User] AS U ON O.UserID = U.UserID
			CROSS APPLY
				(select 
					PriceBuy * AmountBuy AS Total
				from 
				dbo.OrderDetail OD
				where OD.OrderID = O.OrderID) OD
			WHERE O.DateCreate BETWEEN @StartDate AND @EndDate + ' 23:59:59'
			GROUP BY
				O.OrderID,
				O.DateCreate,
				U.FullName,
				U.Phone,
				U.Address,
				O.Note,
				O.Status
			ORDER BY O.OrderID DESC
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
/****** Object:  StoredProcedure [dbo].[IS_Size_Delete]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 3/4/2019
-- Description:	Hàm xóa size
-- =============================================
CREATE PROCEDURE [dbo].[IS_Size_Delete]
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
/****** Object:  StoredProcedure [dbo].[IS_Size_GetAll]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 3/4/2019
-- Description:	Hàm lấy ra tất cả dữ liệu bảng size
-- =============================================
CREATE PROCEDURE [dbo].[IS_Size_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				SizeID,
				SizeName
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
/****** Object:  StoredProcedure [dbo].[IS_Size_GetItemById]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 3/4/2019
-- Description:	Hàm	lấy thông tin size theo ID
-- =============================================
CREATE PROCEDURE [dbo].[IS_Size_GetItemById]
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
						SizeName
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
/****** Object:  StoredProcedure [dbo].[IS_Size_Insert]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 3/4/2019
-- Description:	hàm thêm size
-- =============================================
CREATE PROCEDURE [dbo].[IS_Size_Insert]
	@SizeName NVARCHAR(MAX) = N'',			-- Tên size	
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
								)
								VALUES 
								(	
									@SizeName
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
/****** Object:  StoredProcedure [dbo].[IS_Size_Update]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 3/4/2019
-- Description:	Hàm cập nhật size
-- =============================================
CREATE PROCEDURE [dbo].[IS_Size_Update]
	@SizeID INT = 0,						-- ID size
	@SizeName NVARCHAR(MAX) = N'',			-- Tên size
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
/****** Object:  StoredProcedure [dbo].[IS_SubCatalog_Delete]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 1/4/2019
-- Description:	Hàm xóa danh mục con
-- =============================================
CREATE PROCEDURE [dbo].[IS_SubCatalog_Delete]
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
/****** Object:  StoredProcedure [dbo].[IS_SubCatalog_GetAll]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	2/4/2019
-- Description:	Hàm lấy ra tất cả dữ liệu bảng subcatalog
-- =============================================
CREATE PROCEDURE [dbo].[IS_SubCatalog_GetAll]
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
/****** Object:  StoredProcedure [dbo].[IS_SubCatalog_GetItemById]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 2/4/2019
-- Description:	Hàm lấy thông tin danh mục con theo ID 
-- =============================================
CREATE PROCEDURE [dbo].[IS_SubCatalog_GetItemById]
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
/****** Object:  StoredProcedure [dbo].[IS_SubCatalog_Insert]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 2/4/2019
-- Description:	hàm thêm danh mục con
-- =============================================
CREATE PROCEDURE [dbo].[IS_SubCatalog_Insert]
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
/****** Object:  StoredProcedure [dbo].[IS_SubCatalog_Update]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 2/4/2019
-- Description:	Hàm cập nhật danh mục con
-- =============================================
CREATE PROCEDURE [dbo].[IS_SubCatalog_Update]
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
/****** Object:  StoredProcedure [dbo].[IS_User_GetAll]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 12/6/2019
-- Description:	Hàm lấy ra tất cả các tài khoản người dùng
-- =============================================
CREATE PROCEDURE [dbo].[IS_User_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				U.UserID,
				U.Email,
				U.FullName,
				U.Phone,
				U.Address
			FROM [dbo].[User] AS U WITH (NOLOCK)
			WHERE 
				(U.Password <> '' AND U.Password IS NOT NULL)
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
/****** Object:  StoredProcedure [dbo].[IS_User_GetOrderById]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	18/4/2019
-- Description:	Hàm lấy ra danh sách tất cả đơn hàng theo ID người dùng
-- =============================================
CREATE PROCEDURE [dbo].[IS_User_GetOrderById]
	@UserID INT = 0,						-- ID người dùng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				O.OrderID,
				FORMAT(O.DateCreate,'dd/MM/yyyy hh:mm:ss') AS DateCreate,
				O.Note,
				O.Status,
				SUM(OD.Total) AS Total
			FROM [dbo].[Order] AS O
			INNER JOIN [dbo].[User] AS U ON O.UserID = U.UserID
			CROSS APPLY
				(select 
					PriceBuy * AmountBuy AS Total
				from 
				dbo.OrderDetail OD
				where OD.OrderID = O.OrderID) OD
			WHERE U.UserID = @UserID
			GROUP BY
				O.OrderID,
				O.DateCreate,
				O.Note,
				O.Status
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
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[Order_GetOrderByStatus]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_CheckoutUserMember]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 19/12/2021
-- Description:	hàm thực hiện thanh toán người dùng đăng nhập
-- =============================================
CREATE PROCEDURE [dbo].[OS_CheckoutUserMember]
	@JSON NVARCHAR(MAX) = null,		-- JSON truyền vào
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
	DECLARE 
		--Kiểm tra chuỗi JSON truyền vào
		@CheckJson TINYINT = 0,
		--Giá trị lấy từ con trỏ
		@ProductItemID INT,
		@AmountBuy INT,
		--Giá trị hàng tồn trong con trỏ
		@AmountStock INT,
		--Giá trị tên sản phẩm trong con trỏ
		@ProductName NVARCHAR(50),
		-- Giá trị tên size trong con trỏ
		@SizeName NVARCHAR(50),
		-- Giá trị kiểm tra đúng sai trong con trỏ
		@CheckError INT;
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra chuỗi JSON
			SET @CheckJson = (SELECT ISJSON(@JSON));
			IF @CheckJson IS NULL OR @CheckJson <= 0
			BEGIN
				SET @ErrorCode = N'NULL_OR_INVALID';
				SET @ErrorMessage = N'Chuỗi JSON rỗng hoặc không hợp lệ';
				RETURN;
			END
			
			--Kiểm tra hàng trong kho
			BEGIN
				--Khởi tạo bảng cho con trỏ
				DECLARE CheckStockCursor CURSOR FOR
				SELECT
					ProductItemID,
					AmountBuy
				FROM 
					OPENJSON(@JSON, '$.OrderDetailInfo') 
				WITH
				(
					ProductItemID int,
					AmountBuy int
				);

				-- Sử dụng con trỏ để kiểm tra hàng trong kho
				OPEN CheckStockCursor
				FETCH NEXT FROM CheckStockCursor
				INTO @ProductItemID, @AmountBuy
				WHILE @@FETCH_STATUS = 0
				BEGIN
					SET @AmountStock = 
					(SELECT
						AmountStock
					FROM ProductItem
					WHERE ProductItemID = @ProductItemID)

					IF(@AmountBuy > @AmountStock)
						BEGIN
							-- Lấy tên sản phẩm lỗi
							SET @ProductName = 
							(SELECT 
								P.ProductName
							FROM Product P
							INNER JOIN ProductItem PI ON P.ProductID = PI.ProductID
							WHERE PI.ProductItemID = @ProductItemID)
							
							-- Lấy size sản phẩm lỗi
							SET @SizeName = 
							(SELECT 
								S.SizeName
							FROM Size S
							INNER JOIN ProductItem PI ON S.SizeID = PI.SizeID
							WHERE PI.ProductItemID = @ProductItemID)

							SET @checkError = 1;
							BREAK;
						END
					ELSE
						BEGIN
							SET @checkError = 0;
						END

					FETCH NEXT FROM CheckStockCursor
					INTO @ProductItemID, @AmountBuy
				END
				CLOSE CheckStockCursor;
				DEALLOCATE CheckStockCursor;
			END

			--Nếu có lỗi, trả ra cảnh báo
			--Nếu không có lỗi, thực hiện trừ hàng trong kho và thêm hóa đơn
			BEGIN
				--Có lỗi
				IF(@checkError = 1)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Số lượng sản phẩm ' + @ProductName + N' size ' + @SizeName + N' bạn mua đã hết';
				END
				--Không có lỗi
				ELSE
				BEGIN
					--Khởi tạo bảng cho con trỏ
					DECLARE ChangeStockCursor CURSOR FOR
					SELECT
						ProductItemID,
						AmountBuy
					FROM 
						OPENJSON(@JSON, '$.OrderDetailInfo') 
					WITH
					(
						ProductItemID int,
						AmountBuy int
					);

					-- Sử dụng con trỏ để cập nhật số lượng trong kho
					OPEN ChangeStockCursor
					FETCH NEXT FROM ChangeStockCursor
					INTO @ProductItemID, @AmountBuy
					WHILE @@FETCH_STATUS = 0
					BEGIN
						SET @AmountStock = 
						(SELECT
							AmountStock
						FROM ProductItem
						WHERE ProductItemID = @ProductItemID)

						UPDATE DBO.ProductItem
						SET AmountStock = @AmountStock - @AmountBuy
						WHERE ProductItemID = @ProductItemID

						FETCH NEXT FROM ChangeStockCursor
						INTO @ProductItemID, @AmountBuy
					END
					CLOSE ChangeStockCursor;
					DEALLOCATE ChangeStockCursor;

					-- Cập nhật thông tin người dùng vào bảng User từ UserInfo trong json		
					UPDATE [dbo].[User]
					SET 
						FullName = JsonData.FullName,
						Phone = JsonData.Phone,
						Address = JsonData.Address
					FROM 
						OPENJSON(@JSON, '$.UserInfo') 
					WITH
					(
						UserID int,
						FullName nvarchar(500),
						Phone nvarchar(10),
						Address nvarchar(MAX)
					) AS JsonData
					WHERE [dbo].[User].UserID = JsonData.UserID;

					-- Cập nhật dữ liệu bảng UserOrder từ OrderInfo trong json
					INSERT INTO [dbo].[Order]
					(	 
						DateCreate,
						Note,
						Status,
						UserID
					)
					SELECT 
						GETDATE(),
						Note,
						1,
						UserID
					FROM 
						OPENJSON(@JSON, '$.OrderInfo') 
					WITH
					(
						Note nvarchar(MAX),
						UserID int
					);

					-- Thêm mới dữ liệu vào bảng OrderDetail
					INSERT INTO [dbo].OrderDetail
					(	 
						OrderID,
						ProductItemID,
						PriceBuy,
						AmountBuy
					)
					SELECT 
						SCOPE_IDENTITY(),
						ProductItemID,
						PriceBuy,
						AmountBuy
					FROM 
						OPENJSON(@JSON, '$.OrderDetailInfo') 
					WITH
					(
						ProductItemID int,
						PriceBuy int,
						AmountBuy int
					);

					SET @ErrorCode  = N'0';
					SET @ErrorMessage = N'';
				END
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
/****** Object:  StoredProcedure [dbo].[OS_CheckoutUserNormal]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 19/12/2021
-- Description:	hàm thực hiện thanh toán người dùng bình thường
-- =============================================
CREATE PROCEDURE [dbo].[OS_CheckoutUserNormal]
	@JSON NVARCHAR(MAX) = null,		-- JSON truyền vào
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
	DECLARE 
		--Kiểm tra chuỗi JSON truyền vào
		@CheckJson TINYINT = 0,
		--Giá trị lấy từ con trỏ
		@ProductItemID INT,
		@AmountBuy INT,
		--Giá trị hàng tồn trong con trỏ
		@AmountStock INT,
		--Giá trị tên sản phẩm trong con trỏ
		@ProductName NVARCHAR(50),
		-- Giá trị tên size trong con trỏ
		@SizeName NVARCHAR(50),
		-- Giá trị kiểm tra đúng sai trong con trỏ
		@CheckError INT;
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra chuỗi JSON
			SET @CheckJson = (SELECT ISJSON(@JSON));
			IF @CheckJson IS NULL OR @CheckJson <= 0
			BEGIN
				SET @ErrorCode = N'NULL_OR_INVALID';
				SET @ErrorMessage = N'Chuỗi JSON rỗng hoặc không hợp lệ';
				RETURN;
			END
			
			--Kiểm tra hàng trong kho
			BEGIN
				--Khởi tạo bảng cho con trỏ
				DECLARE CheckStockCursor CURSOR FOR
				SELECT
					ProductItemID,
					AmountBuy
				FROM 
					OPENJSON(@JSON, '$.OrderDetailInfo') 
				WITH
				(
					ProductItemID int,
					AmountBuy int
				);

				-- Sử dụng con trỏ để kiểm tra hàng trong kho
				OPEN CheckStockCursor
				FETCH NEXT FROM CheckStockCursor
				INTO @ProductItemID, @AmountBuy
				WHILE @@FETCH_STATUS = 0
				BEGIN
					SET @AmountStock = 
					(SELECT
						AmountStock
					FROM ProductItem
					WHERE ProductItemID = @ProductItemID)

					IF(@AmountBuy > @AmountStock)
						BEGIN
							-- Lấy tên sản phẩm lỗi
							SET @ProductName = 
							(SELECT 
								P.ProductName
							FROM Product P
							INNER JOIN ProductItem PI ON P.ProductID = PI.ProductID
							WHERE PI.ProductItemID = @ProductItemID)
							
							-- Lấy size sản phẩm lỗi
							SET @SizeName = 
							(SELECT 
								S.SizeName
							FROM Size S
							INNER JOIN ProductItem PI ON S.SizeID = PI.SizeID
							WHERE PI.ProductItemID = @ProductItemID)

							SET @checkError = 1;
							BREAK;
						END
					ELSE
						BEGIN
							SET @checkError = 0;
						END

					FETCH NEXT FROM CheckStockCursor
					INTO @ProductItemID, @AmountBuy
				END
				CLOSE CheckStockCursor;
				DEALLOCATE CheckStockCursor;
			END

			--Nếu có lỗi, trả ra cảnh báo
			--Nếu không có lỗi, thực hiện trừ hàng trong kho và thêm hóa đơn
			BEGIN
				--Có lỗi
				IF(@checkError = 1)
				BEGIN
					SET @ErrorCode = N'1';
					SET @ErrorMessage = N'Số lượng sản phẩm ' + @ProductName + N' size ' + @SizeName + N' bạn mua đã hết';
				END
				--Không có lỗi
				ELSE
				BEGIN
					--Khởi tạo bảng cho con trỏ
					DECLARE ChangeStockCursor CURSOR FOR
					SELECT
						ProductItemID,
						AmountBuy
					FROM 
						OPENJSON(@JSON, '$.OrderDetailInfo') 
					WITH
					(
						ProductItemID int,
						AmountBuy int
					);

					-- Sử dụng con trỏ để cập nhật số lượng trong kho
					OPEN ChangeStockCursor
					FETCH NEXT FROM ChangeStockCursor
					INTO @ProductItemID, @AmountBuy
					WHILE @@FETCH_STATUS = 0
					BEGIN
						SET @AmountStock = 
						(SELECT
							AmountStock
						FROM ProductItem
						WHERE ProductItemID = @ProductItemID)

						UPDATE DBO.ProductItem
						SET AmountStock = @AmountStock - @AmountBuy
						WHERE ProductItemID = @ProductItemID

						FETCH NEXT FROM ChangeStockCursor
						INTO @ProductItemID, @AmountBuy
					END
					CLOSE ChangeStockCursor;
					DEALLOCATE ChangeStockCursor;

					-- Thêm thông tin người dùng vào bảng User từ UserInfo trong json		
					INSERT INTO [dbo].[User]
					(
						Email,
						FullName,
						Phone,
						Address
					)
					SELECT 
						Email,
						FullName,
						Phone,
						Address
					FROM 
						OPENJSON(@JSON, '$.UserInfo') 
					WITH
					(
						FullName nvarchar(500),
						Phone nvarchar(10),
						Email nvarchar(MAX),
						Address nvarchar(MAX)
					);

					-- Thêm mới dữ liệu vào bảng UserOrder
					INSERT INTO [dbo].[Order]
					(	 
						DateCreate,
						Note,
						Status,
						UserID
					)
					SELECT 
						GETDATE(),
						Note,
						1,
						SCOPE_IDENTITY()
					FROM 
						OPENJSON(@JSON, '$.OrderInfo') 
					WITH
					(
						Note nvarchar(MAX)
					);

					-- Thêm mới dữ liệu vào bảng OrderDetail
					INSERT INTO [dbo].OrderDetail
					(	 
						OrderID,
						ProductItemID,
						PriceBuy,
						AmountBuy
					)
					SELECT 
						SCOPE_IDENTITY(),
						ProductItemID,
						PriceBuy,
						AmountBuy
					FROM 
						OPENJSON(@JSON, '$.OrderDetailInfo') 
					WITH
					(
						ProductItemID int,
						PriceBuy int,
						AmountBuy int
					);

					SET @ErrorCode  = N'0';
					SET @ErrorMessage = N'';
				END
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
/****** Object:  StoredProcedure [dbo].[OS_GetAllDistrict]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_GetAllOrder]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_GetAllProduct_backup]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 8/4/2019
-- Description:	Hàm lấy danh sách sản phẩm theo danh mục cha
-- =============================================
CREATE PROCEDURE [dbo].[OS_GetAllProduct_backup]
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
/****** Object:  StoredProcedure [dbo].[OS_GetAllProvince]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_GetDistrictByProvince]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_GetOrderDetail]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_GetSubCatalogByCatalog]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_GetTop10NewProduct]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_GetTop10SaleProduct]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_Payment_LoginUser]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_Payment_NormalUser]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_Product_FilterProduct]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OS_Product_FilterProduct]
	@CatalogID INT,
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
								PI.MinPrice,
								PI.TotalStock,
								IP.Image
							FROM [dbo].Product AS P WITH (NOLOCK)
							OUTER APPLY 
							(SELECT	
								TOP 1 IP.Image 
							FROM 
								ImageProduct IP 
							WHERE 
								IP.ProductID = P.ProductID 
							ORDER BY 
								IP.ImageID DESC) AS IP
							OUTER APPLY
								(SELECT
									MIN(Price) AS MinPrice,
									SUM(AmountStock) AS TotalStock
								FROM
									ProductItem PI
								WHERE
									PI.ProductID = P.ProductID) AS PI
							WHERE
								P.CatalogID = ' + CAST(@CatalogID AS nvarchar) + '
								AND P.Status = 1
							ORDER BY P.ProductID DESC '
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
/****** Object:  StoredProcedure [dbo].[OS_Product_GetAll]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ThienNBM
-- Create date: 14/12/2021
-- Description:	Outside - Lấy tất cả sản phẩm 
-- =============================================
CREATE PROCEDURE [dbo].[OS_Product_GetAll]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				P.ProductID,
				P.ProductName,
				PI.MinPrice,
				PI.TotalStock,
				IP.Image
			FROM [dbo].Product AS P WITH (NOLOCK)
			OUTER APPLY 
				(SELECT	
					TOP 1 IP.Image 
				FROM 
					ImageProduct IP 
				WHERE 
					IP.ProductID = P.ProductID 
				ORDER BY 
					IP.ImageID DESC) AS IP
			OUTER APPLY
				(SELECT
					MIN(Price) AS MinPrice,
					SUM(AmountStock) AS TotalStock
				FROM
					ProductItem PI
				WHERE
					PI.ProductID = P.ProductID) AS PI
			WHERE
				P.Status = 1
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
/****** Object:  StoredProcedure [dbo].[OS_Product_GetAllCatalog]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 18/4/2019
-- Description:	Hàm lấy ra tất cả hãng giày
-- =============================================
CREATE PROCEDURE [dbo].[OS_Product_GetAllCatalog]
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
			ORDER BY CatalogName ASC;
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
/****** Object:  StoredProcedure [dbo].[OS_Product_GetAllSubCatalog]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OS_Product_GetAllSubCatalog]
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				SubCatalogID,
				SubCatalogName
			FROM [dbo].SubCatalog WITH (NOLOCK)
			WHERE Status = 1
			ORDER BY SubCatalogName ASC;
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
/****** Object:  StoredProcedure [dbo].[OS_Product_GetImage]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 25/4/2019
-- Description:	Lấy ảnh của sản phẩm theo ID sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[OS_Product_GetImage]
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

			--Lấy danh sách ảnh theo ID sản phẩm
			ELSE
				BEGIN
					SELECT
						Image
					FROM [dbo].ImageProduct AS IP WITH (NOLOCK)
					WHERE 
						ProductID = @ProductID
					ORDER BY ImageID DESC
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
/****** Object:  StoredProcedure [dbo].[OS_Product_GetInfo]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 15/12/2021
-- Description:	Lấy dữ liệu chi tiết sản phẩm khi click vào sản phẩm trên danh sách
-- =============================================
CREATE PROCEDURE [dbo].[OS_Product_GetInfo]
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
						P.Description
					FROM [dbo].Product AS P WITH (NOLOCK)
					WHERE
						P.ProductID = @ProductID
						AND P.Status = 1
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
/****** Object:  StoredProcedure [dbo].[OS_Product_GetProductItem]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 16/12/2021
-- Description:	Hàm lấy ra thông tin của hàng theo productID và sizeID
--				và thêm dòng đó vào danh sách giỏ hàng
-- =============================================
CREATE PROCEDURE [dbo].[OS_Product_GetProductItem]
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
				S.SizeID,
				S.SizeName,
				PI.AmountStock,
				PI.Price,
				IP.Image
			FROM dbo.ProductItem PI 
				INNER JOIN Product P ON PI.ProductID = P.ProductID
				INNER JOIN Size S ON PI.SizeID = S.SizeID
				OUTER APPLY
				(SELECT 
					TOP 1 IP.Image 
				FROM 
					ImageProduct IP 
				WHERE 
					IP.ProductID = PI.ProductID
				ORDER BY
					IP.ImageID DESC) AS IP
			WHERE 
				PI.ProductID = @ProductID
				AND PI.SizeID = @SizeID
				AND P.Status = 1
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
/****** Object:  StoredProcedure [dbo].[OS_Product_GetSize]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 25/4/2019
-- Description:	Lấy size của sản phẩm theo ID sản phẩm
-- =============================================
CREATE PROCEDURE [dbo].[OS_Product_GetSize]
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

			--Lấy danh sách size theo ID sản phẩm
			ELSE
				BEGIN
					SELECT
						S.SizeID,
						S.SizeName,
						PI.Price
					FROM [dbo].Size AS S WITH (NOLOCK)
					INNER JOIN [dbo].ProductItem AS PI ON S.SizeID = PI.SizeID 
					WHERE
						PI.ProductID = @ProductID
						AND PI.AmountStock > 0
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
/****** Object:  StoredProcedure [dbo].[OS_SearchProduct]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_UpdateAmountStock]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[OS_User_ChangeInfo]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thiennbm
-- Create date: 10/6/2019
-- Description:	hàm sửa thông tin khách hàng
-- =============================================
CREATE PROCEDURE [dbo].[OS_User_ChangeInfo] 
	@UserID INT,							-- ID người dùng
	@FullName nvarchar(50),					-- Họ tên người dùng
	@Phone nvarchar(10),					-- Số điện thoại người dùng
	@Address nvarchar(max),					-- Địa chỉ người dùng
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

			IF ((@FullName = '' OR @FullName IS NULL)
			OR (@Phone = '' OR @Phone IS NULL)
			OR (@Address = '' OR @Address IS NULL))
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Bạn phải nhập đủ dữ liệu!';
					RETURN;
				END
			ELSE
				BEGIN
					UPDATE [dbo].[User]
					SET	FullName = @FullName,
						Phone = @Phone,
						Address = @Address
					WHERE UserID = @UserID;
					SET @ErrorCode  = N'0';
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
/****** Object:  StoredProcedure [dbo].[OS_User_ChangePassword]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	09/06/2019
-- Description:	Hàm đổi mật khẩu người dùng
-- =============================================
CREATE PROCEDURE [dbo].[OS_User_ChangePassword]
	@UserID INT,							-- Id tài khoản ngươi dùng
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
/****** Object:  StoredProcedure [dbo].[OS_User_DestroyOrder]    Script Date: 25/03/2022 07:24:30 ******/
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
CREATE PROCEDURE [dbo].[OS_User_DestroyOrder]
	@OrderID INT = 0,						-- Id đơn hàng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
	DECLARE
		--Giá trị lấy từ con trỏ
		@ProductItemID INT,
		@AmountBuy INT,
		--Giá trị hàng tồn trong con trỏ
		@AmountStock INT
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			-- Kiểm tra đơn hàng có tồn tại hay không
			IF NOT EXISTS (SELECT OrderID
							FROM [dbo].[Order] WITH (NOLOCK)
							WHERE OrderID = @OrderID)
			OR NOT EXISTS (SELECT OrderID
							FROM [dbo].[OrderDetail] WITH (NOLOCK)
							WHERE OrderID = @OrderID)
			BEGIN
				SET @ErrorCode = N'1';
				SET @ErrorMessage = N'Không tồn tại đơn hàng';
				RETURN;
			END
			
			-- Thực hiện cộng hàng vào kho
			BEGIN
				-- Khởi tạo bảng cho con trỏ
				DECLARE ChangeStockCursor CURSOR FOR
				SELECT 
					ProductItemID,
					AmountBuy
				FROM
					OrderDetail
				WHERE
					OrderID = @OrderID

				-- Sử dụng con trỏ để cập nhật số lượng trong kho
				BEGIN
					OPEN ChangeStockCursor
					FETCH NEXT FROM ChangeStockCursor
					INTO @ProductItemID, @AmountBuy
					WHILE @@FETCH_STATUS = 0
					BEGIN
						SET @AmountStock = 
							(SELECT
								AmountStock
							FROM ProductItem
							WHERE ProductItemID = @ProductItemID)

						UPDATE DBO.ProductItem
						SET AmountStock = @AmountStock + @AmountBuy
						WHERE ProductItemID = @ProductItemID

						FETCH NEXT FROM ChangeStockCursor
						INTO @ProductItemID, @AmountBuy
					END
					CLOSE ChangeStockCursor;
					DEALLOCATE ChangeStockCursor;
				END

				-- Thực hiện thay đổi trạng thái
				BEGIN
					UPDATE [dbo].[Order]
					SET Status = 4
					WHERE OrderID = @OrderID;
				END

				SET @ErrorCode  = N'0';
				SET @ErrorMessage = N'';
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
/****** Object:  StoredProcedure [dbo].[OS_User_GetOrderById]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	18/4/2019
-- Description:	Hàm lấy ra danh sách tất cả đơn hàng theo ID người dùng
-- =============================================
CREATE PROCEDURE [dbo].[OS_User_GetOrderById]
	@UserID INT = 0,						-- ID người dùng
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				O.OrderID,
				FORMAT(O.DateCreate,'dd/MM/yyyy hh:mm:ss') AS DateCreate,
				O.Note,
				O.Status,
				SUM(OD.Total) AS Total
			FROM [dbo].[Order] AS O
			INNER JOIN [dbo].[User] AS U ON O.UserID = U.UserID
			CROSS APPLY
				(select 
					PriceBuy * AmountBuy AS Total
				from 
				dbo.OrderDetail OD
				where OD.OrderID = O.OrderID) OD
			WHERE U.UserID = @UserID
			GROUP BY
				O.OrderID,
				O.DateCreate,
				O.Note,
				O.Status
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
/****** Object:  StoredProcedure [dbo].[OS_User_GetOrderDetailById]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm
-- Create date: 18/4/2019
-- Description:	Hàm lấy thông tin chi tiết của đơn hàng
-- =============================================
CREATE PROCEDURE [dbo].[OS_User_GetOrderDetailById]
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
						IP.Image,
						P.ProductName,
						S.SizeName,
						OD.PriceBuy,
						OD.AmountBuy,
						(OD.PriceBuy * OD.AmountBuy) AS Total
					FROM [dbo].OrderDetail AS OD WITH (NOLOCK)
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
/****** Object:  StoredProcedure [dbo].[OS_User_Login]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	4/6/2019
-- Description:	Hàm lấy thông tin người dùng khi login để xử lý trên C#
-- =============================================
CREATE PROCEDURE [dbo].[OS_User_Login] 
	@Email VARCHAR(50),						-- Email đăng nhập
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		-- Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				UserID,
				Email,
				Password,
				FullName,
				Phone,
				Address
			FROM [dbo].[User] 
			WHERE
				LOWER(TRIM(Email)) = LOWER(TRIM(@Email))
				AND Password IS NOT NULL
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
/****** Object:  StoredProcedure [dbo].[OS_User_Register]    Script Date: 25/03/2022 07:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thiennbm	
-- Create date:	5/6/2019
-- Description:	Hàm đăng ký người dùng
-- =============================================
CREATE PROCEDURE [dbo].[OS_User_Register]
	@FullName NVARCHAR(50),					-- Họ và tên
	@Phone VARCHAR(10),						-- Số điện thoại
	@Email VARCHAR(50),						-- Email
	@Password VARCHAR(50),					-- Mật khẩu 
	@ErrorCode NVARCHAR(100) OUTPUT,		-- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT		--Thông báo lỗi
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			IF (@FullName IS NULL OR @FullName = '')
				OR (@Phone IS NULL OR @Phone = '')
				OR (@Email IS NULL OR @Email = '')
				OR (@Password IS NULL OR @Password = '')
				BEGIN
					SET @ErrorCode  = N'1';
					SET @ErrorMessage = N'Lỗi dữ liệu đầu vào !';
					RETURN;
				END
			ELSE
				BEGIN
					IF EXISTS (SELECT UserID
								FROM [dbo].[User] WITH (NOLOCK)
								WHERE 
									LOWER(TRIM(Email)) = LOWER(TRIM(@Email))
									AND Password IS NOT NULL)
						BEGIN
							SET @ErrorCode  = N'1';
							SET @ErrorMessage = N'Tài khoản đã tồn tại';
							RETURN;
						END	
					ELSE
						BEGIN
							INSERT INTO [dbo].[User]
							(
								FullName,
								Phone,
								Email,
								Password
							)
							VALUES
							(
								@FullName,
								@Phone,
								@Email,
								@Password
							);

							SELECT
								UserID,
								Email,
								Password,
								FullName,
								Phone,
								Address
							FROM [dbo].[User]
							WHERE 
								LOWER(TRIM(Email)) = LOWER(TRIM(@Email))
								AND Password IS NOT NULL
							SET @ErrorCode = N'0';
							SET @ErrorMessage = N'';
						END
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
/****** Object:  StoredProcedure [dbo].[Province_Delete]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[Province_GetAll]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[Province_GetItemById]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[Province_Insert]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[Province_Update]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[UserLogin_GetAllOrder]    Script Date: 25/03/2022 07:24:30 ******/
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
/****** Object:  StoredProcedure [dbo].[UserLogin_GetOrderDetail]    Script Date: 25/03/2022 07:24:30 ******/
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
