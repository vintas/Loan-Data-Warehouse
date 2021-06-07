USE [BankOne_DW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Loans](
	[Loan Key] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[_Source Key] [nvarchar](50) NOT NULL,
	[Interest Rate] NVARCHAR(50) NOT NULL,
	[Type of Loan] NVARCHAR(50) NOT NULL,
	[Loan Duration] INT NOT NULL,
	[Loan Issue date] DATE NULL,
	[Loan Principal Amount] [decimal](18, 2) NOT NULL,
	[Lineage Key] INT
)