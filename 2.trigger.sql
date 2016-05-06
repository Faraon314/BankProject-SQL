use SergeyDataBase;

alter trigger [dbo].b_trigger
on OperationLog
for insert
as
begin
--set summ of transaction
DECLARE @dmodey INT
set @dmodey=(select Summ from inserted)
if((select OperationType from inserted )='списание')set @dmodey=-@dmodey
--update account balance
update  AccountList set money=money+@dmodey where id=(select AccountID from inserted)

end

select * from OperationLog
select * from AccountList

INSERT INTO [dbo].[OperationLog]   VALUES (8,'пополнение',10,GETDATE())