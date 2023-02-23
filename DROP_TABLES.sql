-- DELETE ALL TABLES
USE BudgetTrackingAppFinal;
GO

-- Delete Expense_Transaction table
DELETE FROM [dbo].[Expense_Transaction]
GO

DBCC CHECKIDENT ('Expense_Transaction', RESEED, 0);
GO

DROP TABLE [dbo].[Expense_Transaction];
GO



-- Delete Income_Transaction table
DELETE FROM [dbo].[Income_Transaction]
GO

DBCC CHECKIDENT ('Income_Transaction', RESEED, 0);
GO

DROP TABLE [dbo].[Income_Transaction];
GO


-- Delete Transaction table
DELETE FROM [dbo].[Transaction];
GO

DBCC CHECKIDENT ('Transaction', RESEED, 0);
GO

DROP TABLE [dbo].[Transaction];
GO


-- Delete Budget table
DELETE FROM [dbo].[Budget];
GO

DBCC CHECKIDENT ('Budget', RESEED, 0);
GO

DROP TABLE [dbo].[Budget];
GO



-- Delete User table
DELETE FROM [dbo].[User];
GO

DBCC CHECKIDENT ('User', RESEED, 0);
GO

DROP TABLE [dbo].[User];
GO

