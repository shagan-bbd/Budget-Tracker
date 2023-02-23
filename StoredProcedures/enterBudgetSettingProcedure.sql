
CREATE PROCEDURE [dbo].[AddBudgetSetting] (
        @Fk_budgetId INT,
		@Fk_userId INT,
		@BudgetTrigger VARCHAR(150)
	)
AS
BEGIN

	MERGE [BudgetSetting] AS TARGET
	USING (
		SELECT @Fk_budgetId as [fk_budgetId]
				, @Fk_userId as [fk_userId]
				, @BudgetTrigger as [budgetTrigger]
	)
	AS SOURCE 
	ON (TARGET.Fk_budgetId = SOURCE.Fk_budgetId AND TARGET.budgetTrigger = SOURCE.budgetTrigger AND TARGET.fk_userId = SOURCE.fk_userId)
		WHEN NOT MATCHED THEN
			INSERT ([fk_budgetId],[fk_userId],[budgetTrigger])
			VALUES (@Fk_budgetId , @Fk_userId,@BudgetTrigger);
	
END

GO