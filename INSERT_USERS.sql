USE BudgetTrackingApp;
GO

-- View Users table before
SELECT * FROM [dbo].[User];
GO


-- Insert if username does not exist
-- Else, Update 
MERGE [dbo].[User] AS TARGET
USING 
	(VALUES
		('raagakrishna', 'mypassword', 'raaga_k@bbd.co.za', 'Raaga Krishna'),
		('second_username', 'second_password', 'second@bbd.co.za', 'Second Name')
	)
	AS SOURCE ([username]
				,[password]
				,[email]
				,[full_name])
	ON (TARGET.username = SOURCE.username)
	WHEN MATCHED THEN 
		UPDATE SET [password] = SOURCE.password
				,[email] = SOURCE.email
				,[full_name] = SOURCE.full_name
	WHEN NOT MATCHED THEN
		INSERT ([username]
				,[password]
				,[email]
				,[full_name]
			)
		VALUES (SOURCE.username
				,SOURCE.password
				,SOURCE.email
				,SOURCE.full_name
	);
GO 

-- View Users table after 
SELECT * FROM [dbo].[User];
GO

