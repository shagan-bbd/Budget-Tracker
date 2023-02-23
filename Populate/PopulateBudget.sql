 EXEC [dbo].[AddBudget] 
		@Email='Michael@gmail.com', 
		@BudgetName ='Transport',
		@BudgetLimit = 500;
GO
SELECT * FROM BUDGET;
GO

