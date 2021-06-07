USE [BankOne_DW]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Loans](
	[Loans Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Loan Key] [int] NOT NULL,
	[Account Key] [int] NOT NULL,
	[Date Key] [int] NOT NULL,
	[Branch Key] [int] NOT NULL,
	[Interest Rate] [decimal](18, 3) NULL,
	[Loan Repayment Sequence Number] [int] NULL,
	[Loan Repayment Amount] [decimal](18, 2) NULL,
	[Lineage Key] [int] NULL
) ON [PRIMARY]
GO
