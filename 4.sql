use BankDataBase
 
 alter view operationNumbers as 
 select id=AccountID,ammount=count(AccountID) from OperationLog group by AccountID

create view operationNumbersZero as 
select id,ammount=0 from AccountList left join OperationLog on AccountID=id where AccountID is null group by id 


SELECT   * from operationNumbersZero  
UNION 
SELECT   * from operationNumbers  