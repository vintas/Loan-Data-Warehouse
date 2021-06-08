CREATE TABLE [dbo].[Bridge_Customer](
	[Account_Customer Bridge ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Account Key] [int] NOT NULL,
	[Customer 1 Key] [int] NOT NULL,
    [Customer 2 Key] [int] NOT NULL,
    [Nominee] NVARCHAR(50) NOT NULL,
    [Relationship with Customer 2] NVARCHAR(50) NOT NULL,
    [Relationship with Nominee] NVARCHAR(50) NOT NULL,
	[Lineage Key] [int] NOT NULL
)
