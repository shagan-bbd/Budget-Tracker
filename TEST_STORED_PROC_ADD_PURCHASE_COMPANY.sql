USE ExpenseTracker;
GO

DECLARE @WhichUser VARCHAR(150);
SET @WhichUser = 'raagakrishna';

DECLARE @WhichUser1 VARCHAR(150);
SET @WhichUser1 = 'peter';


SELECT * FROM [dbo].[User];
SELECT * FROM [dbo].[PurchaseCompany];

-- create a PurchaseCompany 
EXEC [dbo].[AddPurchaseCompany] 
	@Username = @WhichUser, 
	@PurchaseCompanyName = 'KFC';

EXEC [dbo].[AddPurchaseCompany] 
	@Username = @WhichUser, 
	@PurchaseCompanyName = 'Spur';

EXEC [dbo].[AddPurchaseCompany] 
	@Username = @WhichUser, 
	@PurchaseCompanyName = 'India';

EXEC [dbo].[AddPurchaseCompany] 
	@Username = @WhichUser1, 
	@PurchaseCompanyName = 'Romans Pizza';

EXEC [dbo].[AddPurchaseCompany] 
	@Username = @WhichUser1, 
	@PurchaseCompanyName = 'Italy';

EXEC [dbo].[AddPurchaseCompany] 
	@Username = @WhichUser1, 
	@PurchaseCompanyName = 'KFC';


SELECT * FROM [dbo].[PurchaseCompany];
GO
