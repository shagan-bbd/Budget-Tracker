--script creates stored procedure to insert user into the database 
USE BudgetTrackingDB;
GO


DROP PROCEDURE  IF EXISTS [dbo].[AddUser];
GO

CREATE PROCEDURE [dbo].[AddUser] (
		@UserEmail varchar(320)
	)
AS
BEGIN
	-- insert user 
	MERGE [Users] AS TARGET
	USING (
		SELECT @UserEmail as [userEmail]	
	)
	AS SOURCE 
	ON (TARGET.userEmail = SOURCE.userEmail)
	WHEN NOT MATCHED THEN
		INSERT ([userEmail])
		VALUES (@UserEmail);
END

