SELECT [Branch_Name], [Year],
SUM(Loan_Principal_Amount) AS Total_Loan_Given_Amount
FROM [Fact_Loans] fl INNER JOIN [Dim_Date] dd
ON fl.[Date_Key] = dd.[Date_Key] INNER JOIN [Dim_Loans] dl
ON fl.[Loan_Key] = dl.[Loan_Key] INNER JOIN [Dim_Branch] db
ON fl.[Branch_Key] = db.[Branch_Key]
GROUP BY [Branch_Name], [Year]
ORDER BY [Branch_Name], [Year]


--Which Branch had the most loan repayments on a given month ?
select TOP (10) [Branch Name],[State], count(*) as loan_repayments from [Fact_Loans]
inner join [Dim_Branch] ON [Fact_Loans].[Branch Key] = [Dim_Branch].[Branch Key]
inner join [Dim_Date] ON [Fact_Loans].[Date Key] = [Dim_Date].[Date Key]
where [Dim_Date].[MMYYYY] = '012018'
group by [Branch Name],[State]
order by count(*) desc

--Which is the best branch based on the number of new loans issued?
select top(10) [Branch Name],[State],[Year], count(*) as new_loans from [Fact_Loans]
inner join [Dim_Branch] ON [Fact_Loans].[Branch Key] = [Dim_Branch].[Branch Key]
inner join [Dim_Date] ON [Fact_Loans].[Date Key] = [Dim_Date].[Date Key]
where [Loan Repayment Sequence Number] = 0
group by [Branch Name],[State], [Year]
order by count(*) desc


select * from [Fact_Loans]
--inner join Dim_Account on [Dim_Account].[Account Key] = [Fact_Loans].[Account Key]
inner join [Bridge_Customer] on [Bridge_Customer].[Account Key] = [Fact_Loans].[Account Key]
inner join [Dim_Customer] on [Dim_Customer].[Customer Key] = [Bridge_Customer].[Customer 1 Key]
where [Loan Repayment Sequence Number] = 0
and 