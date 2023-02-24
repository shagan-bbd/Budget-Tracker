USE BudgetTrackingDB;
GO

DROP PROCEDURE IF EXISTS  [dbo].[AddTransaction];
GO

CREATE PROCEDURE [dbo].[AddTransaction] (
		@fk_budgetId INT,
		@fk_userId INT, 
        @transactionAmount DECIMAL(12,2)
		@transactionDate DATE, 
		@transactionReference VARCHAR(32),
        @deleted BIT
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
	VALUES (@fk_budgetId 
			, @fk_userId
			, @transactionAmount
			, @transactionDate
			, @transactionReference 
            , @deleted 
	);

END;
GO