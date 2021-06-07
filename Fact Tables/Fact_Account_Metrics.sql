CREATE TABLE [dbo].[Fact_Account_Metrics](
	[Account Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Date Key] [int] NOT NULL,
    [Current Account Balance] [decimal](18, 2) NULL,
	[Has a Loan] [tinyint] NOT NULL,
    [Number of Loans] [int] NOT NULL,
	[Lineage Key] [int] NULL
)