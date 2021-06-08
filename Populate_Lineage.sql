--2
INSERT INTO BankOne_DW.[int].Lineage (TableName,StartLoad,FinishLoad,LastLoadedDate,Status,[Type])
	VALUES (N'Dim_Branch','2021-06-07 16:44:09.000','2021-06-07 16:44:19.000','2021-06-07 16:44:09.000',N'S',N'F');
--3
INSERT INTO BankOne_DW.[int].Lineage (TableName,StartLoad,FinishLoad,LastLoadedDate,Status,[Type])
	VALUES (N'Dim_Customer','2021-06-07 16:44:09.000','2021-06-07 16:44:19.000','2021-06-07 16:44:09.000',N'S',N'F');
--4
INSERT INTO BankOne_DW.[int].Lineage (TableName,StartLoad,FinishLoad,LastLoadedDate,Status,[Type])
	VALUES (N'Dim_Loans','2021-06-07 16:45:09.000','2021-06-07 16:45:19.000','2021-06-07 16:45:09.000',N'S',N'F');
--5
INSERT INTO BankOne_DW.[int].Lineage (TableName,StartLoad,FinishLoad,LastLoadedDate,Status,[Type])
	VALUES (N'Dim_Account','2021-06-07 16:46:09.000','2021-06-07 16:46:19.000','2021-06-07 16:46:09.000',N'S',N'F');
--6
INSERT INTO BankOne_DW.[int].Lineage (TableName,StartLoad,FinishLoad,LastLoadedDate,Status,[Type])
	VALUES (N'Bridge_Customer','2021-06-07 16:46:09.000','2021-06-07 16:46:19.000','2021-06-07 16:46:09.000',N'S',N'F');
--7
INSERT INTO BankOne_DW.[int].Lineage (TableName,StartLoad,FinishLoad,LastLoadedDate,Status,[Type])
	VALUES (N'Fact_Loans','2021-06-07 16:46:09.000','2021-06-07 16:46:19.000','2021-06-07 16:46:09.000',N'S',N'F');
--8
INSERT INTO BankOne_DW.[int].Lineage (TableName,StartLoad,FinishLoad,LastLoadedDate,Status,[Type])
	VALUES (N'Fact_Customer_Metrics','2021-06-07 16:46:09.000','2021-06-07 16:46:19.000','2021-06-07 16:46:09.000',N'S',N'F');
--9
INSERT INTO BankOne_DW.[int].Lineage (TableName,StartLoad,FinishLoad,LastLoadedDate,Status,[Type])
	VALUES (N'Fact_Account_Metrics','2021-06-07 16:46:09.000','2021-06-07 16:46:19.000','2021-06-07 16:46:09.000',N'S',N'F');


