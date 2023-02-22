USE BudgetTrackingApp;
GO

DROP PROCEDURE [dbo].[InsertTransaction];
GO

CREATE PROCEDURE [dbo].[InsertTransaction] (
		@Username nvarchar(150), 
		@BudgetName nvarchar(150), 
		@TransactionDescription nvarchar(1000), 
		@TransactionAmount DECIMAL(12,2), 
		@TransactionDate DATE
	)
AS
BEGIN
	DECLARE @fk_income_id INT;
	SET @fk_income_id = NULL;

	DECLARE @fk_expense_id INT;
	SET @fk_expense_id = NULL;
	
	IF (@TransactionAmount >= 0.0) 
	BEGIN
		-- create name for income_category_name
		DECLARE @income_category_name VARCHAR(80);
		SET @income_category_name = 'My category inc';

		-- insert into income table 
		MERGE [Income] AS TARGET 
		USING (
			SELECT
				@income_category_name as [income_category_name],
				'My source' as [income_source],
				2 as [income_frequency]
		)
		AS SOURCE ([income_category_name]
				,[income_source]
				,[income_frequency]
			)
		ON (TARGET.income_category_name = @income_category_name)
		WHEN MATCHED THEN 
			UPDATE SET [income_source] = SOURCE.income_source,
						[income_frequency] = SOURCE.income_frequency
		WHEN NOT MATCHED THEN 
			INSERT (
				[income_category_name],
				[income_source],
				[income_frequency])
			VALUES
				(SOURCE.income_category_name
				,SOURCE.income_source
				,SOURCE.income_frequency);

		-- get user id 
		SET @fk_income_id = (SELECT income_id FROM [dbo].[Income] WHERE income_category_name = @income_category_name)
	END

	IF (@TransactionAmount < 0)		
	BEGIN
		-- create name for income_category_name
		DECLARE @expense_category_name VARCHAR(80);
		SET @expense_category_name = 'My category exp';

		-- insert into expense table 
		MERGE [Expense] AS TARGET 
		USING (
			SELECT
				@expense_category_name as [expense_category_name],
				'My EFT' as [payment_method],
				2 as [expense_frequency]
		)
		AS SOURCE ([expense_category_name]
				,[payment_method]
				,[expense_frequency]
			)
		ON (TARGET.expense_category_name = @expense_category_name)
		WHEN MATCHED THEN 
			UPDATE SET [payment_method] = SOURCE.payment_method,
						[expense_frequency] = SOURCE.expense_frequency
		WHEN NOT MATCHED THEN 
			INSERT (
				[expense_category_name]
				,[expense_frequency]
				,[payment_method])
			VALUES
				(SOURCE.expense_category_name
				,SOURCE.expense_frequency
				,SOURCE.payment_method);

		-- get expense id 
		SET @fk_expense_id = (SELECT expense_id FROM [dbo].[Expense] WHERE expense_category_name = @expense_category_name)
	END

	MERGE [Transaction] AS TARGET
	USING (
		SELECT (SELECT budget_id FROM [dbo].[Budget] WHERE budget_name = @BudgetName 
				AND fk_user_id = (SELECT user_id FROM [dbo].[User] WHERE username = @Username)) as [fk_budget_id]
				, @fk_income_id as [fk_income_id]
				, @fk_expense_id as [fk_expense_id]
				, @TransactionDescription as [transaction_description]
				, @TransactionAmount as [transaction_amount]
				, @TransactionDate as [transaction_date]
	)
	AS SOURCE 
	ON (TARGET.transaction_description = SOURCE.transaction_description)
	WHEN MATCHED THEN 
		UPDATE SET [transaction_date] = @TransactionDate, [transaction_amount] = @TransactionAmount
	WHEN NOT MATCHED THEN
		INSERT ([fk_budget_id]
				,[fk_income_id]
				,[fk_expense_id]
				,[transaction_date]
				,[transaction_description]
				,[transaction_amount])
		VALUES (SOURCE.fk_budget_id
				,SOURCE.fk_income_id
				,SOURCE.fk_expense_id
				,SOURCE.transaction_date
				,SOURCE.transaction_description
				,SOURCE.transaction_amount
	);
END;
GO
