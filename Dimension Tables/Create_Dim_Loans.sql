CREATE TABLE [dbo].[Dim_Loans](
	[Loan Key] NVARCHAR(20) NOT NULL PRIMARY KEY,
	[Interest Rate] FLOAT,
	[Type of Loan] NVARCHAR(10),
	[Loan Duration] INT,
	[Loan Principal Amount] FLOAT,
	[Lineage Key] INT
)