CREATE TABLE [dbo].[Dim_Branch] (
	[Branch ID] NVARCHAR(20) NOT NULL PRIMARY KEY,
	[Branch Name] NVARCHAR(20),
	[Branch Location] NVARCHAR(20),
	[Number of Employees] INT,
	[Number of Customers] INT,
	[Branch Type] NVARCHAR(10),
	[City] NVARCHAR(20),
	[STATE] NVARCHAR(20),
	[COUNTRY] NVARCHAR(20),
	[Lineage Key] INT
)