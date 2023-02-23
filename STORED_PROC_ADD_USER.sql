USE BudgetTrackingAppFinal;
GO

DROP PROCEDURE [dbo].[AddUser];
GO

CREATE PROCEDURE [dbo].[AddUser] (
		@Username nvarchar(150), 
		@Password nvarchar(50), 
		@Email nvarchar(100), 
		@FullName nvarchar(150)
	)
AS
BEGIN
	-- insert user 
	MERGE [User] AS TARGET
	USING (
		SELECT @Username as [username]
				, @Password as [password]
				, @Email as [email]
				, @FullName as [fuull_name]
	)
	AS SOURCE 
	ON (TARGET.username = SOURCE.username)
	WHEN MATCHED THEN 
		UPDATE SET [password] = @Password
				, [email] = @Email
				, [full_name] = @FullName
	WHEN NOT MATCHED THEN
		INSERT ([username], [password], [email], [full_name])
		VALUES (@Username, @Password, @Email, @FullName
	);

	-- insert 4 budgets 
	EXEC [dbo].[AddBudget] 
		@Username = @Username,
		@BudgetName = 'Transport',
		@BudgetTriggerReference = 'Fare';

	EXEC [dbo].[AddBudget] 
		@Username = @Username,
		@BudgetName = 'Household',
		@BudgetTriggerReference = 'Groceries';

	EXEC [dbo].[AddBudget] 
		@Username = @Username,
		@BudgetName = 'Savings',
		@BudgetTriggerReference = 'Investment';

	EXEC [dbo].[AddBudget] 
		@Username = @Username,
		@BudgetName = 'Food',
		@BudgetTriggerReference = 'Restaurant';
END;
GO