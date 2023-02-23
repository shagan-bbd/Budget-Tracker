CREATE TABLE [User] (
  [userId] INT PRIMARY KEY NOT NULL,
  [userEmail] VARCHAR(320)
)
GO

CREATE TABLE [Budget] (
  [budgetId] INT PRIMARY KEY NOT NULL,
  [fk_userId] INT NOT NULL,
  [budgetLimit] INT,
  [budgetName] VARCHAR(150)
)
GO

CREATE TABLE [BudgetSetting] (
  [budgetSettingId] INT PRIMARY KEY NOT NULL,
  [fk_budgetId] INT,
  [fk_userId] INT,
  [budgetTrigger] VARCHAR(150)
)
GO

CREATE TABLE [Transaction] (
  [transactionId] INT PRIMARY KEY NOT NULL,
  [fk_budgetId] INT NOT NULL,
  [fk_periodId] INT NOT NULL,
  [fk_userId] INT NOT NULL,
  [transactionAmount] DECIMAL(12,2),
  [transactionDate] DATE,
  [transactionReference] VARCHAR(32),
  [deleted] BIT NOT NULL DEFAULT (0)
)
GO

CREATE TABLE [Period] (
  [periodId] INT PRIMARY KEY NOT NULL,
  [fk_userId] INT NOT NULL,
  [startDate] DATE,
  [frequency] INT
)
GO

ALTER TABLE [Budget] ADD FOREIGN KEY ([fk_userId]) REFERENCES [User] ([userId])
GO

ALTER TABLE [BudgetSetting] ADD FOREIGN KEY ([fk_budgetId]) REFERENCES [Budget] ([budgetId])
GO

ALTER TABLE [Budget] ADD FOREIGN KEY ([budgetId]) REFERENCES [Transaction] ([fk_budgetId])
GO

ALTER TABLE [Transaction] ADD FOREIGN KEY ([fk_periodId]) REFERENCES [Period] ([periodId])
GO

ALTER TABLE [Period] ADD FOREIGN KEY ([fk_userId]) REFERENCES [User] ([userId])
GO

ALTER TABLE [BudgetSetting] ADD FOREIGN KEY ([fk_userId]) REFERENCES [User] ([userId])
GO

ALTER TABLE [Transaction] ADD FOREIGN KEY ([fk_userId]) REFERENCES [User] ([userId])
GO
