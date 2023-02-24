use BudgetTrackingDB
GO
EXEC [dbo].[AddPeriods]
        @Fk_userId = 2,
		@StartDate = '2023-03-25',
		@Frequency = 1 ;
GO

EXEC [dbo].[AddPeriods]
        @Fk_userId = 1,
		@StartDate = '2023-03-25',
		@Frequency = 4 ;
GO
