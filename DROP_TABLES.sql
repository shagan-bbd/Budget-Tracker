-- DELETE ALL TABLES
USE ExpenseTracker;
GO

-- Delete Expense table
DELETE FROM [dbo].[Expense]
GO

DBCC CHECKIDENT ('Expense', RESEED, 0);
GO

DROP TABLE [dbo].[Expense];
GO


-- Delete ExpenseLabel table
DELETE FROM [dbo].[ExpenseLabel]
GO

DBCC CHECKIDENT ('ExpenseLabel', RESEED, 0);
GO

DROP TABLE [dbo].[ExpenseLabel];
GO


-- Delete Payment table
DELETE FROM [dbo].[Payment]
GO

DBCC CHECKIDENT ('Payment', RESEED, 0);
GO

DROP TABLE [dbo].[Payment];
GO


-- Delete PurchaseCompany table
DELETE FROM [dbo].[PurchaseCompany]
GO

DBCC CHECKIDENT ('PurchaseCompany', RESEED, 0);
GO

DROP TABLE [dbo].[PurchaseCompany];
GO


-- Delete User table
DELETE FROM [dbo].[User];
GO

DBCC CHECKIDENT ('User', RESEED, 0);
GO

DROP TABLE [dbo].[User];
GO

