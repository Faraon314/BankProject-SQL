use BankDataBase

alter trigger [dbo].Account_trigger
on AccountList
INSTEAD OF  delete
as
begin
declare @am int
set @am=(select money from deleted)

declare @cu_id int
set @cu_id=(select currency_id from deleted)

declare @cl_id int
set @cl_id=(select client_id from deleted)

if (@am=0)
	begin
	select 'Delete emty account'
	 delete from AccountList where id=(select id from deleted )
	 end
if (@am<0) select 'negative balance. Can not delete'

declare @AcAmount int
set @AcAmount=(select amount=count(id)  from AccountList where @cl_id=client_id and @cu_id=currency_id)

if(@AcAmount=1) and (@am>0) select 'Can not delete.Need new account'

declare @AcIdOut int
set @AcIdOut=(select id  from deleted)

declare @AcIdIn int
set @AcIdIn=(select TOP 1 id  from AccountList where @cl_id=client_id and @cu_id=currency_id and id!=@AcIdOut ORDER BY id )


if(@AcAmount>1) and (@am>0)
	begin
	 select 'Move money to new account'
	 exec MoneyMove @amout=@am,@ac_id_out=@AcIdOut,@ac_id_in=@AcIdIn 
	 delete from AccountList where id=@AcIdOut
	 end

end

INSERT INTO [dbo].[AccountList]  VALUES (15,1,getdate(),getdate()+0004-04-03,-100,0)
select * from [dbo].[AccountList] where client_id=1 and currency_id=1
delete  from AccountList where id=15

select * from [dbo].OperationLog