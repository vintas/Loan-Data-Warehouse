CREATE TABLE [dbo].[Fact_Customer_Metrics](
	[FactCustomer Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer Key] [int] NOT NULL,
	[Date Key] [int] NOT NULL,
	[Credit Score] [int] NOT NULL,
	[Lineage Key] [int] NULL
)