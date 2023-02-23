USE BudgetTrackingAppFinal;
GO

DECLARE @WhichUser VARCHAR(150);
SET @WhichUser = 'raagakrishna';

DECLARE @WhichUser2 VARCHAR(150);
SET @WhichUser2 = 'shagan';


SELECT * FROM [dbo].[User];

SELECT * FROM [dbo].[Budget_Category];

SELECT * FROM [dbo].[Budget];

-- create a Budget 
EXEC [dbo].[AddBudget] 
	@Username = @WhichUser, 
	@BudgetName = 'Food',
	@BudgetStartDate = '2021-02-10',
	@BudgetEndDate = '2021-02-22',
	@BudgetTargetAmount = 12000.50;

	-- Food 
		-- KFC 
		-- McDonalds 
		--
	-- Groceries 
		-- Pick n Pay 
		-- Woolworths 
	-- Education 
		-- Student loan 
	-- Tour 
		-- Sasol
		-- Engen 
	-- 



SELECT * FROM [dbo].[Budget];
GO
