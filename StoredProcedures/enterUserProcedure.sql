--script creates stored procedure to insert user into the database 
USE BudgetTrackingAppFinal;
GO


DROP PROCEDURE  IF EXISTS [dbo].[AddUser];
GO

CREATE PROCEDURE [dbo].[AddUser] (
		@Email varchar(320), 
	)
AS
BEGIN
	-- insert user 
	MERGE [User] AS TARGET
	USING (
		SELECT @Email as [email]	
	)
	AS SOURCE 
	ON (TARGET.email = SOURCE.email)
	WHEN NOT MATCHED THEN
		INSERT ([email])
		VALUES (@Email);
END

