USE ExpenseTracker;
GO

DROP PROCEDURE [dbo].[AddUser];
GO

CREATE PROCEDURE [dbo].[AddUser] (
		@Username nvarchar(150), 
		@Password nvarchar(50)
	)
AS
BEGIN
	MERGE [User] AS TARGET
	USING (
		SELECT @Username as [user_name], @Password as [password]
	)
	AS SOURCE 
	ON (TARGET.user_name = SOURCE.user_name)
	WHEN MATCHED THEN 
		UPDATE SET [password] = @Password
	WHEN NOT MATCHED THEN
		INSERT ([user_name], [password])
		VALUES (@Username, @Password
	);
END;
GO