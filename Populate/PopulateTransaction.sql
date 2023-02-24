USE BudgetTrackingDB;
GO
EXEC [dbo].[AddTransaction] 
		@Fk_budgetId = 9,
		@Fk_userId = 1, 
        @TransactionAmount = 80,
		@TransactionDate = '2023-03-01', 
		@TransactionReference= "Gautrain Payment",
        @Deleted =0
	