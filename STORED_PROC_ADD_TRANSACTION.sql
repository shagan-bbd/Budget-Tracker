USE BudgetTrackingAppFinal;
GO

DROP PROCEDURE [dbo].[AddTransaction];
GO

CREATE PROCEDURE [dbo].[AddTransaction] (
		@Username varchar(150),
		@TransactionDate DATE, 
		@TransactionAmount DECIMAL(12, 2), 
		@TransactionReference varchar(35),
		@TransactionThirdParty varchar(150)
	)
AS
BEGIN
	DECLARE @fk_user_id INT;
	SET @fk_user_id = (SELECT user_id FROM [dbo].[User] WHERE username = @Username);

	-- search for budget_id
	--DECLARE @fk_budget_id INT;
	--SET @fk_budget_id = (SELECT budget_id FROM [dbo].[Budget] WHERE budget_name = @BudgetName);

	MERGE [Transaction] AS TARGET
	USING (
		SELECT --@fk_budget_id as [fk_budget_id]
				--,
				@fk_user_id as [fk_user_id]
				, @TransactionDate as [transaction_date]
				, @TransactionAmount as [transaction_amount]
				, @TransactionReference as [transaction_reference]
				, @TransactionThirdParty as [transaction_3rdparty]
	)
	AS SOURCE 
	ON (--TARGET.fk_budget_id = SOURCE.fk_budget_id
		--AND 
		TARGET.fk_user_id = SOURCE.fk_user_id
		AND TARGET.transaction_reference = SOURCE.transaction_reference
	)
	WHEN MATCHED THEN 
		UPDATE SET [transaction_date] = @TransactionDate
				, [transaction_amount] = @TransactionAmount
				, [transaction_3rdparty] = @TransactionThirdParty
	WHEN NOT MATCHED THEN
		INSERT (--[fk_budget_id], 
				[fk_user_id],
				[transaction_date], [transaction_amount], [transaction_reference], [transaction_3rdparty])
		VALUES (--@fk_budget_id,
				@fk_user_id,
				@TransactionDate, @TransactionAmount, @TransactionReference, @TransactionThirdParty
	);
END;
GO