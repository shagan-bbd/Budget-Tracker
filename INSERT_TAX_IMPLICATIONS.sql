USE BudgetTrackingApp;
GO

-- View Tax_Implication table before
SELECT * FROM [dbo].[Tax_Implication];
GO

MERGE [dbo].[Tax_Implication] AS TARGET 
USING 
	(VALUES
		('Taxable'),
		('Not taxable')
	)
	AS SOURCE ([tax_implication_type])
	ON (TARGET.tax_implication_type = SOURCE.tax_implication_type)
	WHEN NOT MATCHED THEN 
		INSERT ([tax_implication_type])
		VALUES (SOURCE.tax_implication_type);
GO

-- View Tax_Implication table after
SELECT * FROM [dbo].[Tax_Implication];
GO
