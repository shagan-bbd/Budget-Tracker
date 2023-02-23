USE BudgetTrackingAppFinal;
GO


SELECT * FROM [dbo].[Budget_Category];
GO

-- create a Budget_Category 
EXEC [dbo].[AddBudgetCategory] 
	@Name = 'Transport',
	@TriggerName = 'Fare';

EXEC [dbo].[AddBudgetCategory] 
	@Name = 'Household',
	@TriggerName = 'Groceries';

EXEC [dbo].[AddBudgetCategory] 
	@Name = 'Savings',
	@TriggerName = 'Investment';

EXEC [dbo].[AddBudgetCategory] 
	@Name = 'Food',
	@TriggerName = 'Restaurant';


SELECT * FROM [dbo].[Budget_Category];
GO
