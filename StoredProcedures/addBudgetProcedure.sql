USE BudgetTrackingDB;
GO

DROP PROCEDURE IF EXISTS [dbo].[AddBudget];
GO

CREATE PROCEDURE [dbo].[AddBudget] (
		@email varchar(150), 
		@budgetName varchar(150),
		@budgetLimit VARCHAR(150)
	)
AS
BEGIN
	DECLARE @fk_userId INT;
	DECLARE @fk_periodID INT;
	SET @fk_userId = (SELECT userId FROM [dbo].[User] WHERE userEmail = @email);
	SET @fk_periodID = (SELECT periodId FROM [dbo].[Periods] WHERE fk_userId = @fk_userId);

	IF EXISTS (select budgetName from Budget where [budgetName]=@budgetName)
	BEGIN
		UPDATE [Budget]
			SET [budgetLimit] = @budgetLimit
	END
	ELSE
	BEGIN
		INSERT INTO [Budget]
					( [fk_userId]
					, [fk_periodID]
					, [budgetName]
					, [budgetLimit]
					)
		VALUES (  @fk_userId
				, @fk_periodID
				, @budgetName
				, @budgetLimit
		)
	END
END;
GO