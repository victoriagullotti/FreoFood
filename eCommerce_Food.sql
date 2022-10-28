USE [master]
GO
/****** Object:  Database [ShoppingCartDB2]    Script Date: 7/7/2017 11:25:13 AM ******/
CREATE DATABASE [ShoppingCartDB2]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingCartDB2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingCartDB2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingCartDB2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingCartDB2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoppingCartDB2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [ShoppingCartDB2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingCartDB2] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ShoppingCartDB2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingCartDB2] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoppingCartDB2] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingCartDB2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingCartDB2] SET DB_CHAINING OFF 
GO
USE [ShoppingCartDB2]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/7/2017 11:25:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 7/7/2017 11:25:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactUs](
	[CustomerName5] [varchar](100) NULL,
	[CustomerEmailID5] [varchar](100) NULL,
	[CustomerPhoneNo5] [varchar](100) NULL,
	[ReadMe] [varchar](1000) NULL,
	[WhenSent] [datetime] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerDetails]    Script Date: 7/7/2017 11:25:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerEmailID] [varchar](100) NULL,
	[CustomerPhoneNo] [varchar](10) NULL,
	[CustomerAddress] [varchar](500) NULL,
	[CustomerAddress1] [varchar](500) NULL,
	[CustomerPostcode] [varchar](500) NULL,
	[CustomerPassword] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerOrders]    Script Date: 7/7/2017 11:25:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerOrders](
	[OrderNo] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[TotalProducts] [int] NULL,
	[TotalPrice] [int] NULL,
	[OrderDateTime] [datetime] NULL DEFAULT (getdate()),
	[PaymentMethod] [varchar](100) NULL,
	[ReceiverName] [varchar](100) NULL,
	[ReceiverPhoneNo] [varchar](100) NULL,
	[EmailID1] [varchar](100) NULL,
	[ReceiverAddress] [varchar](100) NULL,
	[ReceiverSuburb] [varchar](100) NULL,
	[ReceiverPostCode] [varchar](4) NULL,
	[ReceiverMessage] [varchar](1000) NULL,
	[DeliveryTime] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerProducts]    Script Date: 7/7/2017 11:25:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerProducts](
	[OrderNo] [int] NULL,
	[ProductID] [int] NULL,
	[TotalProduct] [int] NULL
)

GO
/****** Object:  Table [dbo].[DeliveryStatus]    Script Date: 7/7/2017 11:25:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeliveryStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionNo] [int] NULL,
	[StatusMessage] [varchar](100) NULL,
	[DataEntry] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/7/2017 11:25:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
	[Description] [varchar](800) NULL,
	[Description1] [varchar](800) NULL,
	[Description2] [varchar](800) NULL,
	[Price] [varchar](80) NULL,
	[ImageUrl] [varchar](500) NULL,
	[CategoryID] [int] NULL,
	[ProductQuantity] [int] NULL,
	[ShowHide] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_AddNewCategory]    Script Date: 7/7/2017 11:25:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_AddNewCategory]
(
@CategoryName varchar(200)
)
AS
  BEGIN
  
      BEGIN TRY
         
         insert into Category 
         values(@CategoryName)
          
      END TRY

      BEGIN CATCH
          --      INSERT INTO dbo.ErrorLog 
          --VALUES(ERROR_MESSAGE(),'sp_GetAllData')
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_AddNewProduct]    Script Date: 7/7/2017 11:25:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddNewProduct]
(
@ProductName varchar(300),
@ProductPrice int,
@ProductImage varchar(500),
@ProductDescription  varchar(1000),
@ProductDescription1  varchar(1000),
@ProductDescription2  varchar(1000),
@CategoryID  int,
@ProductQuantity int
)

AS
  BEGIN
  
      BEGIN TRY
         
         insert into Products
         ([Name]
           ,[Description]
		   ,[Description1]
		   ,[Description2]
           ,[Price]
           ,[ImageUrl]
           ,[CategoryID]
           ,[ProductQuantity]
           ,[ShowHide])
         values
         (@ProductName,
         @ProductDescription,
		 @ProductDescription1,
		 @ProductDescription2,
         @ProductPrice,
         @ProductImage,
         @CategoryID,
		 @ProductQuantity,
		 1
         )
          
      END TRY

      BEGIN CATCH
          --      INSERT INTO dbo.ErrorLog 
          --VALUES(ERROR_MESSAGE(),'sp_GetAllData')
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_ContactUs]    Script Date: 7/7/2017 11:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ContactUs]
(
@CustomerName5 varchar(100),
@CustomerEmailID5 varchar(100),
@CustomerPhoneNo5 varchar(10),
@ReadMe varchar(1000),
@WhenSent DATETIME

)
AS
  BEGIN
  
      BEGIN TRY
         
         insert into ContactUs(CustomerName5,CustomerEmailID5,CustomerPhoneNo5,ReadMe,WhenSent) 
         values(@CustomerName5,@CustomerEmailID5,@CustomerPhoneNo5,@ReadMe,@WhenSent)

	     select @@IDENTITY as CustomerName5
          
      END TRY

      BEGIN CATCH

          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteProductCategory]    Script Date: 7/7/2017 11:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteProductCategory] (@CategoryID INT,
                                                   @ProductID  INT)
AS
  BEGIN
      BEGIN TRY
          IF( @CategoryID <> 0 )
            BEGIN
                DELETE FROM Products
                WHERE  CategoryID = @CategoryID

                DELETE FROM Category
                WHERE  CategoryID = @CategoryID
            END

          IF( @ProductID <> 0 )
            BEGIN
                DELETE FROM Products
                WHERE  ProductID = @ProductID
            END
      END TRY

      BEGIN CATCH
          --      INSERT INTO dbo.ErrorLog 
          --VALUES(ERROR_MESSAGE(),'sp_GetAllData')
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_Delivery]    Script Date: 7/7/2017 11:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Delivery]
(

@RecipeintName varchar(100),
@RecipeintEmailID varchar(100),
@RecipeintPhoneNo varchar(10),
@RecipeintAddress varchar(500),
@RecipeintAddress1 varchar(500),
@RecipeintPostCode varchar(4),
@RecipeintMessage varchar(500),
@ID varchar(100)
)
AS
  BEGIN
  
      BEGIN TRY
         
         insert into Delivery(RecipeintName,RecipeintEmailID,RecipeintPhoneNo,RecipeintAddress, RecipeintAddress1, RecipeintPostCode,RecipeintMessage) 
         values(@RecipeintName,@RecipeintEmailID,@RecipeintPhoneNo,@RecipeintAddress,@RecipeintAddress1, @RecipeintPostCode,@RecipeintMessage)

	     select @@IDENTITY as ID
          
      END TRY

      BEGIN CATCH

          PRINT( 'Error occured' )
      END CATCH
  END

GO
/****** Object:  StoredProcedure [dbo].[SP_EditProduct]    Script Date: 7/7/2017 11:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_EditProduct]
(
@ProductID int,
@ProductName varchar(300),
@ProductPrice int,
@ProductDescription  varchar(1000),
@ProductDescription1  varchar(1000),
@ProductDescription2  varchar(1000),
@ProductQuantity int,
@Flag int
)

AS
  BEGIN
  
      BEGIN TRY
         
         update Products
         set
         Name=@ProductName,
         Description=@ProductDescription,
		 Description1=@ProductDescription1,
		 Description2=@ProductDescription2,
         Price=@ProductPrice,
		 [ProductQuantity]=@ProductQuantity,
		 ShowHide=@Flag
         where ProductID=@ProductID
          
      END TRY

      BEGIN CATCH
          --      INSERT INTO dbo.ErrorLog 
          --VALUES(ERROR_MESSAGE(),'sp_GetAllData')
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllCategories]    Script Date: 7/7/2017 11:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetAllCategories]
AS
	BEGIN
		BEGIN TRY
			select * from dbo.Category
			END TRY

			BEGIN CATCH
			--INSERT INTO dbo.ErrorLog
			--values(ERROR_MESSAGE(),'sp_GetAllData')
			PRINT('Error occured')
			END CATCH
			END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllProducts]    Script Date: 7/7/2017 11:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetAllProducts] (@CategoryID INT,
                                           @SearchText VARCHAR(100))
AS
  BEGIN
      BEGIN TRY


          IF( @SearchText <> '' )
            BEGIN
                SELECT *
                FROM   (SELECT P.CategoryID,
                               P.ProductID,
                               P.Name,
                               P.Price,
                               P.ImageUrl,
                               C.CategoryName,
                               P.ProductQuantity,
                               P.ShowHide,
                               Isnull(Sum(CP.TotalProduct), 0)                         AS ProductSold,
                               ( P.ProductQuantity - Isnull(Sum(CP.TotalProduct), 0) ) AS AvailableStock
                        FROM   Products P
                               INNER JOIN Category C
                                       ON C.CategoryID = P.CategoryID
                               LEFT JOIN CustomerProducts CP
                                      ON CP.ProductID = P.ProductID
                        GROUP  BY P.ProductID,
                                  P.Name,
                                  P.Price,
                                  P.ImageUrl,
                                  C.CategoryName,
                                  P.ProductQuantity,
                                  P.ShowHide,
                                  P.CategoryID) StockTable
                WHERE  AvailableStock > 0 And ShowHide=1
                       AND Name  LIKE '%' + @SearchText + '%';
            END
          ELSE
            BEGIN
                IF( @CategoryID <> 0 )
                  BEGIN
                      SELECT *
                      FROM   (SELECT P.CategoryID,
                                     P.ProductID,
                                     P.Name,
                                     P.Price,
                                     P.ImageUrl,
                                     C.CategoryName,
                                     P.ProductQuantity,
                                     P.ShowHide,
                                     Isnull(Sum(CP.TotalProduct), 0)                         AS ProductSold,
                                     ( P.ProductQuantity - Isnull(Sum(CP.TotalProduct), 0) ) AS AvailableStock
                              FROM   Products P
                                     INNER JOIN Category C
                                             ON C.CategoryID = P.CategoryID
                                     LEFT JOIN CustomerProducts CP
                                            ON CP.ProductID = P.ProductID
                              GROUP  BY P.ProductID,
                                        P.Name,
                                        P.Price,
                                        P.ImageUrl,
                                        C.CategoryName,
                                        P.ProductQuantity,
                                        P.ShowHide,
                                        P.CategoryID) StockTable
                      WHERE  AvailableStock > 0
                             AND CategoryID = @CategoryID and  ShowHide=1
                  END
                ELSE
                  BEGIN
                      SELECT *
                      FROM   (SELECT P.CategoryID,
                                     P.ProductID,
                                     P.Name,
                                     P.Price,
                                     P.ImageUrl,
                                     C.CategoryName,
                                     P.ProductQuantity,
                                     P.ShowHide,
                                     Isnull(Sum(CP.TotalProduct), 0)                         AS ProductSold,
                                     ( P.ProductQuantity - Isnull(Sum(CP.TotalProduct), 0) ) AS AvailableStock
                              FROM   Products P
                                     INNER JOIN Category C
                                             ON C.CategoryID = P.CategoryID
                                     LEFT JOIN CustomerProducts CP
                                            ON CP.ProductID = P.ProductID
                              GROUP  BY P.ProductID,
                                        P.Name,
                                        P.Price,
                                        P.ImageUrl,
                                        C.CategoryName,
                                        P.ProductQuantity,
                                        P.ShowHide,
                                        P.CategoryID) StockTable
                      WHERE  AvailableStock > 0 and ShowHide=1
                  END
            END
      END TRY

      BEGIN CATCH
          --      INSERT INTO dbo.ErrorLog 
          --VALUES(ERROR_MESSAGE(),'sp_GetAllData')
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetAvailableStock]    Script Date: 7/7/2017 11:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetAvailableStock] (@StockType  INT,
                                              @CategoryID INT)
AS
  BEGIN
      BEGIN TRY
          DECLARE @StartRange INT
          DECLARE @EndRange INT

          IF( @StockType = 0 )
            BEGIN
                SET @StartRange=0
                SET @EndRange=0
            END

          IF( @StockType = 1 )
            BEGIN
                SET @StartRange=1
                SET @EndRange=10
            END

          IF( @StockType = 2 )
            BEGIN
                SET @StartRange=11
                SET @EndRange=10000
            END

          IF( @CategoryID = 0 )
            BEGIN
                SELECT *
                FROM   (SELECT P.Name,
                               P.Price,
                               P.ImageUrl,
                               C.CategoryName,
                               P.ProductQuantity,
                               Isnull(Sum(CP.TotalProduct), 0)                         AS ProductSold,
                               ( P.ProductQuantity - Isnull(Sum(CP.TotalProduct), 0) ) AS AvailableStock
                        FROM   Products P
                               INNER JOIN Category C
                                       ON C.CategoryID = P.CategoryID
                               LEFT JOIN CustomerProducts CP
                                       ON CP.ProductID = P.ProductID
                        GROUP  BY CP.ProductID,
                                  P.Name,
                                  P.Price,
                                  P.ImageUrl,
                                  C.CategoryName,
                                  P.ProductQuantity) StockTable
                WHERE  AvailableStock BETWEEN @StartRange AND @EndRange
            END
          ELSE
            BEGIN
                SELECT *
                FROM   (SELECT P.Name,
                               P.Price,
                               P.ImageUrl,
                               C.CategoryName,
                               P.ProductQuantity,
                               Isnull(Sum(CP.TotalProduct), 0)                         AS ProductSold,
                               ( P.ProductQuantity - Isnull(Sum(CP.TotalProduct), 0) ) AS AvailableStock
                        FROM   Products P
                               INNER JOIN Category C
                                       ON C.CategoryID = P.CategoryID
                               LEFT JOIN CustomerProducts CP
                                       ON CP.ProductID = P.ProductID
                        WHERE  C.CategoryID = @CategoryID
                        GROUP  BY CP.ProductID,
                                  P.Name,
                                  P.Price,
                                  P.ImageUrl,
                                  C.CategoryName,
                                  P.ProductQuantity) StockTable
                WHERE  AvailableStock BETWEEN @StartRange AND @EndRange
            END
      END TRY

      BEGIN CATCH
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetCustomerInfo]    Script Date: 7/7/2017 11:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_GetCustomerInfo]
(
@CustomerID int
)
AS
  BEGIN
  
      BEGIN TRY
         
		 SELECT *
          FROM   CustomerDetails where ID=@CustomerID ;
          
      END TRY

      BEGIN CATCH

          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetHiddenStock]    Script Date: 7/7/2017 11:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetHiddenStock] (@CategoryID INT)
AS
  BEGIN
      BEGIN TRY
          DECLARE @StartRange INT
          DECLARE @EndRange INT

         

          IF( @CategoryID = 0 )
            BEGIN
               SELECT P.ProductID,
							   P.Name,
                               P.Price,
                               P.ImageUrl,
                               C.CategoryName,
                               P.ProductQuantity,
                               P.ShowHide
                        FROM   Products P
                               INNER JOIN Category C
                                       ON C.CategoryID = P.CategoryID
                     
                WHERE  P.ShowHide=0
            END
          ELSE
            BEGIN
               SELECT P.ProductID,P.Name,
                               P.Price,
                               P.ImageUrl,
                               C.CategoryName,
                               C.CategoryID,
                               P.ProductQuantity,
                               P.ShowHide
                        FROM   Products P
                               INNER JOIN Category C
                                       ON C.CategoryID = P.CategoryID
                     
                WHERE  P.ShowHide=0 and C.CategoryID=@CategoryID
            END
      END TRY

      BEGIN CATCH
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetIncomeReport]    Script Date: 7/7/2017 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetIncomeReport] (@ReportType INT)
AS
  BEGIN
      BEGIN TRY
          DECLARE @Month INT
          DECLARE @Today INT
          DECLARE @Year INT

          SELECT @Today = Day(Getdate()),
                 @Month = Month(Getdate()),
                 @Year = Year(Getdate())

          IF( @ReportType = 1 )
            BEGIN
                SELECT *
                FROM   (SELECT CD.*,
                               CO.*,
                               Day(OrderDateTime)   AS TodaysDay,
                               Month(OrderDateTime) ThisMonth,
                               Year(OrderDateTime)  ThisYear
                        FROM   CustomerOrders CO
                               INNER JOIN CustomerDetails CD
                                       ON CD.Id = CO.CustomerID)IncomeTable
                WHERE  TodaysDay = @Today
                       AND ThisMonth = @Month
                       AND ThisYear = @Year
            END

          IF( @ReportType = 2 )
            BEGIN
                SELECT *
                FROM   (SELECT CD.*,
                               CO.*,
                               Day(OrderDateTime)   AS TodaysDay,
                               Month(OrderDateTime) ThisMonth,
                               Year(OrderDateTime)  ThisYear
                        FROM   CustomerOrders CO
                               INNER JOIN CustomerDetails CD
                                       ON CD.Id = CO.CustomerID)IncomeTable
                WHERE  ThisMonth = @Month
                       AND ThisYear = @Year
            END

          IF( @ReportType = 3 )
            BEGIN
                SELECT *
                FROM   (SELECT CD.*,
                               CO.*,
                               Day(OrderDateTime)   AS TodaysDay,
                               Month(OrderDateTime) ThisMonth,
                               Year(OrderDateTime)  ThisYear
                        FROM   CustomerOrders CO
                               INNER JOIN CustomerDetails CD
                                       ON CD.Id = CO.CustomerID)IncomeTable
                WHERE  ThisYear = @Year
            END
      END TRY

      BEGIN CATCH
          --      INSERT INTO dbo.ErrorLog 
          --VALUES(ERROR_MESSAGE(),'sp_GetAllData')
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetOrdersList]    Script Date: 7/7/2017 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetOrdersList] (@Flag       INT,
                                          @CustomerID INT)
AS
  BEGIN
      BEGIN TRY
          IF( @Flag <> 0 )
            BEGIN
                SELECT *
                FROM   CustomerDetails CD
                       INNER JOIN CustomerOrders CO
                               ON CO.CustomerID = CD.id
                WHERE  CO.OrderNo = @Flag;
            END

          IF( @CustomerID <> 0 )
            BEGIN
                SELECT *
                FROM   CustomerDetails CD
                       INNER JOIN CustomerOrders CO
                               ON CO.CustomerID = CD.id
                WHERE  CO.CustomerID = @CustomerID;
            END

          IF( @Flag = 0
               OR @CustomerID = 0 )
            BEGIN
                SELECT *
                FROM   CustomerDetails CD
                       INNER JOIN CustomerOrders CO
                               ON CO.CustomerID = CD.id
            END
      END TRY

      BEGIN CATCH
          --      INSERT INTO dbo.ErrorLog 
          --VALUES(ERROR_MESSAGE(),'sp_GetAllData')
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetProductByID]    Script Date: 7/7/2017 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_GetProductByID] (@ProductID INT)
AS
  BEGIN
      BEGIN TRY


        
                IF( @ProductID <> 0 )
                  BEGIN
                     Select * from Products where ProductID=@ProductID
                  END
               
            
      END TRY

      BEGIN CATCH
          --      INSERT INTO dbo.ErrorLog 
          --VALUES(ERROR_MESSAGE(),'sp_GetAllData')
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetTransactionDetails]    Script Date: 7/7/2017 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetTransactionDetails]
(
@TransactionNo int
)
AS
  BEGIN
  
      BEGIN TRY
      
	
		select P.Name,P.ImageUrl,P.Price,CP.TotalProduct as ProductQuantity from Products P
		inner join CustomerProducts CP
		on CP.ProductID=P.ProductID
		where CP.OrderNo=@TransactionNo
		

      END TRY

      BEGIN CATCH
          --      INSERT INTO dbo.ErrorLog 
          --VALUES(ERROR_MESSAGE(),'sp_GetAllData')
          PRINT( ERROR_MESSAGE() )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 7/7/2017 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Login]
(
@CustomerEmailID varchar(100),
@CustomerPassword varchar(100)
)
AS
  BEGIN
  
      BEGIN TRY
         
		 SELECT Id,CustomerName
          FROM   CustomerDetails where CustomerEmailID=@CustomerEmailID and CustomerPassword=@CustomerPassword;
          
      END TRY

      BEGIN CATCH

          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_OrderStatus]    Script Date: 7/7/2017 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OrderStatus]
(
@TransactionNo int,
@OrderStatus varchar(300),
@Flag int,
@DataEntry datetime
)

AS
  BEGIN
  
      BEGIN TRY
         
		 if(@Flag=1)
		 begin

         insert into DeliveryStatus(TransactionNo,StatusMessage,DataEntry)
         values
         (@TransactionNo,
         @OrderStatus,
		 @DataEntry
         )

		 end


		 select StatusMessage as ShipmentStatus,DataEntry as UpdatedOn from DeliveryStatus where TransactionNo=@TransactionNo    
      END TRY

      BEGIN CATCH
          --      INSERT INTO dbo.ErrorLog 
          --VALUES(ERROR_MESSAGE(),'sp_GetAllData')
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_Register]    Script Date: 7/7/2017 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Register]
(
@CustomerName varchar(100),
@CustomerEmailID varchar(100),
@CustomerPhoneNo varchar(10),
@CustomerAddress varchar(500),
@CustomerAddress1 varchar(500),
@CustomerPostCode varchar(4),
@CustomerPassword varchar(100)
)
AS
  BEGIN
  
      BEGIN TRY
         
         insert into CustomerDetails(CustomerName,CustomerEmailID,CustomerPhoneNo,CustomerAddress, CustomerAddress1, CustomerPostCode, CustomerPassword) 
         values(@CustomerName,@CustomerEmailID,@CustomerPhoneNo,@CustomerAddress,@CustomerAddress1, @CustomerPostCode, @CustomerPassword)

	     select @@IDENTITY as CustomerID
          
      END TRY

      BEGIN CATCH

          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_RollBackOrder]    Script Date: 7/7/2017 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_RollBackOrder]
(
@TransactionNo int
)

AS
  BEGIN
  
      BEGIN TRY
         
		  
		 delete from CustomerOrders where OrderNo=@TransactionNo
		 delete from CustomerProducts where OrderNo=@TransactionNo
		 delete from DeliveryStatus where TransactionNo=@TransactionNo

		  
      END TRY

      BEGIN CATCH
          --      INSERT INTO dbo.ErrorLog 
          --VALUES(ERROR_MESSAGE(),'sp_GetAllData')
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_SaveCustomerOrder]    Script Date: 7/7/2017 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SaveCustomerOrder]
(
@CustomerID int,
@TotalProducts int,
@TotalPrice int,
@PaymentMethod varchar(100)
)
AS
  BEGIN
  
      BEGIN TRY
         
         insert into CustomerOrders(CustomerID,TotalProducts,TotalPrice,PaymentMethod) 
         values(@CustomerID,@TotalProducts,@TotalPrice,@PaymentMethod)


		 select @@IDENTITY as OrderNo
          
      END TRY

      BEGIN CATCH
       
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_SaveCustomerOrder1]    Script Date: 7/7/2017 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SaveCustomerOrder1]
(
@CustomerID int,
@TotalProducts int,
@TotalPrice int,
@PaymentMethod varchar(100),
@ReceiverName varchar(100),
@ReceiverPhoneNo varchar(100),
@EmailID1 varchar(100),
@ReceiverAddress varchar(100),
@ReceiverSuburb varchar(100),
@ReceiverPostCode varchar(4),
@ReceiverMessage varchar(1000),
@DeliveryTime varchar(100)
)
AS
  BEGIN
  
      BEGIN TRY
         
         insert into CustomerOrders(CustomerID,TotalProducts,TotalPrice,PaymentMethod,ReceiverName,ReceiverPhoneNo,EmailID1,ReceiverAddress,ReceiverSuburb,ReceiverPostCode,ReceiverMessage,DeliveryTime) 
         values(@CustomerID,@TotalProducts,@TotalPrice,@PaymentMethod,@ReceiverName,@ReceiverPhoneNo,@EmailID1,@ReceiverAddress,@ReceiverSuburb,@ReceiverPostCode,@ReceiverMessage,@DeliveryTime)


		 select @@IDENTITY as OrderNo
          
      END TRY

      BEGIN CATCH
       
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_SaveCustomerProducts]    Script Date: 7/7/2017 11:25:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SaveCustomerProducts]
(
@OrderNo int,
@ProductID int,
@TotalProduct int
)
AS
  BEGIN
  
      BEGIN TRY
         
         insert into CustomerProducts(OrderNo,ProductID,TotalProduct) 
         values(@OrderNo,@ProductID,@TotalProduct)

		
          
      END TRY

      BEGIN CATCH
       
          PRINT( 'Error occured' )
      END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateProfile]    Script Date: 7/7/2017 11:25:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_UpdateProfile]
(
@CustomerID int,
@CustomerEmailID varchar(100),
@CustomerPhoneNo varchar(10),
@CustomerAddress varchar(500),
@CustomerAddress1 varchar(500),
@CustomerPostCode varchar(500),
@CustomerPassword varchar(100)
)

AS
  BEGIN
  
      BEGIN TRY
         
         update CustomerDetails
         set
         CustomerEmailID=@CustomerEmailID,
         CustomerPhoneNo=@CustomerPhoneNo,
		 CustomerAddress=@CustomerAddress,
		  CustomerAddress1=@CustomerAddress1,
		 CustomerPostCode=@CustomerPostCode,
		 CustomerPassword=@CustomerPassword
         where Id=@CustomerID
          
      END TRY

      BEGIN CATCH
          --      INSERT INTO dbo.ErrorLog 
          --VALUES(ERROR_MESSAGE(),'sp_GetAllData')
          PRINT( 'Error occured' )
      END CATCH
  END


GO
USE [master]
GO
ALTER DATABASE [ShoppingCartDB2] SET  READ_WRITE 
GO
