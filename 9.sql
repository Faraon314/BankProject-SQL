use BankDataBase

alter view Ryble_write_off as
select client_id,Summ from OperationLog join AccountList on OperationType='списание' and id=AccountID and currency_id=1;

select * from Ryble_write_off


select id, summa=sum(Summ) from ClientList left join Ryble_write_off on client_id=id group by id having sum(Summ)>0
UNION
select id, summa=0 from ClientList left join Ryble_write_off on client_id=id group by id having sum(Summ) is null



select * from OperationLog join AccountList on id=AccountID and currency_id=1 and OperationType='списание'