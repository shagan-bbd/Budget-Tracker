USE BudgetTrackingApp;
GO


-- which tax implication to user 
DECLARE @WhichTaxImplication VARCHAR(80);
SET @WhichTaxImplication = 'Not Taxable';


-- View Expense table before 
SELECT * FROM [dbo].[Expense];


-- Insert if expense_category_name does not exist
-- else, Update
MERGE [dbo].[Expense] AS TARGET 
USING 
	(VALUES
		((SELECT tax_implication_id FROM [dbo].[Tax_Implication] WHERE tax_implication_type = @WhichTaxImplication),
			'Pick n Pay', 30, 'EFT')
	)
	AS SOURCE ([fk_tax_implication_id]
				,[expense_category_name]
				,[expense_frequency]
				,[payment_method]
			)
	ON (TARGET.expense_category_name = SOURCE.expense_category_name)
	WHEN MATCHED THEN 
		UPDATE SET [fk_tax_implication_id] = SOURCE.fk_tax_implication_id
					,[expense_frequency] = SOURCE.expense_frequency
					,[payment_method] = SOURCE.payment_method
	WHEN NOT MATCHED THEN
		INSERT ([fk_tax_implication_id]
				,[expense_category_name]
				,[expense_frequency]
				,[payment_method]
				)
		VALUES (SOURCE.fk_tax_implication_id
				,SOURCE.expense_category_name
				,SOURCE.expense_frequency
				,SOURCE.payment_method
		);
GO


-- View Expense table after 
SELECT * FROM [dbo].[Expense];
GO

