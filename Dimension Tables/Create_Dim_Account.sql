CREATE TABLE [dbo].[Dim_Account](
	[Account Key] INT NOT NULL PRIMARY KEY,
	[Source Key] NVARCHAR(10) NOT NULL,
	[Account Open Date] INT NOT NULL,
	[Account Type] INT NOT NULL,
	[Lineage Key] INT NOT NULL
)