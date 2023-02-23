USE ExpenseTracker;
GO

DECLARE @WhichUser VARCHAR(150);
SET @WhichUser = 'raagakrishna';

DECLARE @WhichUser1 VARCHAR(150);
SET @WhichUser1 = 'peter';


SELECT * FROM [dbo].[User];
SELECT * FROM [dbo].[ExpenseLabel];

-- create a ExpenseLabel 
EXEC [dbo].[AddExpenseLabel] 
	@Username = @WhichUser, 
	@ExpenseLabel = "Food",
	@ExpenseLabelStartDate = '2021-01-12',
	@ExpenseLabelEndDate = '2021-02-23',
	@ExpenseLabelLimit = 10000.34;

EXEC [dbo].[AddExpenseLabel] 
	@Username = @WhichUser, 
	@ExpenseLabel = 'Vacation',
	@ExpenseLabelStartDate = '2021-01-12',
	@ExpenseLabelEndDate = '2021-02-23',
	@ExpenseLabelLimit = 100.34;

EXEC [dbo].[AddExpenseLabel] 
	@Username = @WhichUser1, 
	@ExpenseLabel = 'Food',
	@ExpenseLabelStartDate = '2021-01-12',
	@ExpenseLabelEndDate = '2021-12-23',
	@ExpenseLabelLimit = 300.34;

EXEC [dbo].[AddExpenseLabel] 
	@Username = @WhichUser1, 
	@ExpenseLabel = 'Vacation',
	@ExpenseLabelStartDate = '2021-01-12',
	@ExpenseLabelEndDate = '2021-02-23',
	@ExpenseLabelLimit = 200.34;


SELECT * FROM [dbo].[ExpenseLabel];
GO
