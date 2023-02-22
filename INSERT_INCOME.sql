USE BudgetTrackingApp;
GO


-- which tax implication to user 
DECLARE @WhichTaxImplication VARCHAR(80);
SET @WhichTaxImplication = 'Taxable';


-- View Income table before 
SELECT * FROM [dbo].[Income];


-- Insert if income_category_name does not exist
-- else, Update
MERGE [dbo].[Income] AS TARGET 
USING 
	(VALUES
		--((SELECT tax_implication_id FROM [dbo].[Tax_Implication] WHERE tax_implication_type = @WhichTaxImplication),
		--	'Inheritance', 'Parents', 15)
		((SELECT tax_implication_id FROM [dbo].[Tax_Implication] WHERE tax_implication_type = @WhichTaxImplication),
			'Salary', 'BBD', 1)
		,((SELECT tax_implication_id FROM [dbo].[Tax_Implication] WHERE tax_implication_type = @WhichTaxImplication),
			'Side Hassel', 'Amazon', 4)
	)
	AS SOURCE ([fk_tax_implication_id]
				,[income_category_name]
				,[income_source]
				,[income_frequency]
			)
	ON (TARGET.income_category_name = SOURCE.income_category_name)
	WHEN MATCHED THEN 
		UPDATE SET [fk_tax_implication_id] = SOURCE.fk_tax_implication_id
					,[income_source] = SOURCE.income_source
					,[income_frequency] = SOURCE.income_frequency
	WHEN NOT MATCHED THEN
		INSERT ([fk_tax_implication_id]
				,[income_category_name]
				,[income_source]
				,[income_frequency]
				)
		VALUES (SOURCE.fk_tax_implication_id
				,SOURCE.income_category_name
				,SOURCE.income_source
				,SOURCE.income_frequency
		);
GO


-- View Income table after 
SELECT * FROM [dbo].[Income];
GO

