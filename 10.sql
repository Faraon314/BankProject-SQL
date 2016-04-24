use BankDataBase

select CurrencyList.name,AccountNumber=count(CurrencyList.name)
 from AccountList join CurrencyList on IsoNumber=AccountList.currency_id group by CurrencyList.name
