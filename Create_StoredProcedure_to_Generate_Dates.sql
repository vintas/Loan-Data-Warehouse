USE [BankOne_DW]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[Load_DimDate]
@StartDate DATE = '2000-01-01',
@EndDate DATE = '2025-12-31'

AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

	TRUNCATE TABLE [Dim_Date];


    DECLARE @EndOfTime datetime =  '9999-12-31';
	DECLARE @LastDateLoaded datetime;

    BEGIN TRAN;

	INSERT INTO [int].[Lineage](
		 [TableName]
		,[StartLoad]
		,[FinishLoad]
		,[Status]
		,[Type]
		,[LastLoadedDate]
		)
	VALUES (
		 'Dim_Date'
		,GETDATE()
		,NULL
		,'P'
		,'F'
		,GETDATE()
		);
-- Get the lineage of the current load of Dim_Date
DECLARE @LineageKey int = (SELECT TOP(1) [LineageKey]
                               FROM int.Lineage
                               WHERE [TableName] = N'Dim_Date'
                               AND [FinishLoad] IS NULL
                               ORDER BY [LineageKey] DESC);

IF NOT EXISTS (SELECT 1 FROM Dim_Date WHERE [Date Key] = 0)
INSERT INTO [dbo].[Dim_Date]
           ([Date Key]
           ,[Date]
           ,[Day]
           ,[Day Suffix]
           ,[Weekday]
           ,[Weekday Name]
           ,[Weekday Name Short]
           ,[Weekday Name FirstLetter]
           ,[Day Of Year]
           ,[Week Of Month]
           ,[Week Of Year]
           ,[Month]
           ,[Month Name]
           ,[Month Name Short]
           ,[Month Name FirstLetter]
           ,[Quarter]
           ,[Quarter Name]
           ,[Year]
           ,[MMYYYY]
           ,[Month Year]
           ,[Is Weekend]
           ,[Is Holiday]
           ,[Holiday Name]
           ,[Special Day]
           ,[First Date Of Year]
           ,[Last Date Of Year]
           ,[First Date Of Quater]
           ,[Last Date Of Quater]
           ,[First Date Of Month]
           ,[Last Date Of Month]
           ,[First Date Of Week]
           ,[Last Date Of Week]
           ,[Lineage Key])
     VALUES
           (0,'1753-01-01',0,'',0,'N/A','N/A','',0,0,0,0,'N/A','N/A','',0,'N/A',0,'N/A','N/A',0,0,'N/A','N/A','1753-01-01','1753-01-01','1753-01-01','1753-01-01','1753-01-01','1753-01-01','1753-01-01','1753-01-01',-1)


WHILE @StartDate < @EndDate
BEGIN
   INSERT INTO [dbo].[Dim_Date] (
			[Date Key]
           ,[Date]
           ,[Day]
           ,[Day Suffix]
           ,[Weekday]
           ,[Weekday Name]
           ,[Weekday Name Short]
           ,[Weekday Name FirstLetter]
           ,[Day Of Year]
           ,[Week Of Month]
           ,[Week Of Year]
           ,[Month]
           ,[Month Name]
           ,[Month Name Short]
           ,[Month Name FirstLetter]
           ,[Quarter]
           ,[Quarter Name]
           ,[Year]
           ,[MMYYYY]
           ,[Month Year]
           ,[Is Weekend]
           ,[Is Holiday]
           ,[Holiday Name]
           ,[Special Day]
           ,[First Date Of Year]
           ,[Last Date Of Year]
           ,[First Date Of Quater]
           ,[Last Date Of Quater]
           ,[First Date Of Month]
           ,[Last Date Of Month]
           ,[First Date Of Week]
           ,[Last Date Of Week]
		   ,[Lineage Key]
      )
   SELECT DateKey = YEAR(@StartDate) * 10000 + MONTH(@StartDate) * 100 + DAY(@StartDate),
      DATE = @StartDate,
      Day = DAY(@StartDate),
      [DaySuffix] = CASE 
         WHEN DAY(@StartDate) = 1
            OR DAY(@StartDate) = 21
            OR DAY(@StartDate) = 31
            THEN 'st'
         WHEN DAY(@StartDate) = 2
            OR DAY(@StartDate) = 22
            THEN 'nd'
         WHEN DAY(@StartDate) = 3
            OR DAY(@StartDate) = 23
            THEN 'rd'
         ELSE 'th'
         END,
      WEEKDAY = DATEPART(dw, @StartDate),
      WeekDayName = DATENAME(dw, @StartDate),
      WeekDayName_Short = UPPER(LEFT(DATENAME(dw, @StartDate), 3)),
      WeekDayName_FirstLetter = LEFT(DATENAME(dw, @StartDate), 1),
      [DayOfYear] = DATENAME(dy, @StartDate),
      [WeekOfMonth] = DATEPART(WEEK, @StartDate) - DATEPART(WEEK, DATEADD(MM, DATEDIFF(MM, 0, @StartDate), 0)) + 1,
      [WeekOfYear] = DATEPART(wk, @StartDate),
      [Month] = MONTH(@StartDate),
      [MonthName] = DATENAME(mm, @StartDate),
      [MonthName_Short] = UPPER(LEFT(DATENAME(mm, @StartDate), 3)),
      [MonthName_FirstLetter] = LEFT(DATENAME(mm, @StartDate), 1),
      [Quarter] = DATEPART(q, @StartDate),
      [QuarterName] = CASE 
         WHEN DATENAME(qq, @StartDate) = 1
            THEN 'First'
         WHEN DATENAME(qq, @StartDate) = 2
            THEN 'second'
         WHEN DATENAME(qq, @StartDate) = 3
            THEN 'third'
         WHEN DATENAME(qq, @StartDate) = 4
            THEN 'fourth'
         END,
      [Year] = YEAR(@StartDate),
      [MMYYYY] = RIGHT('0' + CAST(MONTH(@StartDate) AS VARCHAR(2)), 2) + CAST(YEAR(@StartDate) AS VARCHAR(4)),
      [MonthYear] = CAST(YEAR(@StartDate) AS VARCHAR(4)) + UPPER(LEFT(DATENAME(mm, @StartDate), 3)),
      [IsWeekend] = CASE 
         WHEN DATENAME(dw, @StartDate) = 'Sunday'
            OR DATENAME(dw, @StartDate) = 'Saturday'
            THEN 1
         ELSE 0
         END,
      [IsHoliday] = 0,
[HolidayName] =	CONVERT(varchar(20), ''),
[SpecialDays] =	CONVERT(varchar(20), ''),
[FirstDateofYear]   = CAST(CAST(YEAR(@StartDate) AS VARCHAR(4)) + '-01-01' AS DATE),
[LastDateofYear]    = CAST(CAST(YEAR(@StartDate) AS VARCHAR(4)) + '-12-31' AS DATE),
[FirstDateofQuater] = DATEADD(qq, DATEDIFF(qq, 0, GETDATE()), 0),
[LastDateofQuater]  = DATEADD(dd, - 1, DATEADD(qq, DATEDIFF(qq, 0, GETDATE()) + 1, 0)),
[FirstDateofMonth]  = CAST(CAST(YEAR(@StartDate) AS VARCHAR(4)) + '-' + CAST(MONTH(@StartDate) AS VARCHAR(2)) + '-01' AS DATE),
[LastDateofMonth]   = EOMONTH(@StartDate),
[FirstDateofWeek]   = DATEADD(dd, - (DATEPART(dw, @StartDate) - 1), @StartDate),
[LastDateofWeek] = DATEADD(dd, 7 - (DATEPART(dw, @StartDate)), @StartDate),
@LineageKey


   SET @StartDate = DATEADD(DD, 1, @StartDate)
END

--Update Holiday information

UPDATE Dim_Date
SET [Is Holiday] = 1,
   [Holiday Name] = 'Republic Day'
WHERE [Month] = 1
   AND [Day] = 26

UPDATE Dim_Date
SET [Is Holiday] = 1,
   [Holiday Name] = 'Ambedkar Jayanti'
WHERE [Month] = 4
   AND [Day] = 14

UPDATE Dim_Date
SET [Is Holiday] = 1,
   [Holiday Name] = 'Independence Day'
WHERE [Month] = 8
   AND [Day] = 15

UPDATE Dim_Date
SET [Is Holiday] = 1,
   [Holiday Name] = 'Gandhi Jayanti'
WHERE [Month] = 10
   AND [Day] = 2

UPDATE Dim_Date
SET [Is Holiday] = 1,
   [Holiday Name] = 'Christmas'
WHERE [Month] = 12
   AND [Day] = 25

UPDATE Dim_Date
SET [Special Day] = 'Valentines Day'
WHERE [Month] = 2
   AND [Day] = 14


SELECT * FROM Dim_Date


    
	-- Update the lineage table for the most current Dim_Date load with the finish date and 
	-- 'S' in the Status column, meaning that the load finished successfully
	UPDATE [int].Lineage
        SET 
			FinishLoad = SYSDATETIME(),
            Status = 'S',
			@LastDateLoaded = LastLoadedDate
    WHERE [LineageKey] = @LineageKey;
	 
	
	-- Update the LoadDates table with the most current load date for Dim_Date
	UPDATE [int].[IncrementalLoads]
        SET [LoadDate] = @LastDateLoaded
    WHERE [TableName] = N'Dim_Date';

    -- All these tasks happen together or don't happen at all. 
	COMMIT;

    RETURN 0;
END;
