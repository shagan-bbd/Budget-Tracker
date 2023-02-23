--script creates stored procedure to insert user into the database 
USE BudgetTrackingDB;
GO


DROP PROCEDURE  IF EXISTS [dbo].[AddUser];
GO

CREATE PROCEDURE [dbo].[AddUser] (
		@userEmail varchar(320), 
	)
AS
BEGIN
	-- insert user 
	MERGE [User] AS TARGET
	USING (
		SELECT @userEmail as [userEmail]	
	)
	AS SOURCE 
	ON (TARGET.email = SOURCE.email)
	WHEN NOT MATCHED THEN
		INSERT ([userEmail])
		VALUES (@userEmail);
END

