USE BudgetTrackingDB;
GO

EXEC [dbo].[AddBudgetSetting] 
        @Fk_budgetId = 1,
		@Fk_userId = 1,
		@BudgetTrigger = 'Chicken';
GO
EXEC [dbo].[AddBudgetSetting] 
        @Fk_budgetId = 2,
		@Fk_userId = 1,
		@BudgetTrigger = 'Mr.Smith';
GO
EXEC [dbo].[AddBudgetSetting] 
        @Fk_budgetId = 3,
		@Fk_userId = 1,
		@BudgetTrigger = 'Cologne';
GO
EXEC [dbo].[AddBudgetSetting] 
        @Fk_budgetId = 4,
		@Fk_userId = 1,
		@BudgetTrigger = 'Movies';
GO
EXEC [dbo].[AddBudgetSetting] 
        @Fk_budgetId = 4,
		@Fk_userId = 1,
		@BudgetTrigger = 'Go-cart';
GO
EXEC [dbo].[AddBudgetSetting] 
        @Fk_budgetId = 5,
		@Fk_userId = 2,
		@BudgetTrigger = 'McDonalds';
GO
EXEC [dbo].[AddBudgetSetting] 
        @Fk_budgetId = 5,
		@Fk_userId = 2,
		@BudgetTrigger = 'KFC';
GO
EXEC [dbo].[AddBudgetSetting] 
        @Fk_budgetId = 6,
		@Fk_userId = 2,
		@BudgetTrigger = 'Tissue';
GO
		



