USE BudgetTrackingAppFinal;
GO


DECLARE @WhichUser VARCHAR(150);
SET @WhichUser = 'raagakrishna';

DECLARE @WhichUser2 VARCHAR(150);
SET @WhichUser2 = 'shagan';

SELECT * FROM [dbo].[User];
SELECT * FROM [dbo].[Budget];

-- create a user 
EXEC [dbo].[AddUser] 
	@Username = @WhichUser, 
	@Password = 'hello123', 
	@Email = 'raaga@gmail.com', 
	@FullName = 'Raaga Krishna';

EXEC [dbo].[AddUser] 
	@Username = @WhichUser2, 
	@Password = 'secret', 
	@Email = 'shagan@gmail.com', 
	@FullName = 'Shagan Plaatjies';

SELECT * FROM [dbo].[User];
SELECT * FROM [dbo].[Budget];