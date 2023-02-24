USE BudgetTrackingDB
GO

EXEC [dbo].[AddBudget] @fk_userId = 1, @fk_periodId = 1, @budgetLimit = 500.00, @budgetName = 'Groceries';
EXEC [dbo].[AddBudget] @fk_userId = 1, @fk_periodId = 1, @budgetLimit = 1500.00, @budgetName = 'Rent';
EXEC [dbo].[AddBudget] @fk_userId = 1, @fk_periodId = 1, @budgetLimit = 100.00, @budgetName = 'Personal Care';
EXEC [dbo].[AddBudget] @fk_userId = 1, @fk_periodId = 1, @budgetLimit = 200.00, @budgetName = 'Entertainment';
GO

EXEC [dbo].[AddBudget] @fk_userId = 2, @fk_periodId = 2, @budgetLimit = 500.00, @budgetName = 'Takeaway';
EXEC [dbo].[AddBudget] @fk_userId = 2, @fk_periodId = 2, @budgetLimit = 1500.00, @budgetName = 'Toiletries';
EXEC [dbo].[AddBudget] @fk_userId = 2, @fk_periodId = 2, @budgetLimit = 100.00, @budgetName = 'Transport';
EXEC [dbo].[AddBudget] @fk_userId = 2, @fk_periodId = 2, @budgetLimit = 200.00, @budgetName = 'Entertainment';
GO
