USE BudgetTrackingDB;
GO

DROP PROCEDURE IF EXISTS [dbo].[AddBudget];
GO

CREATE PROCEDURE [dbo].[AddBudget] (
		@fk_userId INT, 
		@fk_periodID INT,
		@budgetLimit INT,
		@budgetName VARCHAR(150)
	)
AS
BEGIN
		MERGE [Budget] AS TARGET
	USING (
		SELECT @fk_userId as [fk_userId]
				, @fk_periodID as [fk_periodId]
				, @budgetLimit as [budgetLimit]
				, @budgetName as [budgetName]
	)
	AS SOURCE 
	ON (TARGET.fk_userId = SOURCE.fk_userId AND TARGET.budgetName = SOURCE.budgetName AND TARGET.fk_userId = SOURCE.fk_userId)
		WHEN MATCHED THEN 
		UPDATE SET budgetLimit = @budgetLimit 
		WHEN NOT MATCHED THEN
			INSERT ([fk_userId],[fk_periodId],[budgetLimit],[budgetName])
			VALUES (@fk_userId , @fk_periodID,@budgetLimit,@budgetName);
END;
GO