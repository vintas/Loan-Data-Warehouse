
--Fact loan to dim_loan
ALTER TABLE [dbo].[Fact_Loans]
ADD CONSTRAINT FK_FactLoan_Loan_key
FOREIGN KEY ([Loan Key]) REFERENCES [dbo].[Dim_Loans]([Loan Key]); 

--Fact loan to dim_branch
ALTER TABLE [dbo].[Fact_Loans]
ADD CONSTRAINT FK_FactLoan_branch_key
FOREIGN KEY ([Branch Key]) REFERENCES [dbo].[Dim_Branch]([Branch Key]); 

--Fact loan to dim_date
ALTER TABLE [dbo].[Fact_Loans]
ADD CONSTRAINT FK_FactLoan_date_key
FOREIGN KEY ([Date Key]) REFERENCES [dbo].[Dim_Date]([Date Key]); 

--Fact loan to dim_account
ALTER TABLE [dbo].[Fact_Loans]
ADD CONSTRAINT FK_FactLoan_account_key
FOREIGN KEY ([Account Key]) REFERENCES [dbo].[Dim_Account]([Account Key]); 

--Bridge to account
ALTER TABLE [dbo].[Bridge_Customer]
ADD CONSTRAINT FK_BridgeCustomer_account_key
FOREIGN KEY ([Account Key]) REFERENCES [dbo].[Dim_Account]([Account Key]); 

--bridge to Cutomer 1
ALTER TABLE [dbo].[Bridge_Customer]
ADD CONSTRAINT FK_BridgeCustomer_customer1_key
FOREIGN KEY ([Customer 1 Key]) REFERENCES [dbo].[Dim_Customer]([Customer Key]); 

--bridge to Cutomer 2
ALTER TABLE [dbo].[Bridge_Customer]
ADD CONSTRAINT FK_BridgeCustomer_customer2_key
FOREIGN KEY ([Customer 2 Key]) REFERENCES [dbo].[Dim_Customer]([Customer Key]); 

--Fact_Account_Metrics to Account
ALTER TABLE [dbo].[Fact_Account_Metrics]
ADD CONSTRAINT FK_AccountMetrics_account_key
FOREIGN KEY ([Account Key]) REFERENCES [dbo].[Dim_Account]([Account Key]); 

--Fact_Account_Metrics to Date
ALTER TABLE [dbo].[Fact_Account_Metrics]
ADD CONSTRAINT FK_AccountMetrics_date_key
FOREIGN KEY ([Date Key]) REFERENCES [dbo].[Dim_Date]([Date Key]); 

--Fact_Customer_Metrics to Customer
ALTER TABLE [dbo].[Fact_Customer_Metrics]
ADD CONSTRAINT FK_CustomerMetrics_customer_key
FOREIGN KEY ([Customer Key]) REFERENCES [dbo].[Dim_Customer]([Customer Key]); 

--Fact_Customer_Metrics to Date
ALTER TABLE [dbo].[Fact_Customer_Metrics]
ADD CONSTRAINT FK_CustomerMetrics_date_key
FOREIGN KEY ([Date Key]) REFERENCES [dbo].[Dim_Date]([Date Key]); 


