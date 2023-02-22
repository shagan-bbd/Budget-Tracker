USE BudgetTrackingApp;
GO



-- which user_id
DECLARE @WhichUser VARCHAR(150);
SET @WhichUser = 'second_username';
-- second_username
-- raagakrishna

(SELECT user_id FROM [dbo].[User] WHERE username = @WhichUser);


-- which budget_id 
DECLARE @WhichBudget VARCHAR(150);
SET @WhichBudget = 'Household';
-- Household
-- House


(SELECT budget_id FROM [dbo].[Budget] WHERE budget_name = @WhichBudget 
				AND fk_user_id = (SELECT user_id FROM [dbo].[User] WHERE username = @WhichUser));

-- which income_catergory_name 
DECLARE @WhichIncome VARCHAR(80);
SET @WhichIncome = 'Salary';
-- Salary 
-- Side Hassel
-- Inheritance 

(SELECT income_id FROM [dbo].[Income] WHERE income_category_name = @WhichIncome);


-- which expense_category_name
DECLARE @WhichExpense VARCHAR(80);
SET @WhichExpense = 'Pick n Pay';
-- Pick n Pay 

(SELECT expense_id FROM [dbo].[Expense] WHERE expense_category_name = @WhichExpense);

SELECT * FROM [dbo].[Transaction];

MERGE [dbo].[Transaction] AS TARGET 
USING 
	(VALUES
		((SELECT budget_id FROM [dbo].[Budget] WHERE budget_name = @WhichBudget 
				AND fk_user_id = (SELECT user_id FROM [dbo].[User] WHERE username = @WhichUser)),
			(SELECT income_id FROM [dbo].[Income] WHERE income_category_name = @WhichIncome),
			NULL,
			GETDATE(), 'My Salary', 200)
		,((SELECT budget_id FROM [dbo].[Budget] WHERE budget_name = @WhichBudget 
				AND fk_user_id = (SELECT user_id FROM [dbo].[User] WHERE username = @WhichUser)),
			NULL,
			(SELECT expense_id FROM [dbo].[Expense] WHERE expense_category_name = @WhichExpense),
			GETDATE(), 'My food', 700)
	)
	AS SOURCE ([fk_budget_id]
				,[fk_income_id]
				,[fk_expense_id]
				,[transaction_date]
				,[transaction_description]
				,[transaction_amount]
			)
	ON (TARGET.transaction_description = SOURCE.transaction_description)
	WHEN MATCHED THEN 
		UPDATE SET [transaction_date] = SOURCE.transaction_date
					,[transaction_amount] = SOURCE.transaction_amount
	WHEN NOT MATCHED THEN 
		INSERT ([fk_budget_id]
				,[fk_income_id]
				,[fk_expense_id]
				,[transaction_date]
				,[transaction_description]
				,[transaction_amount]
			)
		VALUES (SOURCE.fk_budget_id
				,SOURCE.fk_income_id
				,SOURCE.fk_expense_id
				,SOURCE.transaction_date
				,SOURCE.transaction_description
				,SOURCE.transaction_amount
	);
GO

SELECT * FROM [dbo].[Transaction];
GO



