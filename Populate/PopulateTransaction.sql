USE BudgetTrackingDB;
GO
EXEC [dbo].[AddTransaction] 
		@Fk_budgetId = 5,
		@Fk_userId = 2, 
        @TransactionAmount = -80,
		@TransactionDate = '2023-03-08',
		@TransactionReference= 'BigMac from McDonalds',
			@Deleted = 0;
GO
EXEC [dbo].[AddTransaction] 
		@Fk_budgetId = 4,
		@Fk_userId = 1, 
        @TransactionAmount = -200,
		@TransactionDate = '2023-03-10',
		@TransactionReference= 'Go-carting at the mall',
		@Deleted = 0;
GO
EXEC [dbo].[AddTransaction] 
		@Fk_budgetId = 5,
		@Fk_userId = 2, 
        @TransactionAmount = -100,
		@TransactionDate = '2023-04-08',
		@TransactionReference= 'BigMac from McDonalds',
			@Deleted = 0;
GO
EXEC [dbo].[AddTransaction] 
		@Fk_budgetId = 5,
		@Fk_userId = 2, 
        @TransactionAmount = -60,
		@TransactionDate = '2023-03-30',
		@TransactionReference= 'KFC ',
			@Deleted = 0;
GO
EXEC [dbo].[AddTransaction] 
		@Fk_budgetId = 3,
		@Fk_userId = 1, 
        @TransactionAmount = -80,
		@TransactionDate = '2023-03-08',
		@TransactionReference= 'Cologne from some mall',
			@Deleted = 0;
GO
