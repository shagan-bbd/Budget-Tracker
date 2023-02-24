USE master;
GO

IF EXISTS(select * from sys.databases where name='BudgetTrackingDB')
DROP DATABASE BudgetTrackingDB

CREATE DATABASE BudgetTrackingDB;
GO

USE BudgetTrackingDB;
GO  

CREATE TABLE [Users] (
  [userId] INT IDENTITY(1,1) NOT NULL,
  [userEmail] VARCHAR(320)
  CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED
	(
		[userId] ASC
	)
)
GO

CREATE TABLE [Budget] (
  [budgetId] INT IDENTITY(1,1) NOT NULL,
  [fk_userId] INT NOT NULL,
  [fk_periodId] INT  NOT NULL,
  [budgetLimit] INT NOT NULL,
  [budgetName] VARCHAR(150),
  CONSTRAINT [PK_Budget] PRIMARY KEY CLUSTERED
	(
		[budgetId] ASC
	)
)
GO
ALTER TABLE [Budget] ADD FOREIGN KEY ([fk_userId]) REFERENCES [Users] ([userId])
GO

CREATE TABLE [BudgetSetting] (
  [budgetSettingId] INT IDENTITY(1,1) NOT NULL,
  [fk_budgetId] INT  NOT NULL,
  [fk_userId] INT  NOT NULL,
  [budgetTrigger] VARCHAR(150)  NOT NULL,
  CONSTRAINT [PK_BudgetSetting] PRIMARY KEY CLUSTERED
	(
		[budgetSettingId] ASC
	)
)
GO
ALTER TABLE [BudgetSetting] ADD FOREIGN KEY ([fk_budgetId]) REFERENCES [Budget] ([budgetId])
GO
ALTER TABLE [BudgetSetting] ADD FOREIGN KEY ([fk_userId]) REFERENCES [Users] ([userId])
GO

CREATE TABLE [Periods] (
  [periodId] INT IDENTITY(1,1) NOT NULL,
  [fk_userId] INT NOT NULL,
  [startDate] DATE  NOT NULL,
  [frequency] INT  NOT NULL,
  CONSTRAINT [PK_Period] PRIMARY KEY CLUSTERED
	(
		[periodId] ASC
	)
)
GO
ALTER TABLE [Periods] ADD FOREIGN KEY ([fk_userId]) REFERENCES [Users] ([userId])
GO
ALTER TABLE [Budget] ADD FOREIGN KEY ([fk_periodId]) REFERENCES [Periods] ([periodId])
GO

CREATE TABLE [Transactions] (
  [transactionId] INT IDENTITY(1,1) NOT NULL,
  [fk_budgetId] INT NOT NULL,
  [fk_userId] INT NOT NULL,
  [transactionAmount] DECIMAL(12,2)  NOT NULL,
  [transactionDate] DATE  NOT NULL,
  [transactionReference] VARCHAR(32)  NOT NULL,
  [deleted] BIT NOT NULL DEFAULT (0),
  CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED
	(
		[transactionId] ASC
	)
)
GO
ALTER TABLE [Transaction] ADD FOREIGN KEY ([fk_userId]) REFERENCES [Users] ([userId])
GO
ALTER TABLE [Transaction] ADD FOREIGN KEY ([fk_budgetId]) REFERENCES [Budget] ([budgetId])
GO








