USE [BankOne_DW]
GO

CREATE SCHEMA [int]
GO

-- Delete the table if it's already present in the database
DROP TABLE IF EXISTS [int].[IncrementalLoads]

-- Create the table, without populating it with anything
CREATE TABLE [int].[IncrementalLoads](
	[LoadDateKey] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](100) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LoadDates] PRIMARY KEY CLUSTERED  ([LoadDateKey] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [int].[Lineage](
	[LineageKey] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](200) NOT NULL,
	[StartLoad] [datetime] NOT NULL,
	[FinishLoad] [datetime] NULL,
	[LastLoadedDate] [datetime] NOT NULL,
	[Status] [nvarchar](1) NOT NULL,
	[Type] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_Integration_Lineage] PRIMARY KEY CLUSTERED 
(
	[LineageKey] ASC
)
) ON [PRIMARY]
GO
ALTER TABLE [int].[Lineage] ADD  CONSTRAINT [DF_Lineage_Status]  DEFAULT (N'P') FOR [Status]
GO
ALTER TABLE [int].[Lineage] ADD  CONSTRAINT [DF_Lineage_Type]  DEFAULT (N'F') FOR [Type]
GO
