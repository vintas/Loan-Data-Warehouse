CREATE TABLE [dbo].[Fact_Account_Metrics](
	[Account Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer 1 Key] [int] NOT NULL,
    [Customer 2 Key] [int] NOT NULL,
    [Nominee] NVARCHAR(10) NOT NULL,
    [Relationship with Customer 2] NVARCHAR(20) NOT NULL,
    [Relationship with Nominee] NVARCHAR(20) NOT NULL,
	[Lineage Key] [int] NULL
)