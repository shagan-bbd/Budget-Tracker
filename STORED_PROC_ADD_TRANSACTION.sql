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

	INSERT INTO [Transaction]
				([fk_user_id]
				, [transaction_date]
				, [transaction_amount]
				, [transaction_reference]
				, [transaction_3rdparty]
				)
	VALUES (@fk_user_id
			, @TransactionDate
			, @TransactionAmount
			, @TransactionReference
			, @TransactionThirdParty
	);

END;
GO