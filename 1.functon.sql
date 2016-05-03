use BankDataBase
alter view Outcome as
select client_id,Summ from OperationLog join AccountList on OperationType='списание' and id=AccountID and Data>dateadd(yy,-2, GETDATE())

alter view Income as
select client_id,Summ from OperationLog join AccountList on OperationType='пополнение' and id=AccountID and Data>dateadd(yy,-2, GETDATE())

alter view SumOutcome as
select id, summa=sum(Summ) from ClientList left join Outcome on client_id=id group by id having sum(Summ)>0
UNION
select id, summa=0 from ClientList left join Outcome on client_id=id group by id having sum(Summ) is null
select * from SumOutcome
alter view SumIncome as
select id, summa=sum(Summ) from ClientList left join Income on client_id=id group by id having sum(Summ)>0
UNION
select id, summa=0 from ClientList left join Income on client_id=id group by id having sum(Summ) is null
select * from SumIncome

alter function ClientPerCent(@client_id int) 
returns real
	begin
	declare @s real
	set @s=9.0;

    declare @date_open datetime;
	set @date_open=(select TOP 1 data_open from AccountList where client_id=@client_id order by data_open ASC)

	declare @full_year int;
	set @full_year=year(getdate())-year(@date_open);
	set @s=@s-@full_year*0.1;

	declare @income real
	set @income= (select summa from SumIncome where @client_id=id)
	declare @outcome real
	set @outcome= (select summa from SumOutcome where @client_id=id)
	if(@outcome=0) 
		set @s=@s-0.5
	else 
		if(@income/@outcome>1) set @s=@s-@income/@outcome*0.1;
	
	if (@s<4) set @s=4

	return @s;
end


declare @client_id int
set @client_id=4

declare @date_open date;
set @date_open=(select TOP 1 data_open from AccountList where client_id=@client_id order by data_open ASC)
select @date_open
select GETDATE()
select year(getdate())-year(@date_open);

declare @income real
	set @income= (select summa from SumIncome where @client_id=id)
	declare @outcome real
	set @outcome= (select summa from SumOutcome where @client_id=id)
	select @income
	select @outcome

select [dbo].ClientPerCent(4);