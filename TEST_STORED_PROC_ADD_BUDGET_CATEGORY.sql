USE BudgetTrackingAppFinal;
GO


SELECT * FROM [dbo].[Budget_Category];
GO

-- create a Budget_Category 
EXEC [dbo].[AddBudgetCategory] 
	@Name = 'Vacation',
	@TriggerName = 'Flight tickets';

EXEC [dbo].[AddBudgetCategory] 
	@Name = 'Groceries',
	@TriggerName = 'Pick n Pay';

EXEC [dbo].[AddBudgetCategory] 
	@Name = 'Medication',
	@TriggerName = 'Clicks';

EXEC [dbo].[AddBudgetCategory] 
	@Name = 'Medication',
	@TriggerName = 'Dischem';


SELECT * FROM [dbo].[Budget_Category];
GO
