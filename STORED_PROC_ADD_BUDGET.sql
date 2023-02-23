USE BudgetTrackingAppFinal;
GO

DROP PROCEDURE IF EXISTS [dbo].[AddBudget];
GO

CREATE PROCEDURE [dbo].[AddBudget] (
		@Username nvarchar(150), 
		@BudgetName nvarchar(150),
		@BudgetTriggerReference VARCHAR(150)
	)
AS
BEGIN
	DECLARE @fk_user_id INT;
	SET @fk_user_id = (SELECT user_id FROM [dbo].[User] WHERE username = @Username);

	INSERT INTO [Budget]
				([fk_user_id]
				, [budget_name]
				, [budget_trigger_reference]
				)
	VALUES (@fk_user_id
			, @BudgetName
			, @BudgetTriggerReference
	);
END;
GO