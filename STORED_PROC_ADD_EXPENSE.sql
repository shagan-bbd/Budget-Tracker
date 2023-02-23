USE ExpenseTracker;
GO

--DROP PROCEDURE [dbo].[AddExpense];
--GO

CREATE PROCEDURE [dbo].[AddExpense] (
		@Username nvarchar(150), 
		@BudgetName nvarchar(150),
		@PurchaseCompanyName nvarchar(150),
		@PaymentDescription nvarchar(150),
		@PaymentDate DATE,
		@PaymentAmount DECIMAL(12, 2)
	)
AS
BEGIN
	DECLARE @fk_user_id INT;
	SET @fk_user_id = (SELECT user_id FROM [dbo].[User] WHERE user_name = @Username);

	DECLARE @fk_expense_label_id INT;
	SET @fk_expense_label_id = (SELECT budget_id FROM [dbo].[ExpenseLabel] WHERE budget_name = @BudgetName);

	-- insert Payment 
	;
END;
GO