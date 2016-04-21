use BankDataBase

select 'ClientList-id'=ClientList.id,'AccountList-id'=AccountList.id,money from ClientList left join AccountList on ClientList.id=AccountList.client_id	where money<=0 or money is null 
