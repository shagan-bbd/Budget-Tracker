USE ExpenseTracker;
GO

DROP PROCEDURE [dbo].[AddExpenseLabel];
GO

CREATE PROCEDURE [dbo].[AddExpenseLabel] (
		@Username nvarchar(150), 
		@ExpenseLabel nvarchar(150),
		@ExpenseLabelStartDate DATE,
		@ExpenseLabelEndDate DATE,
		@ExpenseLabelLimit DECIMAL(12, 2)
	)
AS
BEGIN
	DECLARE @fk_user_id INT;
	SET @fk_user_id = (SELECT user_id FROM [dbo].[User] WHERE user_name = @Username);

	MERGE [ExpenseLabel] AS TARGET
	USING (
		SELECT @fk_user_id as [fk_user_id]
				, @ExpenseLabel as [expense_label]
				, @ExpenseLabelStartDate as [expense_label_start_date]
				, @ExpenseLabelEndDate as [expense_label_end_date]
				, @ExpenseLabelLimit as [expense_label_limit]
	)
	AS SOURCE 
	ON (TARGET.fk_user_id = SOURCE.fk_user_id
		AND TARGET.expense_label = SOURCE.expense_label
	)
	WHEN MATCHED THEN 
		UPDATE SET [expense_label_start_date] = @ExpenseLabelStartDate
					, [expense_label_end_date] = @ExpenseLabelEndDate
					, [expense_label_limit] = @ExpenseLabelLimit
	WHEN NOT MATCHED THEN
		INSERT ([fk_user_id], [expense_label], [expense_label_start_date], [expense_label_end_date], [expense_label_limit])
		VALUES (@fk_user_id, @ExpenseLabel, @ExpenseLabelStartDate, @ExpenseLabelEndDate, @ExpenseLabelLimit)
	;
END;
GO