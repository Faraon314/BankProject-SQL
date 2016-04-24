use BankDataBase
alter proc MoneyMove(
@amout int,
@ac_id_out int,
@ac_id_in int
)as 

insert into OperationLog values (@ac_id_in,'пополнение',@amout,GETDATE()); 
insert into OperationLog values (@ac_id_out,'списание',@amout,GETDATE()); 


exec MoneyMove @amout=10,@ac_id_out=5,@ac_id_in=4 

select * from OperationLog