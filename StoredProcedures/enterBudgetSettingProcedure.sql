--script creates stored procedure to insert user into the database 
USE BudgetTrackingDB;
GO


DROP PROCEDURE  IF EXISTS [dbo].[AddBudgetSetting];
GO

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
	ON (TARGET.fk_budgetId = SOURCE.fk_budgetId AND TARGET.fk_userId = SOURCE.fk_userId )
	WHEN MATCHED THEN 
		INSERT INTO [BudgetSetting] (fk_budgetId,fk_userId,budgetTrigger)
		VALUES (@fk_budgetId , @fk_userId,@budgetTrigger) 
	
END

GO