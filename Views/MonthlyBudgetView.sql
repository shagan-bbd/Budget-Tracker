USE BudgetTrackingDB;
GO

DROP VIEW IF EXISTS [dbo].[MonthlyBudget];
GO

CREATE VIEW MonthlyBudget AS
SELECT budgetName, budgetLimit
FROM Budget INNER JOIN Periods 
ON Budget.fk_periodId = Periods.periodId
WHERE MONTH(Periods.startDate) = 3


SELECT [budgetName]
	,[budgetLimit]
FROM [BudgetTrackingDB].[dbo].[MonthlyBudget]