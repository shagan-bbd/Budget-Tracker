USE BudgetTrackingDB;
GO

DROP PROCEDURE IF EXISTS  [dbo].[AddTransaction];
GO

CREATE PROCEDURE [dbo].[AddTransaction] (
		@Fk_budgetId INT,
		@Fk_userId INT, 
        @TransactionAmount DECIMAL(12,2),
		@TransactionDate DATE, 
		@TransactionReference VARCHAR(32),
        @Deleted BIT
	)
AS
BEGIN
	INSERT INTO [Transaction]
				( [fk_budgetId]
				, [fk_userId] 
				, [transactionAmount]
                , [transactionDate]
				, [transactionReference]
				, [deleted]
				)
	VALUES (@Fk_budgetId 
			, @Fk_userId
			, @TransactionAmount
			, @TransactionDate
			, @TransactionReference 
            , @Deleted 
	);

END;
GO