USE BudgetTrackingAppFinal;
GO

DROP PROCEDURE [dbo].[EditBudget];
GO

CREATE PROCEDURE [dbo].[EditBudget] (
		@Username nvarchar(150), 
		@BudgetName nvarchar(150),
		@BudgetTargetAmount DECIMAL(12,2)
	)
AS
BEGIN
	DECLARE @fk_user_id INT;
	SET @fk_user_id = (SELECT user_id FROM [dbo].[User] WHERE username = @Username);

	MERGE [Budget] AS TARGET
	USING (
		SELECT @fk_user_id as [fk_user_id]
				, @BudgetName as [budget_name]
				, @BudgetTargetAmount as [budget_target_amount]
	)
	AS SOURCE 
	ON (TARGET.fk_user_id = SOURCE.fk_user_id
		AND TARGET.budget_name = SOURCE.budget_name
	)
	WHEN MATCHED THEN 
		UPDATE SET [budget_target_amount] = @BudgetTargetAmount
	WHEN NOT MATCHED THEN
		INSERT ([fk_user_id], [budget_name], [budget_target_amount])
		VALUES (@fk_user_id, @BudgetName, @BudgetTargetAmount)
	;
END;
GO