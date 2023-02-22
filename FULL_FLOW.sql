USE BudgetTrackingApp;
GO

DECLARE @WhichUser VARCHAR(150);
SET @WhichUser = 'raagakrishna';

-- create a user 
EXEC [dbo].[MergeUser] 
	@Username = @WhichUser, 
	@Password = 'hello123', 
	@Email = 'raaga@gmail.com', 
	@FullName = 'Raaga Krishna';


SELECT * FROM [dbo].[User];


-- create a budget 
EXEC [dbo].[AddBudget]
	@Username = @WhichUser,
	@BudgetName = 'Personal Expenses',
	@BudgetStartDate = '2012-05-22',
	@BudgetEndDate = '2022-02-22',
	@BudgetTargetAmount = 12000;

SELECT * FROM [dbo].[Budget];