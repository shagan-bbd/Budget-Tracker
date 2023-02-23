USE ExpenseTracker;
GO

DECLARE @WhichUser VARCHAR(150);
SET @WhichUser = 'raagakrishna';

SELECT * FROM [dbo].[User];

-- create a user 
EXEC [dbo].[AddUser] 
	@Username = @WhichUser, 
	@Password = 'hello';

EXEC [dbo].[AddUser] 
	@Username = 'peter', 
	@Password = 'hello123';

SELECT * FROM [dbo].[User];
GO
