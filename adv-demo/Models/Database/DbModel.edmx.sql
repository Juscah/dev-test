
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/14/2022 14:27:40
-- Generated from EDMX file: C:\Users\Cash\Downloads\Development Test\adv-demo\Models\Database\DbModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Demo];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[SalesLT].[FK_CustomerAddress_Address_AddressID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[CustomerAddress] DROP CONSTRAINT [FK_CustomerAddress_Address_AddressID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_CustomerAddress_Customer_CustomerID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[CustomerAddress] DROP CONSTRAINT [FK_CustomerAddress_Customer_CustomerID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_Product_ProductCategory_ProductCategoryID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[Product] DROP CONSTRAINT [FK_Product_ProductCategory_ProductCategoryID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_Product_ProductModel_ProductModelID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[Product] DROP CONSTRAINT [FK_Product_ProductModel_ProductModelID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[ProductModelProductDescription] DROP CONSTRAINT [FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_ProductModelProductDescription_ProductModel_ProductModelID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[ProductModelProductDescription] DROP CONSTRAINT [FK_ProductModelProductDescription_ProductModel_ProductModelID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_SalesOrderDetail_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[SalesOrderDetail] DROP CONSTRAINT [FK_SalesOrderDetail_Product_ProductID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[SalesOrderDetail] DROP CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_SalesOrderHeader_Address_BillTo_AddressID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Address_BillTo_AddressID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_SalesOrderHeader_Address_ShipTo_AddressID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Address_ShipTo_AddressID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_SalesOrderHeader_Customer_CustomerID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[BuildVersion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BuildVersion];
GO
IF OBJECT_ID(N'[dbo].[ErrorLog]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ErrorLog];
GO
IF OBJECT_ID(N'[SalesLT].[Address]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[Address];
GO
IF OBJECT_ID(N'[SalesLT].[Customer]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[Customer];
GO
IF OBJECT_ID(N'[SalesLT].[CustomerAddress]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[CustomerAddress];
GO
IF OBJECT_ID(N'[SalesLT].[Product]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[Product];
GO
IF OBJECT_ID(N'[SalesLT].[ProductCategory]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[ProductCategory];
GO
IF OBJECT_ID(N'[SalesLT].[ProductDescription]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[ProductDescription];
GO
IF OBJECT_ID(N'[SalesLT].[ProductModel]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[ProductModel];
GO
IF OBJECT_ID(N'[SalesLT].[ProductModelProductDescription]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[ProductModelProductDescription];
GO
IF OBJECT_ID(N'[SalesLT].[SalesOrderDetail]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[SalesOrderDetail];
GO
IF OBJECT_ID(N'[SalesLT].[SalesOrderHeader]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[SalesOrderHeader];
GO
IF OBJECT_ID(N'[DbModelStoreContainer].[vGetAllCategories]', 'U') IS NOT NULL
    DROP TABLE [DbModelStoreContainer].[vGetAllCategories];
GO
IF OBJECT_ID(N'[DbModelStoreContainer].[vProductAndDescription]', 'U') IS NOT NULL
    DROP TABLE [DbModelStoreContainer].[vProductAndDescription];
GO
IF OBJECT_ID(N'[DbModelStoreContainer].[vProductModelCatalogDescription]', 'U') IS NOT NULL
    DROP TABLE [DbModelStoreContainer].[vProductModelCatalogDescription];
GO
IF OBJECT_ID(N'[DbModelStoreContainer].[database_firewall_rules]', 'U') IS NOT NULL
    DROP TABLE [DbModelStoreContainer].[database_firewall_rules];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'BuildVersions'
CREATE TABLE [dbo].[BuildVersions] (
    [SystemInformationID] tinyint IDENTITY(1,1) NOT NULL,
    [Database_Version] nvarchar(25)  NOT NULL,
    [VersionDate] datetime  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ErrorLogs'
CREATE TABLE [dbo].[ErrorLogs] (
    [ErrorLogID] int IDENTITY(1,1) NOT NULL,
    [ErrorTime] datetime  NOT NULL,
    [UserName] nvarchar(128)  NOT NULL,
    [ErrorNumber] int  NOT NULL,
    [ErrorSeverity] int  NULL,
    [ErrorState] int  NULL,
    [ErrorProcedure] nvarchar(126)  NULL,
    [ErrorLine] int  NULL,
    [ErrorMessage] nvarchar(4000)  NOT NULL
);
GO

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [AddressID] int IDENTITY(1,1) NOT NULL,
    [AddressLine1] nvarchar(60)  NOT NULL,
    [AddressLine2] nvarchar(60)  NULL,
    [City] nvarchar(30)  NOT NULL,
    [StateProvince] nvarchar(50)  NOT NULL,
    [CountryRegion] nvarchar(50)  NOT NULL,
    [PostalCode] nvarchar(15)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [NameStyle] bit  NOT NULL,
    [Title] nvarchar(8)  NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [MiddleName] nvarchar(50)  NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Suffix] nvarchar(10)  NULL,
    [CompanyName] nvarchar(128)  NULL,
    [SalesPerson] nvarchar(256)  NULL,
    [EmailAddress] nvarchar(50)  NULL,
    [Phone] nvarchar(25)  NULL,
    [PasswordHash] varchar(128)  NOT NULL,
    [PasswordSalt] varchar(10)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'CustomerAddresses'
CREATE TABLE [dbo].[CustomerAddresses] (
    [CustomerID] int  NOT NULL,
    [AddressID] int  NOT NULL,
    [AddressType] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ProductID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ProductNumber] nvarchar(25)  NOT NULL,
    [Color] nvarchar(15)  NULL,
    [StandardCost] decimal(19,4)  NOT NULL,
    [ListPrice] decimal(19,4)  NOT NULL,
    [Size] nvarchar(5)  NULL,
    [Weight] decimal(8,2)  NULL,
    [ProductCategoryID] int  NULL,
    [ProductModelID] int  NULL,
    [SellStartDate] datetime  NOT NULL,
    [SellEndDate] datetime  NULL,
    [DiscontinuedDate] datetime  NULL,
    [ThumbNailPhoto] varbinary(max)  NULL,
    [ThumbnailPhotoFileName] nvarchar(50)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductCategories'
CREATE TABLE [dbo].[ProductCategories] (
    [ProductCategoryID] int IDENTITY(1,1) NOT NULL,
    [ParentProductCategoryID] int  NULL,
    [Name] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductDescriptions'
CREATE TABLE [dbo].[ProductDescriptions] (
    [ProductDescriptionID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(400)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductModels'
CREATE TABLE [dbo].[ProductModels] (
    [ProductModelID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [CatalogDescription] nvarchar(max)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductModelProductDescriptions'
CREATE TABLE [dbo].[ProductModelProductDescriptions] (
    [ProductModelID] int  NOT NULL,
    [ProductDescriptionID] int  NOT NULL,
    [Culture] nchar(6)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesOrderDetails'
CREATE TABLE [dbo].[SalesOrderDetails] (
    [SalesOrderID] int  NOT NULL,
    [SalesOrderDetailID] int IDENTITY(1,1) NOT NULL,
    [OrderQty] smallint  NOT NULL,
    [ProductID] int  NOT NULL,
    [UnitPrice] decimal(19,4)  NOT NULL,
    [UnitPriceDiscount] decimal(19,4)  NOT NULL,
    [LineTotal] decimal(38,6)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesOrderHeaders'
CREATE TABLE [dbo].[SalesOrderHeaders] (
    [SalesOrderID] int  NOT NULL,
    [RevisionNumber] tinyint  NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [DueDate] datetime  NOT NULL,
    [ShipDate] datetime  NULL,
    [Status] tinyint  NOT NULL,
    [OnlineOrderFlag] bit  NOT NULL,
    [SalesOrderNumber] nvarchar(25)  NOT NULL,
    [PurchaseOrderNumber] nvarchar(25)  NULL,
    [AccountNumber] nvarchar(15)  NULL,
    [CustomerID] int  NOT NULL,
    [ShipToAddressID] int  NULL,
    [BillToAddressID] int  NULL,
    [ShipMethod] nvarchar(50)  NOT NULL,
    [CreditCardApprovalCode] varchar(15)  NULL,
    [SubTotal] decimal(19,4)  NOT NULL,
    [TaxAmt] decimal(19,4)  NOT NULL,
    [Freight] decimal(19,4)  NOT NULL,
    [TotalDue] decimal(19,4)  NOT NULL,
    [Comment] nvarchar(max)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'vGetAllCategories'
CREATE TABLE [dbo].[vGetAllCategories] (
    [ParentProductCategoryName] nvarchar(50)  NOT NULL,
    [ProductCategoryName] nvarchar(50)  NULL,
    [ProductCategoryID] int  NULL
);
GO

-- Creating table 'vProductAndDescriptions'
CREATE TABLE [dbo].[vProductAndDescriptions] (
    [ProductID] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ProductModel] nvarchar(50)  NOT NULL,
    [Culture] nchar(6)  NOT NULL,
    [Description] nvarchar(400)  NOT NULL
);
GO

-- Creating table 'vProductModelCatalogDescriptions'
CREATE TABLE [dbo].[vProductModelCatalogDescriptions] (
    [ProductModelID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Summary] nvarchar(max)  NULL,
    [Manufacturer] nvarchar(max)  NULL,
    [Copyright] nvarchar(30)  NULL,
    [ProductURL] nvarchar(256)  NULL,
    [WarrantyPeriod] nvarchar(256)  NULL,
    [WarrantyDescription] nvarchar(256)  NULL,
    [NoOfYears] nvarchar(256)  NULL,
    [MaintenanceDescription] nvarchar(256)  NULL,
    [Wheel] nvarchar(256)  NULL,
    [Saddle] nvarchar(256)  NULL,
    [Pedal] nvarchar(256)  NULL,
    [BikeFrame] nvarchar(max)  NULL,
    [Crankset] nvarchar(256)  NULL,
    [PictureAngle] nvarchar(256)  NULL,
    [PictureSize] nvarchar(256)  NULL,
    [ProductPhotoID] nvarchar(256)  NULL,
    [Material] nvarchar(256)  NULL,
    [Color] nvarchar(256)  NULL,
    [ProductLine] nvarchar(256)  NULL,
    [Style] nvarchar(256)  NULL,
    [RiderExperience] nvarchar(1024)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'database_firewall_rules'
CREATE TABLE [dbo].[database_firewall_rules] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(128)  NOT NULL,
    [start_ip_address] varchar(45)  NOT NULL,
    [end_ip_address] varchar(45)  NOT NULL,
    [create_date] datetime  NOT NULL,
    [modify_date] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [SystemInformationID] in table 'BuildVersions'
ALTER TABLE [dbo].[BuildVersions]
ADD CONSTRAINT [PK_BuildVersions]
    PRIMARY KEY CLUSTERED ([SystemInformationID] ASC);
GO

-- Creating primary key on [ErrorLogID] in table 'ErrorLogs'
ALTER TABLE [dbo].[ErrorLogs]
ADD CONSTRAINT [PK_ErrorLogs]
    PRIMARY KEY CLUSTERED ([ErrorLogID] ASC);
GO

-- Creating primary key on [AddressID] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([AddressID] ASC);
GO

-- Creating primary key on [CustomerID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [CustomerID], [AddressID] in table 'CustomerAddresses'
ALTER TABLE [dbo].[CustomerAddresses]
ADD CONSTRAINT [PK_CustomerAddresses]
    PRIMARY KEY CLUSTERED ([CustomerID], [AddressID] ASC);
GO

-- Creating primary key on [ProductID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ProductID] ASC);
GO

-- Creating primary key on [ProductCategoryID] in table 'ProductCategories'
ALTER TABLE [dbo].[ProductCategories]
ADD CONSTRAINT [PK_ProductCategories]
    PRIMARY KEY CLUSTERED ([ProductCategoryID] ASC);
GO

-- Creating primary key on [ProductDescriptionID] in table 'ProductDescriptions'
ALTER TABLE [dbo].[ProductDescriptions]
ADD CONSTRAINT [PK_ProductDescriptions]
    PRIMARY KEY CLUSTERED ([ProductDescriptionID] ASC);
GO

-- Creating primary key on [ProductModelID] in table 'ProductModels'
ALTER TABLE [dbo].[ProductModels]
ADD CONSTRAINT [PK_ProductModels]
    PRIMARY KEY CLUSTERED ([ProductModelID] ASC);
GO

-- Creating primary key on [ProductModelID], [ProductDescriptionID], [Culture] in table 'ProductModelProductDescriptions'
ALTER TABLE [dbo].[ProductModelProductDescriptions]
ADD CONSTRAINT [PK_ProductModelProductDescriptions]
    PRIMARY KEY CLUSTERED ([ProductModelID], [ProductDescriptionID], [Culture] ASC);
GO

-- Creating primary key on [SalesOrderID], [SalesOrderDetailID] in table 'SalesOrderDetails'
ALTER TABLE [dbo].[SalesOrderDetails]
ADD CONSTRAINT [PK_SalesOrderDetails]
    PRIMARY KEY CLUSTERED ([SalesOrderID], [SalesOrderDetailID] ASC);
GO

-- Creating primary key on [SalesOrderID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [PK_SalesOrderHeaders]
    PRIMARY KEY CLUSTERED ([SalesOrderID] ASC);
GO

-- Creating primary key on [ParentProductCategoryName] in table 'vGetAllCategories'
ALTER TABLE [dbo].[vGetAllCategories]
ADD CONSTRAINT [PK_vGetAllCategories]
    PRIMARY KEY CLUSTERED ([ParentProductCategoryName] ASC);
GO

-- Creating primary key on [ProductID], [Name], [ProductModel], [Culture], [Description] in table 'vProductAndDescriptions'
ALTER TABLE [dbo].[vProductAndDescriptions]
ADD CONSTRAINT [PK_vProductAndDescriptions]
    PRIMARY KEY CLUSTERED ([ProductID], [Name], [ProductModel], [Culture], [Description] ASC);
GO

-- Creating primary key on [ProductModelID], [Name], [rowguid], [ModifiedDate] in table 'vProductModelCatalogDescriptions'
ALTER TABLE [dbo].[vProductModelCatalogDescriptions]
ADD CONSTRAINT [PK_vProductModelCatalogDescriptions]
    PRIMARY KEY CLUSTERED ([ProductModelID], [Name], [rowguid], [ModifiedDate] ASC);
GO

-- Creating primary key on [id], [name], [start_ip_address], [end_ip_address], [create_date], [modify_date] in table 'database_firewall_rules'
ALTER TABLE [dbo].[database_firewall_rules]
ADD CONSTRAINT [PK_database_firewall_rules]
    PRIMARY KEY CLUSTERED ([id], [name], [start_ip_address], [end_ip_address], [create_date], [modify_date] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AddressID] in table 'CustomerAddresses'
ALTER TABLE [dbo].[CustomerAddresses]
ADD CONSTRAINT [FK_CustomerAddress_Address_AddressID]
    FOREIGN KEY ([AddressID])
    REFERENCES [dbo].[Addresses]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerAddress_Address_AddressID'
CREATE INDEX [IX_FK_CustomerAddress_Address_AddressID]
ON [dbo].[CustomerAddresses]
    ([AddressID]);
GO

-- Creating foreign key on [BillToAddressID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [FK_SalesOrderHeader_Address_BillTo_AddressID]
    FOREIGN KEY ([BillToAddressID])
    REFERENCES [dbo].[Addresses]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Address_BillTo_AddressID'
CREATE INDEX [IX_FK_SalesOrderHeader_Address_BillTo_AddressID]
ON [dbo].[SalesOrderHeaders]
    ([BillToAddressID]);
GO

-- Creating foreign key on [ShipToAddressID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [FK_SalesOrderHeader_Address_ShipTo_AddressID]
    FOREIGN KEY ([ShipToAddressID])
    REFERENCES [dbo].[Addresses]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Address_ShipTo_AddressID'
CREATE INDEX [IX_FK_SalesOrderHeader_Address_ShipTo_AddressID]
ON [dbo].[SalesOrderHeaders]
    ([ShipToAddressID]);
GO

-- Creating foreign key on [CustomerID] in table 'CustomerAddresses'
ALTER TABLE [dbo].[CustomerAddresses]
ADD CONSTRAINT [FK_CustomerAddress_Customer_CustomerID]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customers]
        ([CustomerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CustomerID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customers]
        ([CustomerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Customer_CustomerID'
CREATE INDEX [IX_FK_SalesOrderHeader_Customer_CustomerID]
ON [dbo].[SalesOrderHeaders]
    ([CustomerID]);
GO

-- Creating foreign key on [ProductCategoryID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Product_ProductCategory_ProductCategoryID]
    FOREIGN KEY ([ProductCategoryID])
    REFERENCES [dbo].[ProductCategories]
        ([ProductCategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_ProductCategory_ProductCategoryID'
CREATE INDEX [IX_FK_Product_ProductCategory_ProductCategoryID]
ON [dbo].[Products]
    ([ProductCategoryID]);
GO

-- Creating foreign key on [ProductModelID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID]
    FOREIGN KEY ([ProductModelID])
    REFERENCES [dbo].[ProductModels]
        ([ProductModelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_ProductModel_ProductModelID'
CREATE INDEX [IX_FK_Product_ProductModel_ProductModelID]
ON [dbo].[Products]
    ([ProductModelID]);
GO

-- Creating foreign key on [ProductID] in table 'SalesOrderDetails'
ALTER TABLE [dbo].[SalesOrderDetails]
ADD CONSTRAINT [FK_SalesOrderDetail_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderDetail_Product_ProductID'
CREATE INDEX [IX_FK_SalesOrderDetail_Product_ProductID]
ON [dbo].[SalesOrderDetails]
    ([ProductID]);
GO

-- Creating foreign key on [ParentProductCategoryID] in table 'ProductCategories'
ALTER TABLE [dbo].[ProductCategories]
ADD CONSTRAINT [FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID]
    FOREIGN KEY ([ParentProductCategoryID])
    REFERENCES [dbo].[ProductCategories]
        ([ProductCategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID'
CREATE INDEX [IX_FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID]
ON [dbo].[ProductCategories]
    ([ParentProductCategoryID]);
GO

-- Creating foreign key on [ProductDescriptionID] in table 'ProductModelProductDescriptions'
ALTER TABLE [dbo].[ProductModelProductDescriptions]
ADD CONSTRAINT [FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID]
    FOREIGN KEY ([ProductDescriptionID])
    REFERENCES [dbo].[ProductDescriptions]
        ([ProductDescriptionID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID'
CREATE INDEX [IX_FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID]
ON [dbo].[ProductModelProductDescriptions]
    ([ProductDescriptionID]);
GO

-- Creating foreign key on [ProductModelID] in table 'ProductModelProductDescriptions'
ALTER TABLE [dbo].[ProductModelProductDescriptions]
ADD CONSTRAINT [FK_ProductModelProductDescription_ProductModel_ProductModelID]
    FOREIGN KEY ([ProductModelID])
    REFERENCES [dbo].[ProductModels]
        ([ProductModelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SalesOrderID] in table 'SalesOrderDetails'
ALTER TABLE [dbo].[SalesOrderDetails]
ADD CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]
    FOREIGN KEY ([SalesOrderID])
    REFERENCES [dbo].[SalesOrderHeaders]
        ([SalesOrderID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------