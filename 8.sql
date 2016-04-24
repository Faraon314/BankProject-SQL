use BankDataBase

select ClientList.id,sum(money)
 from ClientList left join AccountList on ClientList.id=AccountList.client_id and money>=0  or money is null
  group by ClientList.id having sum(money)=0 or sum(money) is null
