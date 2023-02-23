--script creates stored procedure to insert user into the database 
USE BudgetTrackingAppFinal;
GO


DROP PROCEDURE  IF EXISTS [dbo].[AddPeriods];
GO

CREATE PROCEDURE [dbo].[AddPeriods] (
		@Fk_userId INT,@StartDate DATE,@Frequency INT 
	)
AS
BEGIN
	MERGE [Periods] AS TARGET
	USING (
		SELECT @Fk_userId as [fk_userId]
				, @StartDate as [startDate]
				, @Frequency as [frequency]
	)
	AS SOURCE 
	ON (TARGET.fk_userId = SOURCE.fk_userId)
	WHEN MATCHED THEN 
		UPDATE SET [startDate] = @StartDate
				, [frequency] = @Frequency
	WHEN NOT MATCHED THEN
		INSERT ([fk_userId],[startDate],  [frequency])
		VALUES (@Fk_userId , @StartDate, @Frequency);
END

