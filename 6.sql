use BankDataBase

select ClientList.id, amount=count(AccountList.client_id)from ClientList join AccountList on ClientList.id=AccountList.client_id 
 group by ClientList.id having count(AccountList.client_id)>=2


 