USE BudgetTrackingDB
GO

EXEC [dbo].[AddBudget] @fk_userId = 2, @fk_periodId = 2, @budgetLimit = 500.00, @budgetName = 'Groceries';
EXEC [dbo].[AddBudget] @fk_userId = 2, @fk_periodId = 2, @budgetLimit = 1500.00, @budgetName = 'Rent';
EXEC [dbo].[AddBudget] @fk_userId = 2, @fk_periodId = 2, @budgetLimit = 100.00, @budgetName = 'Personal Care';
EXEC [dbo].[AddBudget] @fk_userId = 2, @fk_periodId = 2, @budgetLimit = 200.00, @budgetName = 'Entertainment';
GO

EXEC [dbo].[AddBudget] @fk_userId = 3, @fk_periodId = 3, @budgetLimit = 600.00, @budgetName = 'Groceries';
EXEC [dbo].[AddBudget] @fk_userId = 3, @fk_periodId = 3, @budgetLimit = 2000.00, @budgetName = 'Rent';
EXEC [dbo].[AddBudget] @fk_userId = 3, @fk_periodId = 3, @budgetLimit = 150.00, @budgetName = 'Personal Care';
EXEC [dbo].[AddBudget] @fk_userId = 3, @fk_periodId = 3, @budgetLimit = 300.00, @budgetName = 'Entertainment';
GO

EXEC [dbo].[AddBudget] @fk_userId = 4, @fk_periodId = 4, @budgetLimit = 700.00, @budgetName = 'Groceries';
EXEC [dbo].[AddBudget] @fk_userId = 4, @fk_periodId = 4, @budgetLimit = 2500.00, @budgetName = 'Rent';
EXEC [dbo].[AddBudget] @fk_userId = 4, @fk_periodId = 4, @budgetLimit = 200.00, @budgetName = 'Personal Care';
EXEC [dbo].[AddBudget] @fk_userId = 4, @fk_periodId = 4, @budgetLimit = 400.00, @budgetName = 'Entertainment';
GO

EXEC [dbo].[AddBudget] @fk_userId = 5, @fk_periodId = 5, @budgetLimit = 800.00, @budgetName = 'Groceries';
EXEC [dbo].[AddBudget] @fk_userId = 5, @fk_periodId = 5, @budgetLimit = 3000.00, @budgetName = 'Rent';
EXEC [dbo].[AddBudget] @fk_userId = 5, @fk_periodId = 5, @budgetLimit = 250.00, @budgetName = 'Personal Care';
EXEC [dbo].[AddBudget] @fk_userId = 5, @fk_periodId = 5, @budgetLimit = 500.00, @budgetName = 'Entertainment';
GO

EXEC [dbo].[AddBudget] @fk_userId = 6, @fk_periodId = 6, @budgetLimit = 500.00, @budgetName = 'Groceries';
EXEC [dbo].[AddBudget] @fk_userId = 6, @fk_periodId = 6, @budgetLimit = 1000.00, @budgetName = 'Gasoline';
EXEC [dbo].[AddBudget] @fk_userId = 6, @fk_periodId = 6, @budgetLimit = 300.00, @budgetName = 'Personal Care';
EXEC [dbo].[AddBudget] @fk_userId = 6, @fk_periodId = 6, @budgetLimit = 200.00, @budgetName = 'Entertainment';
GO

EXEC [dbo].[AddBudget] @fk_userId = 7, @fk_periodId = 7, @budgetLimit = 800.00, @budgetName = 'Rent';
EXEC [dbo].[AddBudget] @fk_userId = 7, @fk_periodId = 7, @budgetLimit = 1500.00, @budgetName = 'Dining Out';
EXEC [dbo].[AddBudget] @fk_userId = 7, @fk_periodId = 7, @budgetLimit = 100.00, @budgetName = 'Books';
EXEC [dbo].[AddBudget] @fk_userId = 7, @fk_periodId = 7, @budgetLimit = 300.00, @budgetName = 'Travel';
GO

EXEC [dbo].[AddBudget] @fk_userId = 8, @fk_periodId = 8, @budgetLimit = 700.00, @budgetName = 'Electricity';
EXEC [dbo].[AddBudget] @fk_userId = 8, @fk_periodId = 8, @budgetLimit = 2000.00, @budgetName = 'Vacation';
EXEC [dbo].[AddBudget] @fk_userId = 8, @fk_periodId = 8, @budgetLimit = 150.00, @budgetName = 'Haircuts';
EXEC [dbo].[AddBudget] @fk_userId = 8, @fk_periodId = 8, @budgetLimit = 500.00, @budgetName = 'Shopping';
GO

EXEC [dbo].[AddBudget] @fk_userId = 9, @fk_periodId = 9, @budgetLimit = 600.00, @budgetName = 'Home Improvement';
EXEC [dbo].[AddBudget] @fk_userId = 9, @fk_periodId = 9, @budgetLimit = 2500.00, @budgetName = 'Clothing';
EXEC [dbo].[AddBudget] @fk_userId = 9, @fk_periodId = 9, @budgetLimit = 200.00, @budgetName = 'Gym Membership';
EXEC [dbo].[AddBudget] @fk_userId = 9, @fk_periodId = 9, @budgetLimit = 400.00, @budgetName = 'Streaming Services';
GO

EXEC [dbo].[AddBudget] @fk_userId = 10, @fk_periodId = 10, @budgetLimit = 900.00, @budgetName = 'Home Decor';
EXEC [dbo].[AddBudget] @fk_userId = 10, @fk_periodId = 10, @budgetLimit = 1800.00, @budgetName = 'Restaurant';
EXEC [dbo].[AddBudget] @fk_userId = 10, @fk_periodId = 10, @budgetLimit = 120.00, @budgetName = 'Subscriptions';
EXEC [dbo].[AddBudget] @fk_userId = 10, @fk_periodId = 10, @budgetLimit = 600.00, @budgetName = 'Hobbies';
GO

