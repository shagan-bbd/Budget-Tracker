
CREATE PROCEDURE [dbo].[AddBudgetSetting] (
        @fk_budgetId INT,
		@fk_userId INT,
		@budgetTrigger VARCHAR(150),
	)
AS
BEGIN

	MERGE [BudgetSetting] AS TARGET
	USING (
		SELECT @fk_budgetId as [fk_budgetId]
				, @fk_userId as [fk_userId]
				, @budgetTrigger as [budgetTrigger]
	)
	AS SOURCE 
	ON (TARGET.fk_budgetId = SOURCE.fk_budgetId AND TARGET.budgetTrigger = SOURCE.budgetTrigger AND TARGET.fk_userId = SOURCE.fk_userId)
		WHEN NOT MATCHED THEN
			INSERT ([fk_budgetId],[fk_userId],[budgetTrigger])
			VALUES (@fk_budgetId , @fk_userId,@BudgetTrigger);
	
END

GO