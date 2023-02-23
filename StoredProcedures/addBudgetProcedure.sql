USE BudgetTrackingDB;
GO

DROP PROCEDURE IF EXISTS [dbo].[AddBudget];
GO

CREATE PROCEDURE [dbo].[AddBudget] (
		@Email VARCHAR(150), 
		@BudgetName VARCHAR(150),
		@BudgetLimit VARCHAR(150)
	)
AS
BEGIN
	DECLARE @Fk_userId INT;
	DECLARE @Fk_periodID INT;
	SET @Fk_userId = (SELECT userId FROM [dbo].[Users] WHERE userEmail = @Email);
	SET @fk_periodID = (SELECT periodId FROM [dbo].[Periods] WHERE fk_userId = @Fk_userId);

	INSERT INTO [Budget]
				( [fk_userId]
				, [fk_periodID]
				, [budgetName]
				, [budgetLimit]
				)
	VALUES (  @Fk_userId
			, @Fk_periodID
			, 	@BudgetName 
			, @BudgetLimit
	);
END;
GO