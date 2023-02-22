USE BudgetTrackingApp;
GO

--DELETE FROM [dbo].[User];
--GO

--DBCC CHECKIDENT ('User', RESEED, 0);
--GO

DECLARE @WhichUser VARCHAR(150);
SET @WhichUser = 'raagakrishna';

--DECLARE @WhichUser2 VARCHAR(150);
--SET @WhichUser2 = 'shagan';

SELECT * FROM [dbo].[User];

-- create a user 
EXEC [dbo].[MergeUser] 
	@Username = @WhichUser, 
	@Password = 'hello123', 
	@Email = 'raaga@gmail.com', 
	@FullName = 'Raaga Krishna';

--EXEC [dbo].[MergeUser] 
--	@Username = @WhichUser2, 
--	@Password = 'secret', 
--	@Email = 'shagan@gmail.com', 
--	@FullName = 'Shagan Plaatjies';


SELECT * FROM [dbo].[User];

SELECT * FROM [dbo].[Budget];

DECLARE @WhichBudget VARCHAR(150);
SET @WhichBudget = 'Personal Expenses';

-- create a budget 
EXEC [dbo].[AddBudget]
	@Username = @WhichUser,
	@BudgetName = @WhichBudget,
	@BudgetStartDate = '2012-05-22',
	@BudgetEndDate = '2022-02-22',
	@BudgetTargetAmount = 12000;

--EXEC [dbo].[AddBudget]
--	@Username = @WhichUser2,
--	@BudgetName = 'Groceries',
--	@BudgetStartDate = '2012-08-22',
--	@BudgetEndDate = '2022-02-22',
--	@BudgetTargetAmount = 12000;

--EXEC [dbo].[AddBudget]
--	@Username = @WhichUser2,
--	@BudgetName = 'Vacation',
--	@BudgetStartDate = '2002-05-22',
--	@BudgetEndDate = '2022-02-22',
--	@BudgetTargetAmount = 120000;

--EXEC [dbo].[AddBudget]
--	@Username = @WhichUser2,
--	@BudgetName = 'Renevations',
--	@BudgetStartDate = '2005-05-22',
--	@BudgetEndDate = '2022-02-22',
--	@BudgetTargetAmount = 2000;

SELECT * FROM [dbo].[Budget];

-- insert trasactions (inserts income and expense)
SELECT * FROM [dbo].[Income];
SELECT * FROM [dbo].[Expense];
SELECT * FROM [dbo].[Transaction];

EXEC [dbo].[InsertTransaction]
	@Username = @WhichUser,
	@BudgetName = @WhichBudget, 
	@TransactionDescription = 'My transaction expense', 
	@TransactionAmount  = -300, 
	@TransactionDate = '2020-09-09';

SELECT * FROM [dbo].[Income];
SELECT * FROM [dbo].[Expense];
SELECT * FROM [dbo].[Transaction];