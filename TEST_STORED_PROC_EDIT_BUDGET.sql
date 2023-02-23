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


-- create a Budget 
EXEC [dbo].[EditBudget] 
	@Username = @WhichUser, 
	@BudgetName = @BudgetName1,
	@BudgetTargetAmount = 100;

EXEC [dbo].[EditBudget] 
	@Username = @WhichUser, 
	@BudgetName = @BudgetName2,
	@BudgetTargetAmount = 200.50;

EXEC [dbo].[EditBudget] 
	@Username = @WhichUser, 
	@BudgetName = @BudgetName3,
	@BudgetTargetAmount = 300.50;

EXEC [dbo].[EditBudget] 
	@Username = @WhichUser2, 
	@BudgetName = @BudgetName4,
	@BudgetTargetAmount = 400.50;

SELECT * FROM [dbo].[Budget];
GO
