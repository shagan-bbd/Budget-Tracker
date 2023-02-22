USE BudgetTrackingApp;
GO

-- which user (username)
DECLARE @WhichUser VARCHAR(150);
SET @WhichUser = 'second_username';
-- second_username
-- raagakrishna

-- View Budget table before 
SELECT * FROM [dbo].[Budget];


-- Insert if budget_name and fk_user_id does not exist
-- else, Update 
MERGE [dbo].[Budget] AS TARGET 
USING 
	(VALUES
		((SELECT user_id FROM [dbo].[User] WHERE username = @WhichUser),'Household', GETDATE(), '', 5600),
		((SELECT user_id FROM [dbo].[User] WHERE username = @WhichUser),'House', GETDATE(), '', 3000)
	)
	AS SOURCE ([fk_user_id]
				,[budget_name]
				,[budget_start_date]
				,[budget_end_date]
				,[budget_target_amount]
			)
	ON (TARGET.budget_name = SOURCE.budget_name
		AND TARGET.fk_user_id = SOURCE.fk_user_id
		)
	WHEN MATCHED THEN 
		UPDATE SET [budget_start_date] = SOURCE.budget_start_date
					,[budget_end_date] = SOURCE.budget_end_date
					,[budget_target_amount] = SOURCE.budget_target_amount
	WHEN NOT MATCHED THEN 
		INSERT ([fk_user_id]
			,[budget_name]
			,[budget_start_date]
			,[budget_end_date]
			,[budget_target_amount]
			)
		VALUES (SOURCE.fk_user_id
				,SOURCE.budget_name
				,SOURCE.budget_start_date
				,SOURCE.budget_end_date
				,SOURCE.budget_target_amount
	);

-- View Budget table after 
SELECT * FROM [dbo].[Budget]
GO
