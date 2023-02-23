USE BudgetTrackingDB;
GO

EXEC [dbo].[AddBudgetSetting] 
        @Fk_budgetId = 4,
		@Fk_userId = 1,
		@BudgetTrigger = 'Gautrain';

SELECT * FROM BudgetSetting;