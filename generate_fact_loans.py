# from datetime import date, timedelta
import datetime
from dateutil.relativedelta import relativedelta
import random

"""
Generated using 
--stp_22june2020_4
select DATE(cand_date_of_birth + INTERVAL '22 year') as loan_issue_date,
extract(year from age(CURRENT_TIMESTAMP,cand_date_of_birth + INTERVAL '22 year')) * 12 + extract(month from age(CURRENT_TIMESTAMP, cand_date_of_birth + INTERVAL '22 year'))+1 as number_of_payments_till_today 
from hrm_mst_candidates hmc 
where cand_date_of_birth > '1994-01-01' and cand_date_of_birth <'1999-01-01'
"""

issue_date_list = [
('2019-03-12',27),
('2019-10-17',20),
('2020-05-23',13),
('2019-09-07',22),
('2019-08-26',22),
('2017-11-23',43),
('2019-01-05',30),
('2019-07-13',23),
('2018-12-23',30),
('2020-11-05',8),
('2018-05-11',37),
('2017-01-14',53),
('2017-04-07',51),
('2018-01-30',41),
('2018-06-10',36),
('2020-11-06',8),
('2018-04-04',39),
('2016-06-11',60),
('2016-10-21',56),
('2020-05-21',13),
('2020-05-12',13),
('2018-12-20',30),
('2018-11-15',31),
('2016-03-03',64),
('2020-07-13',11),
('2017-12-24',42),
('2018-02-27',40),
('2016-02-06',65),
('2016-08-31',58),
('2016-04-04',63),
('2017-08-28',46),
('2020-02-25',16),
('2018-01-21',41),
('2016-05-07',62),
('2020-11-27',7),
('2017-10-06',45),
('2016-07-01',60),
('2017-12-10',42),
('2019-07-19',23),
('2018-04-03',39),
('2017-01-01',54),
('2019-05-15',25),
('2016-08-21',58),
('2018-02-22',40),
('2020-09-25',9),
('2020-01-13',17),
('2016-10-05',57),
('2020-03-23',15),
('2020-12-27',6),
('2020-01-18',17),
('2018-02-24',40),
('2018-04-17',38),
('2020-11-26',7),
('2018-12-10',30),
('2016-01-07',66),
('2016-06-02',61),
('2016-09-28',57),
('2017-10-01',45),
('2019-08-28',22),
('2018-10-01',33)
]

for loan_number, date_tuple in enumerate(issue_date_list):
    loan_principal_amount = random.randrange(100000,2500000,10)
    loan_total_months = random.randrange(12,120,12)
    branch_key = random.randrange(1,20,1)
    chance = random.random()
    if chance > 0.5:
        is_floating = True
        type_of_interest_rate = "Floating"
    else:
        is_floating = False
        interest_rate = random.randrange(100,130,1) / 10
        type_of_interest_rate = "Fixed"

    print('''UPDATE [Dim_Loans] SET [Loan Principal Amount] = '''+ str(loan_principal_amount)+
    ''', [Loan Duration] = '''+str(loan_total_months)+
    ''', [Interest Rate] = \''''+type_of_interest_rate+
    '''\', [Loan Issue date] = \''''+date_tuple[0]+
    '''\' WHERE [Loan Key] = '''+str(loan_number+1)+''';''')

    for i in range(date_tuple[1]):
        if is_floating:
            interest_rate = random.randrange(100,130,1) / 10
        date_time_obj = datetime.datetime.strptime(date_tuple[0], '%Y-%m-%d')
        use_date = date_time_obj+relativedelta(months=+i)
        repayment_date = datetime.datetime.strftime(use_date,'%Y%m%d')
        # print(loan_number, "#", repayment_date)
        if i == 0:
            print('''INSERT into [dbo].[Fact_Loans] ([Loan Key], [Account Key], [Date Key], [Branch Key], [Interest Rate], [Loan Repayment Sequence Number],[Loan Repayment Amount], [Lineage Key]) VALUES ('''
            + str(loan_number+1) + ''','''
            + str(loan_number+1) + ''','''
            + str(repayment_date) + ''','''
            + str(branch_key)+''','''
            + str(interest_rate) + ''','''
            + str(i) + ''','''
            + str(0)
            + ''',7'''
            +''');''')
        else:
            print('''INSERT into [dbo].[Fact_Loans] ([Loan Key], [Account Key], [Date Key], [Branch Key], [Interest Rate], [Loan Repayment Sequence Number],[Loan Repayment Amount], [Lineage Key]) VALUES ('''
            + str(loan_number+1) + ''','''
            + str(loan_number+1) + ''','''
            + str(repayment_date) + ''','''
            + str(branch_key)+''','''
            + str(interest_rate) + ''','''
            + str(i) + ''','''
            + str(round((loan_principal_amount/loan_total_months)*(1+interest_rate/100),2))
            + ''',7'''
            +''');''')


