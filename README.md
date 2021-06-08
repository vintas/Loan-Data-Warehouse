# Loan-Data-Warehouse

## DW assignment to create a Data Warehouse for a bank for their Loans Department

----
We are following the Kimball Methodology.

The following is the schema we will use. Please edit if you have some refinements.

We wil start with the date dimension as it will surely be necessary, as it usually is in all Data Warehousing Solutions.

Here we will go with **grain of a day** because we are focusing on loans and going to the depth of time doesn't help us in any way in analysis. Moreover loans are a lengthy process and don't require time level accuracy.

As this date will be used in different reports, we may need to show the dates formatted in different way[Monday/mon/M, Jannuary/Jan, etc.] depending on space constraints in the report. Thus we have already computed and stored the same beforehand in different attributes in our date dimension table as it does not cost us much in terms of space or compute to have them.


Dim_Date
- Date Key
- Date
- Day
- Day Suffix
- Weekday
- Weekday Name
- Weekday Name Short
- Weekday Name FirstLetter
- Day Of Year
- Week Of Month
- Week Of Year
- Month
- Month Name
- Month Name Short
- Month Name FirstLetter
- Quarter
- Quarter Name
- Year
- MMYYYY
- Month Year
- Is Weekend
- Is Holiday
- Holiday Name
- Special Day
- First Date Of Year
- Last Date Of Year
- First Date Of Quater
- Last Date Of Quater
- First Date Of Month
- Last Date Of Month
- First Date Of Week
- Last Date Of Week


Dim_Loans
- Loan Key
- Floating/Fixed Interest Rate
- Type_of_Loan[Educational/Housing/Automobile/Personal/Corporate]
- Loan Duration[Total Number of Payments]
- Loan Issue date
- Loan Principal Amount
- Non performing Asset/ Performing Asset
- valid from Non Performing Asset[DATE]

Dim_Account
- Account_Key
- Account_id
- Account Open Date
- Account[Personal_Savings/Personal_Current/Fixed_Deposit/Corporate]

Bridge_Customer[Because it is slightly ragged]
- Account_Key
- Customer 1
- Customer 2
- Relationship with customer 2 
    - It is non standard to put this in a bridge table but we do not see any other appropriate place and this information may be useful at some point.

We do not not feel any weighing factor is appropriate here as joint accounts usually don't have any such factors involved. The corporates that have such a factor(due to share ownership distribution) don't make a joint account but have the name of their LLC as the customer name for their corporate account.

Dim_Customer
- Customer ID
- _Source Key
- Age
- Gender
- Credit Score
- Marital Status
- Assets
- KYC Done/KYC not Done
- City
- State
- Country

Dim_Branch
- Branch id
- Branch Name
- Branch Location
- Number of Employees
- Number of Customers
- Branch Type: Personal vs Corporate vs Rural
- City
- State
- Country

Fact_Loans
- Interest Rate
- Loan Repayment Sequence number
- Loan Repayment Amount
- Account Credit Score [max(Customer credit Scores) - Other customer penalties]
- Loan Key
- Account key
- Date key
- Branch Key

Fact_CustomerMetrics
- Credit Score
- Customer Key
- Date Key

Fact_AccountMetrics
- Current Account Balance
- Has a Loan / No Loans
- Number of Loans
- Account Key
- Date Key

# Steps to set up our BankOne Data Warehouse:

1. Create a database in MS SQL server called "BankOne_DW".
```sql
USE [master]
GO
DROP DATABASE IF EXISTS [BankOne_DW]
GO
CREATE DATABASE [BankOne_DW]
 CONTAINMENT = NONE
 ON  PRIMARY 

***********/
( NAME = N'BankOne_DW', FILENAME = N'{Local_Path}\BankOne_DW.mdf' , SIZE = 1581056KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BankOne_DW_log', FILENAME = N'{Local_Path}\BankOne_DW_log.ldf' , SIZE = 7610368KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BankOne_DW] SET COMPATIBILITY_LEVEL = 140
GO

USE [BankOne_DW]
GO

CREATE SCHEMA [int]
GO

```

2. Run `Create_Lineage_Table.sql` to create Incremental Loads and Lineage table.
3. Run `Populate_Lineage.sql` to populate lineage table.
4. Create Date Dimension table and populate it.
    1. First run `Create_Date_Dimension_schema.sql` to create the date dimension table schema.
    2. The script `Create_StoredProcedure_to_Generate_Dates.sql` generates all the dates between 2000-01-01 and 2025-12-31 as a Stored Procedure[SP]. Execute it.
        - It has the information on some of the holidays hardcoded but some are not as they vary by the year(eg., date of Diwali) and will need to be updated manually for each year.
    3. Run the SP using `Populate_Date_Dimension_table.sql`
5. Run `Dimension Tables\Create_Dim_Branch.sql` to create branch dimension table and populate it using `Populate_Branch_Dimension_table.sql` derived from `Dummy Data\Dim_Branch.xlsx`.
6. Create Customer Dimension Table using `Create_Dim_Customer_schema.sql`
7. Populate the Customer dimension table using `Populate_Customer_Dimension_table.sql` that is derived from `Dimension Tables\Dim_Customer.xlsx`.
8. Run `Dimension Tables\Create_Dim_Loans.sql` to create the schema for Loan dimension table and then run `Populate_Loans_Dimension_table.sql` to populate it based on `Dummy Data\Dim_Loans.xlsx`. Use only 60 loans. Add lineage.
9. Run `Dimension Tables\Create_Dim_Account.sql` to create the schema for Account dimension table and then run `Populate_Account_Dimension_table.sql` to populate it based on `Dummy Data\Dim_Account.xlsx`.
10. Run `Fact Tables\Bridge_Customer.sql` to create the schema for Customers_Bridge table and then run `Populate_Accounts_Customer_Bridge_table.sql` to populate it based on `Dummy Data\Bridge_Customer.xlsx`.
11. Run `Create_Fact_Loans_schema.sql` to create the loans fact table schema and then run `generate_fact_loans.py` by typing `python .\generate_fact_loans.py | Out-File -FilePath D:\populate_fact_sales.sql` to get sql queries to populate the loans fact table as well as update the loans table with appropriate values. Note that there is a dependency to `dateutil`. If not installed, install it with `pip install python-dateutil`. Add lineage.
12. Run `Populate_Account_Metrics_Fact_table.sql` based on `Dummy Data\Fact_Account_Metrics.xlsx`
13. Run `ForeignKey_relations.sql` to add the foreign key constraints.