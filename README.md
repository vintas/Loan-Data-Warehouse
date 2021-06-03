# Loan-Data-Warehouse
DW assignment to create a Data Warehouse for a bank for their Loans Department

Create a database in SQL server called "BankOne_DW"

We are following the Kimball Methodology

Fact_Loans
- Interest Rate
- Loan Repayment Sequence number
- Loan Repayment Amount
- Loan Key
- Account key
- Date key
- Branch Key

Dim_Loans
- Loan Key
- Floating/Fixed Interest Rate
- Type_of_Loan[Educational/Housing/Automobile/Personal/Corporate]
- Loan Duration[Total Number of Payments]
- Loan Principal Amount

Dim_Account
- Account_Key
- Account_id
- Account Open Date
- Account[Personal_Savings/Personal_Current/Fixed_Deposit/Corporate]

Bridge_Customer[Because it is slightly ragged]
- Customer 1
- Customer 2
- Nominee
- Relationship with customer 2
- Relationship with Nominee

Dim_Customer
- Customer ID
- Name
- Age
- Gender
- Credit Score
- Marital Status
- Assets
- City
- State
- Country

Dim_Branch
- Branch id
- Branch Name
- Branch Location
- Number of Employees
- Number of Customers
- Branch Type: Personal vs Corporate
- City
- State
- Country

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