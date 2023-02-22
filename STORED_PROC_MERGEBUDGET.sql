USE BudgetTrackingApp;
GO

DROP PROCEDURE [dbo].[AddBudget];
GO

CREATE PROCEDURE [dbo].[AddBudget] (
		@Username nvarchar(150), 
		@BudgetName nvarchar(150), 
		@BudgetStartDate DATE, 
		@BudgetEndDate DATE,
		@BudgetTargetAmount DECIMAL(12, 2)
	)
AS
BEGIN
	MERGE [Budget] AS TARGET
	USING (
		SELECT 
			(SELECT user_id FROM [dbo].[User] WHERE username = @Username) as [fk_user_id], 
			@BudgetName as [budget_name],
			@BudgetStartDate as [budget_start_date],
			@BudgetEndDate as [budget_end_date],
			@BudgetTargetAmount as [budget_target_amount]
	)
	AS SOURCE ([fk_user_id], [budget_name], [budget_start_date], [budget_end_date], [budget_target_amount])
	ON (TARGET.budget_name = SOURCE.budget_name AND TARGET.fk_user_id = SOURCE.fk_user_id)
	WHEN MATCHED THEN 
		UPDATE SET [budget_start_date] = @BudgetStartDate, [budget_end_date] = @BudgetEndDate, [budget_target_amount] = @BudgetTargetAmount
	WHEN NOT MATCHED THEN
		INSERT ([fk_user_id], [budget_name], [budget_start_date], [budget_end_date], [budget_target_amount])
		VALUES ((SELECT user_id FROM [dbo].[User] WHERE username = @Username), 
				@BudgetName, @BudgetStartDate, @BudgetEndDate, @BudgetTargetAmount
	);
END;
GO
