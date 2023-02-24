USE BudgetTrackingDB
GO

 EXEC [dbo].[AddBudget] 
		@fk_userId = 1 , 
		@fk_periodId = 2,
		@budgetLimit = 100,
		@budgetName = 'Transport';
GO

 EXEC [dbo].[AddBudget] 
		@fk_userId = 2 , 
		@fk_periodId = 2,
		@budgetLimit = 500,
		@budgetName = 'Toiletries';
		GO

 EXEC [dbo].[AddBudget] 
		@fk_userId = 2 , 
		@fk_periodId = 2,
		@budgetLimit = 500,
		@budgetName = 'Toiletries';
 EXEC [dbo].[AddBudget] 
		@fk_userId = 2 , 
		@fk_periodId = 2,
		@budgetLimit = 800,
		@budgetName = 'Cellular';
		GO




