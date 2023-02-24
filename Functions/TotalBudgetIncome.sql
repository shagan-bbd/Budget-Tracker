USE BudgetTrackingDB
GO

DROP FUNCTION IF EXISTS [dbo].[udfTotalIncome];
GO

CREATE FUNCTION [dbo].[udfTotalIncome]
(
	@userId  INT,
	@budgetName VARCHAR(150)
)
RETURNS DECIMAL(12,2)
AS
BEGIN
  DECLARE @TotalIncome int

  SELECT @TotalIncome = SUM(ABS (transactionAmount))
  FROM Transactions INNER JOIN Budget ON Transactions.fk_budgetId = Budget.budgetId
  WHERE Transactions.fk_userId = @userId AND Budget.budgetName = @budgetName

  RETURN @TotalIncome
END

GO