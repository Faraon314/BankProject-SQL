use BankDataBase
create proc MoneyMove(
@amout int,
@ac_id_out int,
@ac_id_in int
)as 
update  AccountList set money=money-@amout  where id=@ac_id_out; 
update  AccountList set money=money+@amout  where id=@ac_id_in;

insert into OperationLog values (@ac_id_in,'����������',@amout,GETDATE()); 
insert into OperationLog values (@ac_id_out,'��������',@amout,GETDATE()); 


exec MoneyMove @amout=10,@ac_id_out=5,@ac_id_in=4 

select * from OperationLog