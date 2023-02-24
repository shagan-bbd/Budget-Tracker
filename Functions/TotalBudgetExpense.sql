USE BudgetTrackingDB
GO

DROP FUNCTION IF EXISTS [dbo].[udfTotalExpenses];
GO

CREATE FUNCTION [dbo].[udfTotalExpenses]
(
	@userId  INT,
	@budgetName VARCHAR(150)
)
RETURNS DECIMAL(12,2)
AS
BEGIN
  DECLARE @AvgAge int

  SELECT @AvgAge = SUM(ABS (transactionAmount))
  FROM Transactions INNER JOIN Budget ON Transactions.fk_budgetId = Budget.budgetId
  WHERE Transactions.fk_userId = @userId AND Budget.budgetName = @budgetName AND Transactions.transactionAmount<0

  RETURN @AvgAge
END

GO