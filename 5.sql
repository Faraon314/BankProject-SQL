use BankDataBase

select AccountID,OperationType,Summ,Data from AccountList join OperationLog on AccountID=id and currency_id=1

--check request
select AccountID,OperationType,Summ,Data,currency_id from AccountList join OperationLog on AccountID=id