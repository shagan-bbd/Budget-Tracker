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

SELECT * FROM [dbo].[User];

SELECT * FROM [dbo].[Budget];

SELECT * FROM [dbo].[Transaction];


-- create a Budget 
EXEC [dbo].[AddTransaction] 
	@Username = @WhichUser2,
	@TransactionDate = '2021-02-02', 
	@TransactionAmount = 345, 
	@TransactionReference = 'Groceries',
	@TransactionThirdParty = 'Pick n Pay';

SELECT * FROM [dbo].[Budget];

SELECT * FROM [dbo].[Transaction];

GO

