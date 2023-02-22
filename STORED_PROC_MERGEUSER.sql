USE BudgetTrackingApp;
GO

DROP PROCEDURE [dbo].[MergeUser];
GO

CREATE PROCEDURE [dbo].[MergeUser] (
		@Username nvarchar(150), 
		@Password nvarchar(50), 
		@Email nvarchar(100), 
		@FullName nvarchar(150)
	)
AS
BEGIN
	MERGE [User] AS TARGET
	USING (
		SELECT @Username as [username], @Password as [password], @Email as [email], @FullName as [fuull_name]
	)
	AS SOURCE 
	ON (TARGET.username = SOURCE.username)
	WHEN MATCHED THEN 
		UPDATE SET [password] = @Password, [email] = @Email, [full_name] = @FullName
	WHEN NOT MATCHED THEN
		INSERT ([username], [password], [email], [full_name])
		VALUES (@Username, @Password, @Email, @FullName
	);
END;
GO
