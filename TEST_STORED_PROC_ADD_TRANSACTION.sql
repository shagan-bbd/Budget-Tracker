USE BudgetTrackingAppFinal;
GO

DECLARE @WhichUser VARCHAR(150);
SET @WhichUser = 'raagakrishna';

DECLARE @WhichUser2 VARCHAR(150);
SET @WhichUser2 = 'shagan';


-- fixed 4 budget names 
DECLARE @BudgetName1 VARCHAR(150);
SET @BudgetName1 = 'Transport';

DECLARE @BudgetName2 VARCHAR(150);
SET @BudgetName2 = 'Household';

DECLARE @BudgetName3 VARCHAR(150);
SET @BudgetName3 = 'Savings';

DECLARE @BudgetName4 VARCHAR(150);
SET @BudgetName4 = 'Food';


-- fixed 4 budget trigger ref 
DECLARE @BudgetTrigger1 VARCHAR(150);
SET @BudgetTrigger1 = 'Fare';

DECLARE @BudgetTrigger2 VARCHAR(150);
SET @BudgetTrigger2 = 'Groceries';

DECLARE @BudgetTrigger3 VARCHAR(150);
SET @BudgetTrigger3 = 'Investment';

DECLARE @BudgetTrigger4 VARCHAR(150);
SET @BudgetTrigger4 = 'Restaurant';

SELECT * FROM [dbo].[User];

--SELECT * FROM [dbo].[Budget];

SELECT * FROM [dbo].[Transaction];


-- create a Budget 
EXEC [dbo].[AddTransaction] 
	@Username = @WhichUser,
	@TransactionDate = '2021-02-02', 
	@TransactionAmount = 100, 
	@TransactionReference = @BudgetTrigger2,
	@TransactionThirdParty = 'Pick n Pay';


EXEC [dbo].[AddTransaction] 
	@Username = @WhichUser,
	@TransactionDate = '2021-02-02', 
	@TransactionAmount = 245, 
	@TransactionReference = @BudgetTrigger2,
	@TransactionThirdParty = 'Woolworths';

EXEC [dbo].[AddTransaction] 
	@Username = @WhichUser,
	@TransactionDate = '2021-02-02', 
	@TransactionAmount = 123, 
	@TransactionReference = @BudgetTrigger3,
	@TransactionThirdParty = 'Clicks';

EXEC [dbo].[AddTransaction] 
	@Username = @WhichUser,
	@TransactionDate = '2021-02-02', 
	@TransactionAmount = 545, 
	@TransactionReference = @BudgetTrigger2,
	@TransactionThirdParty = 'Pick n Pay';


EXEC [dbo].[AddTransaction] 
	@Username = @WhichUser,
	@TransactionDate = '2021-02-02', 
	@TransactionAmount = 888, 
	@TransactionReference = @BudgetTrigger2,
	@TransactionThirdParty = 'Woolworths';

EXEC [dbo].[AddTransaction] 
	@Username = @WhichUser,
	@TransactionDate = '2021-02-02', 
	@TransactionAmount = 99.99, 
	@TransactionReference = @BudgetTrigger3,
	@TransactionThirdParty = 'Clicks';

--SELECT * FROM [dbo].[Budget];

SELECT * FROM [dbo].[Transaction];
GO

SELECT * FROM [dbo].[Income_Transaction];
GO

SELECT * FROM [dbo].[Expense_Transaction];
GO
