USE BudgetTrackingAppFinal;
GO

DROP PROCEDURE [dbo].[AddBudgetCategory];
GO

CREATE PROCEDURE [dbo].[AddBudgetCategory] (
		@Name nvarchar(150), 
		@TriggerName nvarchar(150)
	)
AS
BEGIN
	MERGE [Budget_Category] AS TARGET
	USING (
		SELECT @Name as [budget_category_name]
				, @TriggerName as [budget_category_trigger_reference]
	)
	AS SOURCE 
	ON (TARGET.budget_category_name = SOURCE.budget_category_name
		AND TARGET.budget_category_trigger_reference = SOURCE.budget_category_trigger_reference
	)

	WHEN NOT MATCHED THEN
		INSERT ([budget_category_name], [budget_category_trigger_reference])
		VALUES (@Name, @TriggerName)
	;
END;
GO