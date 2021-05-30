:connect 3146SMSSRG002\SQLEXPRESS -U sa -P 7XH2LKkkctEp
update Retail..Selling_RetailTransaction set IsCLosed=1 where RetailTransactionID in (select RetailTransactionId from Retail..Selling_RetailTransaction(nolock))
GO