--script creates stored procedure to insert user into the database 
USE BudgetTrackingDB;
GO


DROP PROCEDURE  IF EXISTS [dbo].[AddPeriods];
GO

CREATE PROCEDURE [dbo].[AddPeriods] (
		@fk_userId INT,
		@startDate DATE,
		@frequency INT 
	)
AS
BEGIN

	MERGE [Periods] AS TARGET
	USING (
		SELECT @fk_userId as [fk_userId]
				, @startDate as [startDate]
				, @frequency as [frequency]
	)
	AS SOURCE 
	ON (TARGET.fk_userId = SOURCE.fk_userId)
	WHEN MATCHED THEN 
		UPDATE SET [startDate] = @startDate
				, [frequency] = @frequency
	WHEN NOT MATCHED THEN
		INSERT ([fk_userId],[startDate],  [frequency])
		VALUES (@fk_userId , @startDate, @frequency);
END

