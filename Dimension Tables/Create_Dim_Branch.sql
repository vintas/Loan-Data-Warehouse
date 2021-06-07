USE [BankOne_DW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Branch] (
	[Branch Key] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[_Source Key] [nvarchar](50) NOT NULL,
	[Branch Name] NVARCHAR(50) NOT NULL,
	[Branch PINCODE] NVARCHAR(50) NOT NULL,
	[Number of Employees] INT NOT NULL,
	[Number of Customers] NVARCHAR(50) NOT NULL,
	[Branch Type] NVARCHAR(10) NOT NULL,
	[City] NVARCHAR(20) NOT NULL,
	[State] NVARCHAR(20) NOT NULL,
	[Country] NVARCHAR(20) NOT NULL,
	[Lineage Key] INT
)