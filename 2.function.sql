use BankDataBase
--list of of clients with negative balance
alter view negativeClients as
select 'id'=ClientList.id,Surname,Name,Patronymic from  AccountList  join ClientList on money<0 and ClientList.id=client_id group by ClientList.id,Surname,Name,Patronymic 
--get IsoSymbol fron IsoNumber
alter function CurrencyToString(@id int) 
returns char(1)
	begin
	return (select IsoSymbol from CurrencyList where IsoNumber=@id);
end

select  [dbo].CurrencyToString(3);

--get all account like string
alter function AccountsToString(@id int) 
returns varchar(200)
	begin
	
	declare @st varchar(200)
	set @st=' '
	DECLARE @account varCHAR(50)
	--declare cursor
	DECLARE db_cursor CURSOR FOR  
	SELECT CAST(id as varchar(10)) +'('+[dbo].CurrencyToString(currency_id)+'):'+CAST(money as varchar(10)) FROM AccountList WHERE  client_id=@id;
	--open cursor
	OPEN db_cursor  
	FETCH NEXT FROM db_cursor INTO @account 
	--begin cicle
		WHILE @@FETCH_STATUS = 0  
	BEGIN  
	       SET @st = @st + @account+' ; ';
      
       FETCH NEXT FROM db_cursor INTO @account  
	END   
	CLOSE db_cursor  
	
	DEALLOCATE db_cursor 
	return @st;
end

select  [dbo].AccountsToString(0);

alter function accountTable() 
returns @table TABLE  (id INT,FIO char(50),accounts varchar(200)) AS
	begin
	INSERT @table 
	select negativeClients.id,Surname+Name+Patronymic,[dbo].AccountsToString(negativeClients.id) from negativeClients 
		RETURN

end

select * from accountTable();

select * from AccountList where client_id=3