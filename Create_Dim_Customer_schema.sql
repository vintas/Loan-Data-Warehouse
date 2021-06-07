USE [BankOne_DW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Customer](
	[Customer Key] [int] IDENTITY(1,1) NOT NULL,
	[_Source Key] [nvarchar](50) NOT NULL,
	[Age] [int] NULL,
	[Gender] [nvarchar](15) NOT NULL,
	[Marital Status] [nvarchar](10) NOT NULL,
	[Assets] [decimal](18, 2) NULL,
	[KYC Done] [nvarchar](30) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Lineage Key] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer Key] ASC
)
) ON [PRIMARY]
GO