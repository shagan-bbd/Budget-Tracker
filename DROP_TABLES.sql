-- DELETE ALL TABLES
USE BudgetTrackingApp;
GO


-- Delete Transaction table
DELETE FROM [dbo].[Transaction];
GO

DBCC CHECKIDENT ('Transaction', RESEED, 0);
GO

DROP TABLE [dbo].[Transaction];
GO


-- Delete Income
DELETE FROM [dbo].[Income];
GO

DBCC CHECKIDENT ('Income', RESEED, 0);
GO

DROP TABLE [dbo].[Income];
GO



-- Delete Expense
DELETE FROM [dbo].[Expense];
GO

DBCC CHECKIDENT ('Expense', RESEED, 0);
GO

DROP TABLE [dbo].[Expense];
GO


-- Delete Budget
DELETE FROM [dbo].[Budget];
GO

DBCC CHECKIDENT ('Budget', RESEED, 0);
GO

DROP TABLE [dbo].[Budget];
GO


-- Delete User
DELETE FROM [dbo].[User];
GO

DBCC CHECKIDENT ('User', RESEED, 0);
GO

DROP TABLE [dbo].[User];
GO


-- Delete Tax_Implication
--DELETE FROM [dbo].[Tax_Implication];
--GO

--DBCC CHECKIDENT ('Tax_Implication', RESEED, 0);
--GO

--DROP TABLE [dbo].[Tax_Implication];
--GO
