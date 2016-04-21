use BankDataBase

select id,currency,data_open,data_close,money from AccountList join CurrencyList on CurrencyList.name=AccountList.currency