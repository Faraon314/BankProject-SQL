use BankDataBase
alter proc MoneyMove(
@amout int,
@ac_id_out int,
@ac_id_in int
)as 
if((select currency_id from AccountList where @ac_id_out=id)=(select currency_id from AccountList where @ac_id_in=id))
	begin
	--trigger update table by itself
	insert into OperationLog values (@ac_id_in,'пополнение',@amout,GETDATE()); 
	insert into OperationLog values (@ac_id_out,'списание',@amout,GETDATE()); 
	end
	else select 'different currency'

exec MoneyMove @amout=90,@ac_id_out=17,@ac_id_in=15

select * from AccountList
select * from OperationLog